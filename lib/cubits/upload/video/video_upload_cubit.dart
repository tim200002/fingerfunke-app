import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:uuid/uuid.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

import '../../../cache/media_cache/media_cache.dart';
import '../../../models/asset/asset.dart';
import '../../../repositories/video_repository/video_repository.dart';
import '../../../utils/exceptions.dart';
import '../../../utils/type_aliases.dart';
import '../file_upload_cubit.dart';
import '../file_upload_state.dart';

class BetterVideoUploadCubit extends Cubit<FileUploadState> implements FileUploadCubit {
  final VideoRepository _videoRepository = GetIt.I<VideoRepository>();
  final MediaCache _mediaCache = GetIt.I<MediaCache>();
  final Logger _logger = Logger();

  // to distinguish between different instances of this class
  final String id = const Uuid().v4();

  // file to be uploaded itself
  late final File? _video;

  // thumbnail of the video
  late final ImageProvider thumbnail;

  final Function? _onVideoUploaded;

  // required for uploading and upload control
  CancelToken? _cancelToken;
  StreamSubscription<VideoAsset>? _assetSubscription;
  String? assetId;
  String? uploadUrl;

  /// create a new Cubit from a given video file. Steps in the creation are
  ///
  /// 1) Create Asset in mux
  /// 2) Create temporary document in Firestore
  /// 3) upload Video to Mux
  /// 4) update temporary document once video has been updated
  BetterVideoUploadCubit.fromFile(File video, {Function? onVideoUploaded})
      : _onVideoUploaded = onVideoUploaded,
        _video = video,
        super(
          const FileUploadState.initial(),
        ) {
    _createThumbnailFromVideoFile(_video!).then((thumbnail) {
      this.thumbnail = thumbnail;
      _uploadVideo(_video!);
    }).catchError((err) {
      emit(FileUploadState.uploadError(err));
    });
  }

  /// Sometimes we just want to be able to show an already existing asset (mainly when editing a post)
  /// This allows us to do this while keeping same function set mainly possibility to delete video
  BetterVideoUploadCubit.fromExistingAsset(VideoAsset videoAsset)
      : _onVideoUploaded = null,
        super(
          const FileUploadState.initial(),
        ) {
    _createThumbnailFromNetworkAsset(videoAsset).then((thumbnail) {
      this.thumbnail = thumbnail;
      emit(FileUploadState.uploaded(videoAsset));
    }).catchError((err) {
      emit(FileUploadState.uploadError(err));
    });
  }

  Future<void> _uploadVideo(File video) async {
    try {
      if (_canUploadVideo) {
        emit(const FileUploadState.uploading(0));
        // To prevent creating new Asset when only upload failed, the Upload URL and assetIt are cached
        if (uploadUrl == null || assetId == null) {
          await _createAsset();
        }
        await _uploadVideoToMux();

        // after video is uploaded there is processing on the background, we need to wait for it to finish
        emit(const FileUploadState.processing());
        final videoAsset = await _waitForVideoReady(assetId!);

        emit(FileUploadState.uploaded(videoAsset));

        // call function if given
        _onVideoUploaded?.call();
      }
    } on DioError catch (err) {
      switch (err.type) {
        case DioErrorType.cancel:
          {
            _logger.i(
                "Dio Request has been sucessfully cancelled. We will just remain in current state since cubit will be closed any moment");
            return;
          }
        default:
          {
            rethrow;
          }
      }
    } catch (err) {
      emit(
        FileUploadState.uploadError(err),
      );
    }
  }

  /// Retry upload when previous upload failed during upload stage
  ///
  /// Will reuse same Video previously used (if there is one)
  /// if there is no video this function will do nothing
  @override
  void retryUpload() {
    state.maybeWhen(
        uploadError: (_) => _uploadVideo(_video!),
        orElse: () => throw InvalidStateException());
  }

  /// create Mux Asset and store its values
  Future<void> _createAsset() async {
    JsonMap assetResponse = await _videoRepository.createVideoAsset();

    uploadUrl = assetResponse["uploadUrl"];
    assetId = assetResponse["id"];
  }

  /// upload video to Mux
  Future<void> _uploadVideoToMux() async {
    assert(_video != null, "Video must be set before uploading");
    assert(uploadUrl != null, "Upload URL must be set before uploading");

    final uploadResponse = _videoRepository.uploadVideo(_video!, uploadUrl!,
        onSendProgress: (progress, total) {
      final int progressScaled = (progress / total * 80).toInt();
      emit(FileUploadState.uploading(progressScaled));
    });
    _cancelToken = uploadResponse.cancelToken;
    await uploadResponse.response;
  }

  /// subscribe to a temporary video asset in firestore
  /// wait until video changes its state to ready
  Future<VideoAsset> _waitForVideoReady(String id) {
    final Completer<VideoAsset> completer = Completer();
    _assetSubscription =
        _videoRepository.subscribeToTemporaryAsset(id).listen((asset) {
      switch (asset.state) {
        case AssetState.processing:
          {
            return;
          }
        case AssetState.ready:
          {
            completer.complete(asset);
            _assetSubscription?.cancel();
          }
      }
    });

    return completer.future;
  }

  /// helper function to check wheter current state even allows new upload started
  ///
  /// New uploads are only allowed in initial or error state
  bool get _canUploadVideo {
    return state.maybeWhen(
        initial: () => true, uploadError: (_) => true, orElse: () => false);
  }

  Future<ImageProvider> _createThumbnailFromVideoFile(File video) async {
    final Uint8List? thumbnailData =
        await VideoThumbnail.thumbnailData(video: video.path, quality: 50);

    if (thumbnailData == null) {
      throw Exception("Could not create thumbnail from video file");
    }

    return MemoryImage(thumbnailData);
  }

  Future<ImageProvider> _createThumbnailFromNetworkAsset(
      VideoAsset videoAsset) async {
    final String downloadUrl = _videoRepository.createThumbnailUrl(videoAsset);
    final thumbnail = await _mediaCache.getSingleImageFile(downloadUrl);
    return thumbnail;
  }

  @override
  bool get hasUploaded => state.maybeWhen(uploaded: (_) => true, orElse: () => false);

  @override
  Future<void> close() {
    _cancelToken?.cancel();
    _assetSubscription?.cancel();
    return super.close();
  }
}
