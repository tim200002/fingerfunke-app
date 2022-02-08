import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:camera/camera.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'video_recorder_state.dart';
part 'video_recorder_cubit.freezed.dart';

/// Cubit for recording video with the accompaniing editor. Allows the
/// seamless transition between previewing, recording and viewing the result
/// while handling the management of resources and memory
class VideoRecorderCubit extends Cubit<VideoRecorderState> {
  VideoRecorderCubit() : super(const VideoRecorderState.camera());

  void onRecordingFinished(XFile file) {
    emit(VideoRecorderState.viewing(File(file.path)));
  }

  void recordNewVideoClip() {
    emit(const VideoRecorderState.camera());
  }
}
