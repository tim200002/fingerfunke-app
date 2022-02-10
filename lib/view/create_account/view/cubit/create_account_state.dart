part of 'create_account_cubit.dart';

@freezed
class CreateAccountState with _$CreateAccountState {
  const factory CreateAccountState(
      {required String name,
      @Default(false) bool inputValid}) = _CreateAccountState;
}
