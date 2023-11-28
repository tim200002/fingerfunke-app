import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

part 'image_upload_cubit.freezed.dart';
part 'image_upload_state.dart';

/// Holds image upload functionality and data
class ImageUploadCubit extends Cubit<ImageUploadState> {
  ImageUploadCubit() : super(const Initial());

  /// Cropper plugin
  Future<void> cropImage() async {
    state.when(
        initial: () {},
        loaded: (File file) async {
          CroppedFile? cropped = await ImageCropper().cropImage(
            sourcePath: file.path,
            cropStyle: CropStyle.circle,
            aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
          );
          if (cropped == null) {
            emit(Loaded(file));
          }

          emit(Loaded(File(cropped!.path)));
        });
  }

  /// Select an image via gallery or camera
  Future<void> pickImage(ImageSource source) async {
    XFile? selected = await ImagePicker().pickImage(source: source);
    if (selected == null) {
      emit(const Initial());
    } else {
      final File file = File(selected.path);
      emit(Loaded(file));
    }
  }

  /// Remove image
  void clear() {
    emit(const Initial());
  }

  /// send image
  void send() {
    //TODO the image must be send to the server
    //TODO Add parameter to know where to send image
    clear();
  }
}
