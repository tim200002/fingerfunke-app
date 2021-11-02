part of 'authetication_repository.dart';

class AuthenticaionRepositoryImpl implements AutheticationRepository {
  final FirebaseAuth _firebaseAuth;

  final StreamController<SIGN_IN_STATE> _signInStateStreamController =
      StreamController<SIGN_IN_STATE>.broadcast();

  AuthenticaionRepositoryImpl({FirebaseAuth? firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance {
    // Subscribe to changes in users signe in state
    _firebaseAuth.authStateChanges().listen((_) {
      final SIGN_IN_STATE signInState = getSignInState();
      _signInStateStreamController.add(signInState);
    });
  }

  @override
  Future<void> signInAnonymously() async {
    // Since anonymous user do not have further Information stored about themself
    // we will just create an anoynous user without any account linked
    await _firebaseAuth.signInAnonymously();
  }

  @override
  Future<void> sendSMSCode(
      {required String phoneNumber,
      required void Function(PhoneAuthCredential) verificationCompleted,
      required void Function(FirebaseAuthException) verificationFailed,
      required void Function(String, int?) codeSent,
      required void Function(String) codeAutoRetrievalTimeout}) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
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

  @override
  Future<void> signInUserWithSMSCode(
      {required String verificationId, required String smsCode}) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: smsCode);

    await signInUserWithPhoneCredentials(phoneAuthCredential: credential);
  }

  @override
  Future<void> signInUserWithPhoneCredentials(
      {required PhoneAuthCredential phoneAuthCredential}) async {
    await _firebaseAuth.signInWithCredential(phoneAuthCredential);

    // ToDo check if user exists and if necessary create new document
  }

  @override
  Future<void> signOut() async {
    _firebaseAuth.signOut();
  }

  @override
  SIGN_IN_STATE getSignInState() {
    User? currentUser = _firebaseAuth.currentUser;
    if (currentUser == null) {
      return SIGN_IN_STATE.unauthenticated;
    } else if (currentUser.isAnonymous) {
      return SIGN_IN_STATE.signedInAnonymously;
    } else {
      return SIGN_IN_STATE.signedIn;
    }
  }

  @override
  String? getUserId() {
    final UserID? userId = _firebaseAuth.currentUser?.uid;
    return userId;
  }

  @override
  Stream<SIGN_IN_STATE> getSignInStateStream() {
    return _signInStateStreamController.stream;
  }
}
