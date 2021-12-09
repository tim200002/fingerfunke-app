import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:fingerfunke_app/models/asset/asset.dart';
import 'package:fingerfunke_app/models/user/user.dart';
import 'package:fingerfunke_app/repositories/video_repository/video_repository.dart';
import 'package:fingerfunke_app/repositories/video_repository/video_repository.impl.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

part 'video_upload_state.dart';
part 'video_upload_cubit.freezed.dart';

class VideoUploadCubit extends Cubit<VideoUploadState> {
  final UserInfo author;
  final VideoRepository _videoRepository = VideoRepositoryImpl();
  final File video;
  CancelToken? _cancelToken;
  StreamSubscription<VideoAsset>? _assetSubscription;
  Uint8List? thumbnail;
  String? assetId;
  String? uploadUrl;
  VideoUploadCubit(this.video, this.author) : super(const VideoUploadState.initial()) {
    createThumbnail();
    uploadVideo();
  }

  Future<void> uploadVideo() async {
    if (_canUploadVideo()) {
      // To not create new assets when only the upload failed the upload url and asssetId are cached
      if (uploadUrl == null || assetId == null) {
        await _createAsset();
      }
      _uploadVideoToMux();
    }
  }

  @override
  Future<void> close() {
    _cancelToken?.cancel();
    _assetSubscription?.cancel();

    if (assetId != null) {
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

  bool _canUploadVideo() {
    return state.maybeWhen(
        initial: () => true, error: (_) => true, orElse: () => false);
  }

  Future<void> _createAsset() async {
    emit(VideoUploadState.uploading(thumbnail));
    Map<String, dynamic>? assetResponse;
    try {
      assetResponse = await _videoRepository.createVideoAsset(author);
    } catch (err) {
      emit(VideoUploadState.error(err));
      rethrow;
    }
    uploadUrl = assetResponse["uploadUrl"];
    assetId = assetResponse["id"];
  }

  Future<void> _uploadVideoToMux() async {
    final uploadResponse = _videoRepository.uploadVideo(video, uploadUrl!);
    _cancelToken = uploadResponse.cancelToke;
    final Completer<void> completer = Completer();
    uploadResponse.response.then((value) {
      emit(VideoUploadState.processing(thumbnail));
      _subscribeToAsset(assetId!);
      _cancelToken = null;
      completer.complete();
    }).catchError((error, stackTrace) {
      completer.completeError(error, stackTrace);
    });
    return completer.future;
  }

  void _subscribeToAsset(String id) {
    _assetSubscription =
        _videoRepository.subscribeToTemporaryAsset(id).listen((asset) {
      switch (asset.state) {
        case asset_state.processing:
          {
            return;
          }
        case asset_state.ready:
          {
            emit(VideoUploadState.uploaded(thumbnail, asset));
            _assetSubscription?.cancel();
          }
      }
    });
  }

  void createThumbnail() {
    VideoThumbnail.thumbnailData(video: video.path, quality: 50).then((thumb) {
      thumbnail = thumb;
      state.mapOrNull(
          uploading: (state) => emit(state.copyWith(thumbnail: thumbnail)),
          processing: (state) => emit(state.copyWith(thumbnail: thumbnail)),
          uploaded: (state) => emit(state.copyWith(thumbnail: thumbnail)));
    });
  }
}
