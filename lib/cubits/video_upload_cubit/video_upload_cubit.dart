import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:fingerfunke_app/cache/media_cache/media_cache.dart';
import 'package:fingerfunke_app/cache/media_cache/media_cache.impl.dart';
import 'package:fingerfunke_app/models/asset/asset.dart';
import 'package:fingerfunke_app/models/user/user.dart';
import 'package:fingerfunke_app/repositories/video_repository/video_repository.dart';
import 'package:fingerfunke_app/repositories/video_repository/video_repository.impl.dart';
import 'package:fingerfunke_app/utils/exceptions.dart';
import 'package:flutter/material.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

part 'video_upload_state.dart';
part 'video_upload_cubit.freezed.dart';

class AssetNotAvailableException implements Exception {}

class VideoUploadCubit extends Cubit<VideoUploadState> {
  final UserInfo author;
  final VideoRepository _videoRepository = VideoRepositoryImpl();
  final MediaCache _mediaCache = MediaCacheImpl();
  // to distinguish between different instances of class
  final String id = const Uuid().v4();

  // needed for uploading
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
  VideoUploadCubit.fromFile(File video, this.author)
      : super(const VideoUploadState.initial()) {
    _createThumbnailFromVideoFile(video);
    _uploadVideo(video);
  }

  /// Sometimes we just want to be able to show an already existing asset (mainly when editing a post)
  /// This allows us to do this while keeping same function set mainly possibility to delete video
  VideoUploadCubit.fromExistingAsset(VideoAsset videoAsset, this.author)
      : super(const VideoUploadState.initial()) {
    emit(VideoUploadState.uploaded(null, videoAsset));
    _createThumbnailFromNetworkAsset(videoAsset);
  }

  VideoAsset get asset {
    return state.maybeWhen(
        uploaded: (_, asset) => asset,
        orElse: () => throw AssetNotAvailableException());
  }

  /// Retry upload when previous upload failed during upload stage
  ///
  /// Will reuse same Video previously used (if there is one)
  /// if there is no video this funciton will do nothing
  void retryUpload() {
    state.maybeWhen(
        error: (_, __, video) {
          if (video != null) {
            _uploadVideo(video);
          }
        },
        orElse: () => throw InvalidStateException());
  }

  /// did this cubit sucesullfy upload its video
  bool hasUploaded() {
    return state.maybeWhen(uploaded: (_, __) => true, orElse: () => false);
  }

  Future<void> _uploadVideo(File video) async {
    try {
      if (_canUploadVideo()) {
        emit(VideoUploadState.uploading(video, thumbail));
        // To not create new assets when only the upload failed the upload url and asssetId are cached
        if (uploadUrl == null || assetId == null) {
          await _createAsset();
        }
        await _uploadVideoToMux(video);
        emit(VideoUploadState.processing(video, thumbail));
        final videoAsset = await _waitForVideoReady(assetId!);
        emit(VideoUploadState.uploaded(thumbail, videoAsset));
      }
    } catch (err) {
      emit(VideoUploadState.error(err, thumbnail: thumbail));
    }
  }

  /// create Mux Asset and store its values
  Future<void> _createAsset() async {
    Map<String, dynamic>? assetResponse;
    try {
      assetResponse = await _videoRepository.createVideoAsset();
    } catch (err) {
      // Todo it would be better if we were able to cancel the cloud function ourselves
      if (!isClosed) {
        emit(VideoUploadState.error(err, thumbnail: thumbail));
      }

      rethrow;
    }
    uploadUrl = assetResponse["uploadUrl"];
    assetId = assetResponse["id"];
  }

  /// upload video to Mux
  Future<void> _uploadVideoToMux(File video) async {
    final uploadResponse = _videoRepository.uploadVideo(video, uploadUrl!);
    _cancelToken = uploadResponse.cancelToke;
    try {
      await uploadResponse.response;
    } catch (error) {
      if (error is DioError) {
        if (error.type == DioErrorType.cancel) {
          print("dio request has been sucessfully canceled");
        } else {
          rethrow;
        }
      } else {
        rethrow;
      }
    }
  }

  /// subscribe to a temporary video asset in firestore
  /// wait until video changes its state to ready
  Future<VideoAsset> _waitForVideoReady(String id) {
    final Completer<VideoAsset> completer = Completer();
    _assetSubscription =
        _videoRepository.subscribeToTemporaryAsset(id).listen((asset) {
      switch (asset.state) {
        case asset_state.processing:
          {
            return;
          }
        case asset_state.ready:
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
  bool _canUploadVideo() {
    return state.maybeWhen(
        initial: () => true, error: (_, __, ___) => true, orElse: () => false);
  }

  Future<void> _createThumbnailFromVideoFile(File video) async {
    try {
      final Uint8List? thumbnailData =
          await VideoThumbnail.thumbnailData(video: video.path, quality: 50);
      final ImageProvider? thumbnail = thumbnailData!=null?MemoryImage(thumbnailData):null;
      _updateThumbnail(thumbnail);
    } catch (err) {
      print("Could not create thumbnail from video file");
    }
  }

  Future<void> _createThumbnailFromNetworkAsset(VideoAsset videoAsset) async {
    try {
      final String downloadUrl =
          _videoRepository.createThumbnailUrl(videoAsset);
      final thumbnail = await _mediaCache.getSingleImageFile(downloadUrl);
      _updateThumbnail(thumbnail);
    } catch (err) {
      print("Could not create thumbnail from Asset");
    }
  }

  /// return thumbnail information from current state
  ImageProvider? get thumbail {
    ImageProvider? thumbnail;
    state.whenOrNull(
        uploading: (_, thumb) => thumbnail = thumb,
        processing: (_, thumb) => thumbnail = thumb,
        uploaded: (thumb, _) => thumbnail = thumb,
        error: (_, thumb, __) => thumbnail = thumb);
    return thumbnail;
  }

  /// update thumbnail by reemiiting current state just with updated thmbnail data
  void _updateThumbnail(ImageProvider? thumbnail) {
    state.mapOrNull(
        uploading: (state) => emit(state.copyWith(thumbnail: thumbnail)),
        processing: (state) => emit(state.copyWith(thumbnail: thumbnail)),
        uploaded: (state) => emit(state.copyWith(thumbnail: thumbnail)),
        error: (state) => emit(state.copyWith(thumbnail: thumbnail)));
  }

  bool _mustCleanUpTemporaryAsset() => assetId != null;

  @override
  Future<void> close() {
    _cancelToken?.cancel();
    _assetSubscription?.cancel();

    if (_mustCleanUpTemporaryAsset()) {
      _videoRepository
          .deleteTemporaryAsset(assetId!)
          .then((_) => print("temporary asset deleted from firestore"))
          .catchError(
            (_) => print(
                "Temporary Video Asset has not been deleted from Firestore"),
          );
    }
    return super.close();
  }
}
