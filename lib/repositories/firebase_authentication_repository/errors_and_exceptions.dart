import 'package:firebase_auth/firebase_auth.dart';



class LogOutFailure implements Exception {}

class VerifyPhoneNumberFailure implements Exception {
  const VerifyPhoneNumberFailure(
      [this.message = 'An unknown exception occurred.']);

  factory VerifyPhoneNumberFailure.fromCode(String code) {
    switch (code) {
      case 'invalid-phone-number':
        return const VerifyPhoneNumberFailure(
            'Phone number is not valid or badly formatted');
      default:
        {
          if (const bool.fromEnvironment("SHOW_VERBOSE_UI_ERROR_MESSAGES")) {
            return VerifyPhoneNumberFailure(
                'VerifyPhoneNumberFailure $code');
          }
          return const VerifyPhoneNumberFailure();
        }
    }
  }

  final String message;
}

class SignInWithCredentialFailure implements Exception {
  const SignInWithCredentialFailure(this.message);

  factory SignInWithCredentialFailure.fromCode(
      FirebaseAuthException exception) {
    switch (exception.code) {
      case 'invalid-verification-code':
        return const SignInWithCredentialFailure('Code invalid');
      case 'invalid-verification-id':
        return const SignInWithCredentialFailure(
            'Verification Id invalid. This is most likely due to the fact that you waited too long to enter your code.');
      case 'user-disabled':
        return const SignInWithCredentialFailure(
            'User account has been disabled. You cannot use this phone number again.');
      default:
        return SignInWithCredentialFailure(
            exception.message ?? 'An unknown exception occurred.');
    }
  }

  final String message;
}
