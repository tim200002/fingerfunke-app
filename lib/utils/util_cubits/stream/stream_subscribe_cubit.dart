import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'stream_subscribe_state.dart';
part 'stream_subscribe_cubit.freezed.dart';

class StreamSubscribeCubit<T> extends Cubit<StreamSubscribeState<T>> {
  static Widget asWidget<T>(
      {required Stream<T> dataStream,
      required Widget Function(BuildContext, StreamSubscribeState<T>)
          builder}) {
    return BlocProvider<StreamSubscribeCubit<T>>.value(
      value: StreamSubscribeCubit(dataStream: dataStream),
      child: BlocBuilder<StreamSubscribeCubit<T>, StreamSubscribeState<T>>(
          builder: builder),
    );
  }

  StreamSubscription? _subscription;
  final Stream<T> dataStream;
  StreamSubscribeCubit({required this.dataStream})
      : super(const StreamSubscribeState.loading()) {
    reload();
  }

  reload() async {
    emit(const StreamSubscribeState.loading());
    await _subscription?.cancel();
    _subscription = dataStream.listen(
        (value) => emit(StreamSubscribeState.neutral(value)),
        onError: (e) => emit(StreamSubscribeState.error(e)));
  }

  @override
  Future<void> close() async {
    await _subscription?.cancel();
    return super.close();
  }
}
