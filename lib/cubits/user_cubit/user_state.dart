part of 'user_cubit.dart';

@freezed
class UserState with _$UserState {
  const factory UserState.loading() = _L;
  const factory UserState.error(dynamic e) = _E;
  const factory UserState.neutral(User user) = _N;
}
