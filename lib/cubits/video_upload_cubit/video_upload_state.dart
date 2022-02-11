part of 'video_upload_cubit.dart';

@freezed
class VideoUploadState with _$VideoUploadState {
  const factory VideoUploadState.initial() = _Initial;
  const factory VideoUploadState.uploading(
      File video, ImageProvider? thumbnail, int progress) = _Uploading;
  const factory VideoUploadState.processing(
      File video, ImageProvider? thumbnail) = _Processing;
  const factory VideoUploadState.uploaded(
      ImageProvider? thumbnail, VideoAsset asset) = _Uploaded;
  const factory VideoUploadState.uploadError(
    Object error, {
    required File video,
    ImageProvider? thumbnail,
  }) = _UploadError;
}
