part of 'mod_cubit.dart';

@freezed
class ModState with _$ModState {
  const factory ModState.loading() = _Loading;
  const factory ModState.error(dynamic e) = _Error;
  const factory ModState.empty() = _Empty;
  const factory ModState.neutral(Report report, int count) = _Neutral;
}
