import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'stream_subscribe_state.dart';
part 'stream_subscribe_cubit.freezed.dart';

/*class StreamSubscribeState<T> {
  const StreamSubscribeState();
  const factory StreamSubscribeState.loading() = _LoadingState;
  const factory StreamSubscribeState.neutral(T value) = _NeutralState<T>;
  const factory StreamSubscribeState.error(dynamic e) = _ErrorState;

  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(T value) neutral,
    required TResult Function(dynamic e) error,
  }) {
    if(this is _Neutral) return 
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(T value)? neutral,
    TResult Function(dynamic e)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(T value)? neutral,
    TResult Function(dynamic e)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }
}

class _LoadingState<T> extends StreamSubscribeState<T> {
  const _LoadingState();
}

class _ErrorState<T> extends StreamSubscribeState<T> {
  final dynamic e;
  const _ErrorState(this.e);
}

class _NeutralState<T> extends StreamSubscribeState<T> {
  final T value;
  const _NeutralState(this.value);
}*/

class StreamSubscribeCubit<T> extends Cubit<StreamSubscribeState<T>> {
  static Widget asWidget<T>(
      {required Stream<T> dataStream,
      required Widget Function(BuildContext, StreamSubscribeState<T>)
          builder}) {
    return BlocProvider<StreamSubscribeCubit<T>>(
      create: (c) => StreamSubscribeCubit(dataStream: dataStream),
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
