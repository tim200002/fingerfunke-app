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

  Widget _automaticRecog() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
          margin: EdgeInsets.only(right: 20),
          height: 30,
          width: 30,
          child: CircularProgressIndicator.adaptive(),
        ),
        const Text("Verifizierung")
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    PhoneLoginCubit _phoneLoginCubit =
        BlocProvider.of<PhoneLoginCubit>(context);

    return FutureBuilder(
        //initialData: false,
        future: Future.delayed(Duration(seconds: 20), () => true),
        builder: (context, value) => value.hasData
            ? Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    "SMS Code eingeben",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  ),
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
                          onError: () =>
                              errorController.add(ErrorAnimationType.shake),
                        ),
                      );
                    },
                  ),
                  TextButton(
                      onPressed: () => _phoneLoginCubit.emit(
                          const PhoneLoginState.enterPhoneNumber(
                              isLoading: false)),
                      child: const Text("Code erneut senden"))
                ],
              )
            : _automaticRecog());
  }
}
