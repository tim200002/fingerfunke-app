

import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

part 'image_upload_state.dart';
part 'image_upload_cubit.freezed.dart';

/// Holds image upload functionality and data
class ImageUploadCubit extends Cubit<ImageUploadState> {

  ImageUploadCubit() : super(const Initial());

  /// Cropper plugin
  Future<void> cropImage() async {
    state.when(
        initial: () {},
        loaded: (File file) async {
          File? cropped = await ImageCropper.cropImage(
            sourcePath: file.path,
          );
          emit(Loaded(cropped ?? file));
        });
  }

  /// Select an image via gallery or camera
  Future<void> pickImage(ImageSource source) async {
    XFile? selected = await ImagePicker().pickImage(source: source);
    final File file = File(selected!.path);
    emit(Loaded(file));
  }

  /// Remove image
  void clear() {
    emit(const Initial());
  }

  /// send image
  void send(){
    //TODO the image must be send to the server
    //TODO Add parameter to know where to send image
    clear();
  }
}
