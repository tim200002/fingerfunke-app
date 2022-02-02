import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'live_config_state.dart';
part 'live_config_cubit.freezed.dart';

class LiveConfigCubit extends Cubit<LiveConfigState> {
  LiveConfigCubit() : super(const LiveConfigState.neutral(newFeedItems: true));

  void emitWith({bool? newFeedIcons}) {
    emit(state.copyWith(newFeedItems: newFeedIcons ?? state.newFeedItems));
  }
}
