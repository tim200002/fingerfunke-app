import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:fingerfunke_app/models/asset/asset.dart';
import 'package:fingerfunke_app/repositories/video_repository/video_repository.dart';
import 'package:fingerfunke_app/repositories/video_repository/video_repository.impl.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'video_upload_state.dart';
part 'video_upload_cubit.freezed.dart';

class VideoUploadCubit extends Cubit<VideoUploadState> {
  final VideoRepository _videoRepository = VideoRepositoryImpl();
  final File video;
  CancelToken? _cancelToken;
  StreamSubscription<VideoAsset>? _assetSubscription;
  VideoUploadCubit(this.video) : super(const VideoUploadState.initial()) {
    uploadVideo();
  }

  Future<void> uploadVideo() async {
    if (_canUploadVideo()) {
      emit(VideoUploadState.uploading(Uint8List(1)));
      Map<String, dynamic>? assetResponse;
      try {
        assetResponse = await _videoRepository.createVideoAsset();
      } catch (err) {
        emit(const VideoUploadState.error());
        rethrow;
      }
      final String uploadUrl = assetResponse["uploadUrl"];
      final String assetId = assetResponse["id"];
      final uploadResponse = _videoRepository.uploadVideo(video, uploadUrl);
      _cancelToken = uploadResponse.cancelToke;
      final Completer<void> completer = Completer();
      uploadResponse.response.then((value) {
        emit(VideoUploadState.processing(Uint8List(0)));
        subscribeToAsset(assetId);
        _cancelToken = null;
        completer.complete();
      }).catchError((error, stackTrace) {
        completer.completeError(error, stackTrace);
      });
      return completer.future;
    }
  }

  void subscribeToAsset(String id) {
    _assetSubscription =
        _videoRepository.subscribeToTemporaryAsset(id).listen((asset) {
      switch (asset.state) {
        case asset_state.processing:
          {
            return;
          }
        case asset_state.ready:
          {
            emit(VideoUploadState.uploaded(Uint8List(0), asset));
            _assetSubscription?.cancel();
          }
      }
    });
  }

  @override
  Future<void> close() {
    _assetSubscription?.cancel();
    _cancelToken?.cancel();
    //ToDo Je nach Implementierung könnte es auch vorstellbar sein, dass
    // hier immer automatisch das erstellte Dokument wieder gelöscht wird
    // das muss man dann halt überall beachten
    return super.close();
  }


  bool _canUploadVideo() {
    return state.maybeWhen(
        initial: () => true, error: () => true, orElse: () => false);
  }
}
