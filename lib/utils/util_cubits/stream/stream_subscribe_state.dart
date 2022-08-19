part of 'stream_subscribe_cubit.dart';

@freezed
class StreamSubscribeState<T> with _$StreamSubscribeState<T> {
  const factory StreamSubscribeState.loading() = _Loading;
  const factory StreamSubscribeState.neutral(T value) = _Neutral<T>;
  const factory StreamSubscribeState.error(dynamic e) = _Error;
}
