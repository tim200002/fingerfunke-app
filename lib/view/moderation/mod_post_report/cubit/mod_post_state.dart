part of 'mod_post_cubit.dart';

@freezed
class ModPostState with _$ModPostState {
  const factory ModPostState.loading() = _Loading;
  const factory ModPostState.error(dynamic e) = _Error;
  const factory ModPostState.empty() = _Empty;
  const factory ModPostState.neutral(Report report, int count) = _Neutral;
}
