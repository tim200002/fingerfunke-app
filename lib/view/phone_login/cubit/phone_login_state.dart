part of 'phone_login_cubit.dart';

@freezed
class PhoneLoginState with _$PhoneLoginState {
  const factory PhoneLoginState.enterPhoneNumber({String? withErrorMessage}) =
      _EnterPhoneNumber;
  const factory PhoneLoginState.waitForCodeSent() = _WaitForCodeSent;
  const factory PhoneLoginState.enterCode(
      {required String verificationId,
      required bool autoDetecting,
      String? withErrorMessage}) = _EnterCode;
  const factory PhoneLoginState.waitForLogIn() = _WaitForLogin;
}
