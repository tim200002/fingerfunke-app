import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import 'file_upload_state.dart';

abstract class FileUploadCubit extends Cubit<FileUploadState> {
  final String id = const Uuid().v4();

  void retryUpload();

  bool get hasUploaded =>
      state.maybeWhen(uploaded: (_) => true, orElse: () => false);

  ImageProvider get thumbnail;

  FileUploadCubit() : super(const FileUploadState.initial());
}
