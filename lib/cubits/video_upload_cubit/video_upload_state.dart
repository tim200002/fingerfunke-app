part of 'video_upload_cubit.dart';

@freezed
class VideoUploadState with _$VideoUploadState {
  const factory VideoUploadState.initial() = _Initial;
  const factory VideoUploadState.uploading(File video, Uint8List? thumbnail) = _Uploading;
  const factory VideoUploadState.processing(File video, Uint8List? thumbnail) = _Processing;
  const factory VideoUploadState.uploaded(Uint8List? thumbnail, VideoAsset asset) = _Uploaded;
  const factory VideoUploadState.error(Object error, {Uint8List? thumbnail, File? video}) = _Error;
}
