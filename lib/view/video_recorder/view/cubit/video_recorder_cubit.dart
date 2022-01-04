import 'package:bloc/bloc.dart';
import 'package:camera/camera.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fingerfunke_app/utils/type_aliases.dart';

part 'video_recorder_state.dart';
part 'video_recorder_cubit.freezed.dart';

class VideoRecorderCubit extends Cubit<VideoRecorderState> {
  VideoRecorderCubit() : super(VideoRecorderState.initial());
}
