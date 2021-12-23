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
import 'package:uuid/uuid.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

part 'video_upload_state.dart';
part 'video_upload_cubit.freezed.dart';

class VideoUploadCubit extends Cubit<VideoUploadState> {
  final UserInfo author;
  final VideoRepository _videoRepository = VideoRepositoryImpl();
  final File video;
  final String id = const Uuid().v4();
  CancelToken? _cancelToken;
  StreamSubscription<VideoAsset>? _assetSubscription;
  Uint8List? thumbnail;
  String? assetId;
  String? uploadUrl;
  VideoUploadCubit(this.video, this.author)
      : super(const VideoUploadState.initial()) {
    _createThumbnail();
    uploadVideo();
  }

  Future<void> uploadVideo() async {
    try{
      if (_canUploadVideo()) {
        // To not create new assets when only the upload failed the upload url and asssetId are cached
        if (uploadUrl == null || assetId == null) {
          await _createAsset();
        }
        _uploadVideoToMux();
      }
    }catch(err){
      emit(VideoUploadState.error(thumbnail, err));
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
        initial: () => true, error: (_, __) => true, orElse: () => false);
  }

  Future<void> _createAsset() async {
    emit(VideoUploadState.uploading(thumbnail));
    Map<String, dynamic>? assetResponse;
    try {
      assetResponse = await _videoRepository.createVideoAsset();
    } catch (err) {
      // Todo it would be better if we were able to cancel the cloud function ourselves
      if (!isClosed) {
        emit(VideoUploadState.error(thumbnail, err));
      }

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
      if(error is DioError){
        if(error.type == DioErrorType.cancel){
           print("dio request has been sucessfully canceled");
        }else{
          completer.completeError(error, stackTrace);
        }
      }else{
        completer.completeError(error, stackTrace);
      }
      
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

  Future<void> _createThumbnail() async{
    try{
      thumbnail = await VideoThumbnail.thumbnailData(video: video.path, quality: 50);
      state.mapOrNull(
      uploading: (state) => emit(state.copyWith(thumbnail: thumbnail)),
      processing: (state) => emit(state.copyWith(thumbnail: thumbnail)),
      uploaded: (state) => emit(state.copyWith(thumbnail: thumbnail)),
      error: (state) => emit(state.copyWith(thumbnail: thumbnail)));
    }catch(err){
      print("Could not create thumbnail for video");
    }
  }
}
