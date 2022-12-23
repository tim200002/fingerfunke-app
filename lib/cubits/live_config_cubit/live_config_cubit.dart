import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'live_config_cubit.freezed.dart';
part 'live_configs.dart';
part 'live_config.dart';

class LiveConfigCubit extends Cubit<LiveConfigState> {
  LiveConfigCubit() : super(const LiveConfigState(false));

  void set(LiveConfigState state) => emit(state);
}

@freezed
class LiveConfigState with _$LiveConfigState {
  const factory LiveConfigState(bool hideFeedbackBtn) = _S;
}
