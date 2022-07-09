import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import '../../utils/type_aliases.dart';

part 'authentication_repository.impl.dart';

enum SIGN_IN_STATE { unauthenticated, signedInAnonymously, signedIn }

abstract class AutheticationRepository {
  /// Allow user to sign in without an official account
  Future<void> signInAnonymously();

  /// Allow user to send a sms to specific number and validate sms code
  ///
  /// This function is uses for both signing in an already existing user
  /// but also to create a new account for an unknown user
  Future<void> sendSMSCode(
      {required String phoneNumber,
      required void Function(PhoneAuthCredential) verificationCompleted,
      required void Function(FirebaseAuthException) verificationFailed,
      required void Function(String, int?) codeSent,
      required void Function(String) codeAutoRetrievalTimeout});

  Future<void> signInUserWithSMSCode(
      {required String verificationId, required String smsCode});

  Future<void> signInUserWithPhoneCredentials(
      {required PhoneAuthCredential phoneAuthCredential});

  /// Allow user to sign out
  ///
  /// In the special case of an anonymous user we should probably notify them that their Account will be deleted
  Future<void> signOut();

  //! This might be useful if we give a user the right to save posts even anonymously
  /// Upgrade a user from an anyonymous account to a real account with credentials [email] and [password]
  /*Future<void> upgradeAccount(
      {required String email, required String password});
  */

  /// Return the current state of sign in (loggedOut, anonymously or with credentials)
  SIGN_IN_STATE getSignInState();

  FirestoreId? getUserId();

  /// Returns stream of the SIGN_IN_STATE of current User
  ///
  /// Beware this is a broadcast stream. As such it is not buffering
  /// any events. Therfore the receiver will only receive the first event
  /// emmitted after subscribing.
  /// To get the current SIGN_IN_STATE please consider using getSignInState()
  Stream<SIGN_IN_STATE> getSignInStateStream();
}
