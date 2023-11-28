import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/asset/asset.dart';

part 'file_upload_state.freezed.dart';

@freezed
class FileUploadState with _$FileUploadState {
  const factory FileUploadState.initial() = _Initial;
  const factory FileUploadState.uploading(int progress) = _Uploading;
  const factory FileUploadState.processing() = _Processing;
  const factory FileUploadState.uploaded(Asset fileAsset) = _Uploaded;
  const factory FileUploadState.uploadError(
    Object error) = _UploadError;
}