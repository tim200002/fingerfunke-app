part of 'video_upload_cubit.dart';

@freezed
class VideoUploadState with _$VideoUploadState {
  const factory VideoUploadState.initial() = _Initial;
  const factory VideoUploadState.uploading(Uint8List thumbnail) = _Uploading;
  const factory VideoUploadState.processing(Uint8List thumbnail) = _Processing;
  const factory VideoUploadState.uploaded(Uint8List thumbnail, VideoAsset asset) = _Uploaded;
  const factory VideoUploadState.error() = _Error;
}
