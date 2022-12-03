import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';
import 'package:uuid/uuid.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

import '../../cache/media_cache/media_cache.dart';
import '../../cache/media_cache/media_cache.impl.dart';
import '../../models/asset/asset.dart';
import '../../repositories/video_repository/video_repository.dart';
import '../../repositories/video_repository/video_repository.impl.dart';
import '../../utils/exceptions.dart';

part 'video_upload_cubit.freezed.dart';
part 'video_upload_state.dart';

class AssetNotAvailableException implements Exception {}

class VideoUploadCubit extends Cubit<VideoUploadState> {
  final VideoRepository _videoRepository = VideoRepositoryImpl();
  final MediaCache _mediaCache = MediaCacheImpl();
  // to distinguish between different instances of this class
  final String id = const Uuid().v4();

  final Function? _onVideoUploaded;

  final Logger _logger = Logger();

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
  VideoUploadCubit.fromFile(File video, {Function? onVideoUploaded})
      : _onVideoUploaded = onVideoUploaded,
        super(
          const VideoUploadState.initial(),
        ) {
    _createThumbnailFromVideoFile(video);
    _uploadVideo(video);
  }

  /// Sometimes we just want to be able to show an already existing asset (mainly when editing a post)
  /// This allows us to do this while keeping same function set mainly possibility to delete video
  VideoUploadCubit.fromExistingAsset(VideoAsset videoAsset)
      : _onVideoUploaded = null,
        super(const VideoUploadState.initial()) {
    emit(VideoUploadState.uploaded(null, videoAsset));
    _createThumbnailFromNetworkAsset(videoAsset);
  }

  /// Retry upload when previous upload failed during upload stage
  ///
  /// Will reuse same Video previously used (if there is one)
  /// if there is no video this funciton will do nothing
  void retryUpload() {
    state.maybeWhen(
        uploadError: (_, video, __) => _uploadVideo(video),
        orElse: () => throw InvalidStateException());
  }

  VideoAsset get asset {
    return state.maybeWhen(
        uploaded: (_, asset) => asset,
        orElse: () => throw AssetNotAvailableException());
  }

  /// did this cubit sucesullfy upload its video
  bool get hasUploaded {
    return state.maybeWhen(uploaded: (_, __) => true, orElse: () => false);
  }

  /// helper function to check wheter current state even allows new upload started
  ///
  /// New uploads are only allowed in initial or error state
  bool get _canUploadVideo {
    return state.maybeWhen(
        initial: () => true,
        uploadError: (_, __, ___) => true,
        orElse: () => false);
  }

  bool get _mustCleanUpTemporaryAsset => assetId != null;

  /// return thumbnail information from current state
  ImageProvider? get thumbail {
    ImageProvider? thumbnail;
    state.whenOrNull(
        uploading: (_, thumb, __) => thumbnail = thumb,
        processing: (_, thumb) => thumbnail = thumb,
        uploaded: (thumb, _) => thumbnail = thumb,
        uploadError: (_, __, thumb) => thumbnail = thumb);
    return thumbnail;
  }

  Future<void> _uploadVideo(File video) async {
    try {
      if (_canUploadVideo) {
        emit(VideoUploadState.uploading(video, thumbail, 0));
        // To prevent creating new Asset when only upload failed, the Upload URL and assetIt are cached
        if (uploadUrl == null || assetId == null) {
          await _createAsset();
        }
        await _uploadVideoToMux(video);
        emit(VideoUploadState.processing(video, thumbail));
        final videoAsset = await _waitForVideoReady(assetId!);
        emit(VideoUploadState.uploaded(thumbail, videoAsset));
        if (_onVideoUploaded != null) {
          _onVideoUploaded!();
        }
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
        VideoUploadState.uploadError(err, video: video, thumbnail: thumbail),
      );
    }
  }

  /// create Mux Asset and store its values
  Future<void> _createAsset() async {
    Map<String, dynamic> assetResponse =
        await _videoRepository.createVideoAsset();

    uploadUrl = assetResponse["uploadUrl"];
    assetId = assetResponse["id"];
  }

  /// upload video to Mux
  Future<void> _uploadVideoToMux(File video) async {
    emit(VideoUploadState.uploading(video, thumbail, 0));
    final uploadResponse = _videoRepository.uploadVideo(video, uploadUrl!,
        onSendProgress: (progress, total) {
      final int progressScaled = (progress / total * 80).toInt();
      emit(VideoUploadState.uploading(video, thumbail, progressScaled));
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

  Future<void> _createThumbnailFromVideoFile(File video) async {
    try {
      final Uint8List? thumbnailData =
          await VideoThumbnail.thumbnailData(video: video.path, quality: 50);
      final ImageProvider? thumbnail =
          thumbnailData != null ? MemoryImage(thumbnailData) : null;
      _updateThumbnail(thumbnail);
    } catch (err) {
      _logger.e("Could not create thumbnail from video File");
    }
  }

  Future<void> _createThumbnailFromNetworkAsset(VideoAsset videoAsset) async {
    try {
      final String downloadUrl =
          _videoRepository.createThumbnailUrl(videoAsset);
      final thumbnail = await _mediaCache.getSingleImageFile(downloadUrl);
      _updateThumbnail(thumbnail);
    } catch (err) {
      _logger.e("Could not create thumbnail from download URL of Asset");
    }
  }

  /// update thumbnail by reemiiting current state just with updated thmbnail data
  void _updateThumbnail(ImageProvider? thumbnail) {
    state.mapOrNull(
        uploading: (state) => emit(state.copyWith(thumbnail: thumbnail)),
        processing: (state) => emit(state.copyWith(thumbnail: thumbnail)),
        uploaded: (state) => emit(state.copyWith(thumbnail: thumbnail)),
        uploadError: (state) => emit(state.copyWith(thumbnail: thumbnail)));
  }

  @override
  Future<void> close() async {
    _logger.i("close");
    
    _cancelToken?.cancel();
    _assetSubscription?.cancel();

    if (_mustCleanUpTemporaryAsset) {
      _videoRepository
          .deleteTemporaryAsset(assetId!)
          .then((_) => _logger.i("temporary asset deleted from firestore"))
          .catchError(
            (_) => _logger
                .i("Temporary Video Asset has not been deleted from Firestore"),
          );
    }
    return super.close();
  }
}
