part of 'phone_login_cubit.dart';

@freezed
class PhoneLoginState with _$PhoneLoginState {
  const factory PhoneLoginState.enterPhoneNumber({required bool isLoading}) =
      _EnterPhoneNumber;
  const factory PhoneLoginState.enterCode(
      {required String verificationId, int? resendToken}) = _EnterCode;
  const factory PhoneLoginState.authenticated() = _Authenticated;
}
