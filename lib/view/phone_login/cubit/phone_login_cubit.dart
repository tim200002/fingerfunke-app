import 'package:bloc/bloc.dart';
import 'package:fingerfunke_app/repositories/authentication_repository/authetication_repository.dart';
import 'package:fingerfunke_app/utils/loading_overlay.dart';
import 'package:fingerfunke_app/utils/tools.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';

part 'phone_login_state.dart';
part 'phone_login_cubit.freezed.dart';

class PhoneLoginCubit extends Cubit<PhoneLoginState> {
  final AutheticationRepository _authenticationRepository;
  final Logger _logger = Logger();

  PhoneLoginCubit({AutheticationRepository? authenticationRepository})
      : _authenticationRepository =
            authenticationRepository ?? AuthenticaionRepositoryImpl(),
        super(const PhoneLoginState.enterPhoneNumber(isLoading: false));

  Future<void> sendSMSCode({required String phoneNumber}) async {
    emit(const PhoneLoginState.enterPhoneNumber(isLoading: true));
    await _authenticationRepository.sendSMSCode(
        phoneNumber: phoneNumber,
        verificationCompleted: (phoneAuthCredentials) {
          _authenticationRepository.signInUserWithPhoneCredentials(
              phoneAuthCredential: phoneAuthCredentials);
        },
        verificationFailed: (exception) {
          emit(const PhoneLoginState.enterPhoneNumber(isLoading: false));
          //! One must be able to implement this in a prettier way
          if (exception.message != null) {
            if (exception.message!.contains(("Invalid format"))) {
              _logger.e(
                  "Phone verification failed, phone number is in wrong format");
              // Todo implement snackbar
              return;
            }
          }
          _logger.e(
              "Phone verification failed due to unknown error type\n\n${exception.message}");
        },
        codeSent: (verificationId, resendToken) {
          emit(PhoneLoginState.enterCode(
              verificationId: verificationId, resendToken: resendToken));
        },
        codeAutoRetrievalTimeout: (verificationId) {});
  }

  Future<void> signInWithCode(
      {required String verificationId,
      required String smsCode,
      required BuildContext context,
      Function? onError}) async {
    // ToDo check if code has valid format
    showLoadingOverlay(context);
    try {
      await _authenticationRepository.signInUserWithSMSCode(
          verificationId: verificationId, smsCode: smsCode);
      emit(const PhoneLoginState.authenticated());
    } on FirebaseAuthException catch (exception) {
      if (onError != null) {
        onError();
      }
      if (exception.message != null) {
        // Code invalid
        if (exception.message!.contains(
            "The sms verification code used to create the phone auth credential is invalid")) {
          _logger.e(
              "Firebase Authentication Error invalid verification code \n\n${exception.message}");
          Tools.showSnackbar(context, "Invalid pin Code");
          return;
        } else if (exception.message!.contains(
            "The sms code has expired. Please re-send the verification code to try again")) {
          Tools.showSnackbar(
              context, "Vaerification Code has expired, please resend SMS");
          emit(const PhoneLoginState.enterPhoneNumber(isLoading: false));
        }
      }
      _logger.e("Unknonw Firebase Authenticatio Error\n\n${exception.message}");
      //2 Firebase internal error
    } catch (exception) {
      _logger.e("Unknown exception loggin in with verification code");
      if (onError != null) {
        onError();
      }
    } finally {
      Navigator.of(context).pop();
    }
  }
}
