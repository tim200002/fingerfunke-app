import 'package:bloc/bloc.dart';
import 'package:fingerfunke_app/repositories/firebase_authentication_repository/errors_and_exceptions.dart';
import 'package:fingerfunke_app/repositories/firebase_authentication_repository/firebase_authentication_repository.dart';
import 'package:fingerfunke_app/utils/loading_overlay.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';

part 'phone_login_cubit.freezed.dart';
part 'phone_login_state.dart';

class PhoneLoginCubit extends Cubit<PhoneLoginState> {
  final FirebaseAuthenticationRepository _authenticationRepository;
  final Logger _logger = Logger();

  PhoneLoginCubit({FirebaseAuthenticationRepository? authenticationRepository})
      : _authenticationRepository =
            authenticationRepository ?? FirebaseAuthenticationRepository(),
        super(const PhoneLoginState.enterPhoneNumber());

  Future<void> sendSMSCode({required String phoneNumber}) async {
    emit(const PhoneLoginState.waitForCodeSent());
    await _authenticationRepository.sendSMSCode(
        phoneNumber: phoneNumber,
        verificationCompleted: (phoneAuthCredentials) async {
          try {
            emit(const PhoneLoginState.waitForLogIn());
            await _authenticationRepository.signIn(phoneAuthCredentials);
          } on FirebaseAuthException catch (exception) {
            final SignInWithCredentialFailure reasonForFailure =
                SignInWithCredentialFailure.fromCode(exception.code);
            emit(PhoneLoginState.enterPhoneNumber(
                withErrorMessage: reasonForFailure.message));
          }
        },
        verificationFailed: (exception) {
          final VerifyPhoneNumberFailure reasonForFailure =
              VerifyPhoneNumberFailure.fromCode(exception.code);
          emit(PhoneLoginState.enterPhoneNumber(
              withErrorMessage: reasonForFailure.message));
        },
        codeSent: (verificationId, _) {
          emit(PhoneLoginState.enterCode(verificationId: verificationId));
        },
        // We could maybe use this timeout as the earlist time for which it is allowed to ask for new SMS
        codeAutoRetrievalTimeout: (verificationId) {
          _logger
              .i('CodeAutoRetrieval timeout called. This is irrelevant for us');
        });
  }

  Future<void> signInWithCode(
      {required String verificationId,
      required String smsCode,
      required BuildContext context,
      Function? onError}) async {
    // ToDo check if code has valid format
    showLoadingOverlay(context);
    try {
      final PhoneAuthCredential authCredential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: smsCode);
      await _authenticationRepository.signIn(authCredential);
    } on FirebaseAuthException catch (exception) {
      final SignInWithCredentialFailure reasonForFailure =
          SignInWithCredentialFailure.fromCode(exception.code);
      emit(PhoneLoginState.enterCode(
          verificationId: verificationId,
          withErrorMessage: reasonForFailure.message));
    }
  }
}
