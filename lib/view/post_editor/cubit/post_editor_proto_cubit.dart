import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:fingerfunke_app/cubits/video_upload_cubit/video_upload_cubit.dart';
import 'package:fingerfunke_app/models/user/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_editor_proto_state.dart';
part 'post_editor_proto_cubit.freezed.dart';

class PostEditorProtoCubit extends Cubit<PostEditorProtoState> {
  final UserInfo author;
  PostEditorProtoCubit(this.author) : super(const PostEditorProtoState([]));

  void addVideo(File video) {
    final VideoUploadCubit newCubit = VideoUploadCubit.fromFile(video, author);
    emit(state
        .copyWith(videoUploadCubits: [...state.videoUploadCubits, newCubit]));
  }

  void deleteVideo(String id) {
    final cubitToDelete =
        state.videoUploadCubits.firstWhere((cubit) => cubit.id == id);
    cubitToDelete.close();
    emit(state.copyWith(
        videoUploadCubits:
            state.videoUploadCubits.where((cubit) => cubit.id != id).toList()));
  }

  /// check over all cubits if they are finished with processing
  bool readyToUpload() {
    for (final cubit in state.videoUploadCubits) {
      final bool videoNotUploaded =
          cubit.state.maybeWhen(uploaded: (_, __) => false, orElse: () => true);
      if (videoNotUploaded) {
        return false;
      }
    }
    return true;
  }

  @override
  Future<void> close() {
    // we have to close our cubit instances ourselves since we did not use bloc porivder
    for (var cubit in state.videoUploadCubits) {
      cubit.close();
    }
    return super.close();
  }
}
