import 'dart:io';

import '../../../utils/tools.dart';
import '../cubit/phone_login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import 'code_autodetect_label.dart';

class EnterCodeView extends StatelessWidget {
  final String verificationId;
  final bool autoDetecting;
  const EnterCodeView(this.verificationId, this.autoDetecting, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    PhoneLoginCubit _phoneLoginCubit =
        BlocProvider.of<PhoneLoginCubit>(context);
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(l10n(context).msg_loginEnterCode,
                  style: Theme.of(context).textTheme.labelLarge),
              if (Platform.isAndroid)
                LoginCodeAutoDetectLabel(active: autoDetecting)
            ],
          ),
          PinCodeTextField(
              appContext: context,
              keyboardType: TextInputType.number,
              length: 6,
              onChanged: (pin) {},
              onCompleted: (pin) => _phoneLoginCubit.signInWithCode(
                  verificationId: verificationId,
                  smsCode: pin,
                  context: context)),
        ]);
  }
}
