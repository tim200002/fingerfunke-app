import 'package:bloc/bloc.dart';
import '../../../repositories/firebase_authentication_repository/errors_and_exceptions.dart';
import '../../../repositories/firebase_authentication_repository/firebase_authentication_repository.dart';
import '../../../utils/loading_overlay.dart';
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
            _logger
                .e("Error Sending Code to Phone number: Error Code $exception");
            final SignInWithCredentialFailure reasonForFailure =
                SignInWithCredentialFailure.fromCode(exception);
            emit(PhoneLoginState.enterPhoneNumber(
                withErrorMessage: reasonForFailure.message));
          }
        },
        verificationFailed: (exception) {
          final VerifyPhoneNumberFailure reasonForFailure =
              VerifyPhoneNumberFailure.fromCode(exception.code);
          _logger
              .e("Error Sending Code to Phone number: Error Code $exception");
          emit(PhoneLoginState.enterPhoneNumber(
              withErrorMessage: reasonForFailure.message));
        },
        codeSent: (verificationId, _) {
          emit(PhoneLoginState.enterCode(
              verificationId: verificationId, autoDetecting: true));
        },
        // We could maybe use this timeout as the earlist time for which it is allowed to ask for new SMS
        codeAutoRetrievalTimeout: (verificationId) {
          state.mapOrNull(
              enterCode: (state) =>
                  isClosed ? null : emit(state.copyWith(autoDetecting: false)));
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
          SignInWithCredentialFailure.fromCode(exception);
      emit(PhoneLoginState.enterCode(
          verificationId: verificationId,
          autoDetecting: true,
          withErrorMessage: reasonForFailure.message));
    }
  }
}
