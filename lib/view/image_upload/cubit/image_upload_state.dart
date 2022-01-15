part of 'image_upload_cubit.dart';

@freezed
class ImageUploadState with _$ImageUploadState {
  const factory ImageUploadState.initial() = Initial;
  const factory ImageUploadState.loaded(File file) = Loaded;
}