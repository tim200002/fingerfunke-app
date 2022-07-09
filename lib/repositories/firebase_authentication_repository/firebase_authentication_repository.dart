import 'package:firebase_auth/firebase_auth.dart';

import 'errors_and_exceptions.dart';

class FirebaseAuthenticationRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? get user => _firebaseAuth.currentUser;

  Stream<User?> get userStream {
    return _firebaseAuth.authStateChanges();
  }

  Future<void> sendSMSCode(
      {required String phoneNumber,
      required void Function(PhoneAuthCredential) verificationCompleted,
      required void Function(FirebaseAuthException) verificationFailed,
      required void Function(String, int?) codeSent,
      required void Function(String) codeAutoRetrievalTimeout}) async {
    await _firebaseAuth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) =>
          verificationCompleted(credential),
      verificationFailed: (FirebaseAuthException e) => verificationFailed(e),
      codeSent: (String verificationId, int? resendToken) =>
          codeSent(verificationId, resendToken),
      codeAutoRetrievalTimeout: (String verificationId) =>
          codeAutoRetrievalTimeout(verificationId),
    );
  }

  Future<void> signIn(PhoneAuthCredential phoneAuthCredential) {
    return _firebaseAuth.signInWithCredential(phoneAuthCredential);
  }

  Future<void> logOut() async {
    try {
      await _firebaseAuth.signOut();
    } catch (_) {
      throw LogOutFailure();
    }
  }
}
