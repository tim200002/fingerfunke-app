import 'dart:async';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';

import '../../../models/asset/asset.dart';
import '../file_upload_cubit.dart';
import '../file_upload_state.dart';

class FirebaseFileUploadCubit extends FileUploadCubit {
  final FirebaseStorage _firebaseStorage = GetIt.I<FirebaseStorage>();
  final FirebaseFirestore _firebaseFirestore = GetIt.I<FirebaseFirestore>();

  final Logger _logger = Logger();
  final Function? _onFileUploaded;

  @override
  late final ImageProvider thumbnail;

  late final File? _file;

  // Required fro uploading and upload control
  FirebaseAsset? _asset;

  UploadTask? _uploadTask;
  StreamSubscription<TaskSnapshot>? _uploadTaskSubscription;

  FirebaseFileUploadCubit.fromFile(File file, {Function? onFileUploaded})
      : _onFileUploaded = onFileUploaded,
        _file = file {
    thumbnail = _createThumbnailFromFile(file);
    _uploadFlow();
  }

  FirebaseFileUploadCubit.fromExistingAsset(FirebaseAsset asset)
      : _onFileUploaded = null {
    thumbnail = _createThumbnailFromExistingAsset(asset);
    _asset = asset;
    emit(FileUploadState.uploaded(asset));
  }

  Future<void> _uploadFlow() async {
    try {
      if (_canUpload) {
        emit(const FileUploadState.uploading(0));

        // Check wheter asset has to be created newly. This is the case if asset was created succesfully
        // but upload failed
        // ignore: prefer_conditional_assignment
        if (_asset == null) {
          _asset = await _createTemporaryAsset();
        }

        _asset = await _uploadFileToStorage();
        emit(FileUploadState.uploaded(_asset!));

        // call funciton if given
        _onFileUploaded?.call();
      }
    } catch (err) {
      emit(FileUploadState.uploadError(err));
    }
  }

  /// create temporary asset to store the file in and create upload reference
  Future<FirebaseAsset> _createTemporaryAsset() async {
    assert(_asset == null, 'asset must be null');

    // create an unique id
    String assetId = const Uuid().v4();
    // create a ref to store the image in
    Reference ref =
        _firebaseStorage.ref().child('user_generated_content').child(assetId);

    // create a new document in the temporary assets collection
    final FirebaseAsset firebaseAsset = FirebaseAsset(
      id: assetId,
      creationTime: DateTime.now(),
      state: AssetState.processing,
      path: ref.fullPath,
      mediaType: FirebaseAsset.inferMediaTypeFromFile(_file!),
    );

    // add asset to temporary assets collection
    await _firebaseFirestore
        .collection('temporary_assets')
        .doc(assetId)
        .set(firebaseAsset.toJson());

    return firebaseAsset;
  }

  /// upload the file to the storage
  Future<FirebaseAsset> _uploadFileToStorage() async {
    assert(_asset != null, 'ref must not be null');

    Reference ref = _firebaseStorage.ref(_asset!.path);
    // create a task to upload the file
    _uploadTask = ref.putFile(_file!);

    // listen to the state changes of the upload task
    _uploadTaskSubscription =
        _uploadTask!.snapshotEvents.listen((TaskSnapshot snapshot) {
      final int progress =
          (snapshot.bytesTransferred / snapshot.totalBytes * 80).round();
      emit(FileUploadState.uploading(progress));
    }, onError: (err) {
      _logger.e('Error while uploading file: $err');
      _uploadTaskSubscription?.cancel();
      _uploadTask = null;
      _uploadTaskSubscription = null;
      emit(FileUploadState.uploadError(err));
    });

    final Completer<FirebaseAsset> completer = Completer();

    // wait for the upload to finish
    _uploadTask!.whenComplete(() async {
      emit(const FileUploadState.uploading(80));
      _uploadTaskSubscription?.cancel();
      _uploadTask = null;
      _uploadTaskSubscription = null;

      // get download url
      final String downloadUrl = await ref.getDownloadURL();

      FirebaseAsset updatedAsset = _asset!.copyWith(
        state: AssetState.ready,
        downloadUrl: downloadUrl,
      );

      // update asset state
      await _firebaseFirestore
          .collection('temporary_assets')
          .doc(_asset!.id)
          .update(updatedAsset.toJson());

      completer.complete(updatedAsset);
    });

    return completer.future;
  }

  /// helper function to check wheter current state even allows new upload started
  ///
  /// New uploads are only allowed in initial or error state
  bool get _canUpload {
    return state.maybeWhen(
        initial: () => true, uploadError: (_) => true, orElse: () => false);
  }

  @override
  void retryUpload() {
    _uploadFlow();
  }

  @override
  bool get hasUploaded {
    return state.maybeWhen(
        uploaded: (_) => true, uploadError: (_) => true, orElse: () => false);
  }

  ImageProvider _createThumbnailFromFile(File file) {
    // get matching thumbnail
    MediaType mediaType = FirebaseAsset.inferMediaTypeFromFile(file);
    if (mediaType == MediaType.image) {
      return FileImage(file);
    } else if (mediaType == MediaType.pdf) {
      return const AssetImage('assets/img/illustrations/pdf.jpg');
    } else {
      throw Exception('Unsupported media type');
    }
  }

  ImageProvider _createThumbnailFromExistingAsset(FirebaseAsset asset) {
    // get matching thumbnail
    MediaType mediaType = asset.mediaType;
    if (mediaType == MediaType.image) {
      assert(asset.downloadUrl != null, "download url must not be null");
      return CachedNetworkImageProvider(asset.downloadUrl!,
          errorListener: () => emit(FileUploadState.uploadError(
              'Could not load thumbnail from url: ${asset.downloadUrl}')));
    } else if (mediaType == MediaType.pdf) {
      return const AssetImage('assets/img/illustrations/pdf.jpg');
    } else {
      throw Exception('Unsupported media type');
    }
  }
}
