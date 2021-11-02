import 'dart:async';

import 'package:fingerfunke_app/view/phone_login/cubit/phone_login_cubit.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class EnterCodeView extends StatelessWidget {
  EnterCodeView({Key? key}) : super(key: key);

  final StreamController<ErrorAnimationType> errorController =
      StreamController<ErrorAnimationType>();

  @override
  Widget build(BuildContext context) {
    PhoneLoginCubit _phoneLoginCubit =
        BlocProvider.of<PhoneLoginCubit>(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Enter pin"),
        PinCodeTextField(
          appContext: context,
          keyboardType: TextInputType.number,
          errorAnimationController: errorController,
          length: 6,
          onChanged: (pin) {},
          onCompleted: (pin) {
            _phoneLoginCubit.state.whenOrNull(
              enterCode: (String verificationId, int? resendToken) =>
                  _phoneLoginCubit.signInWithCode(
                verificationId: verificationId,
                smsCode: pin,
                context: context,
                onError: () => errorController.add(ErrorAnimationType.shake),
              ),
            );
          },
        ),
        RichText(
          text: TextSpan(
            text: 'resend token',
            style: const TextStyle(color: Colors.blue, fontSize: 15),
            recognizer: TapGestureRecognizer()
              ..onTap = () => _phoneLoginCubit.emit(
                    const PhoneLoginState.enterPhoneNumber(isLoading: false),
                  ),
          ),
        )
      ],
    );
  }
}
