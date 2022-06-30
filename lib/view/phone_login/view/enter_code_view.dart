import 'package:fingerfunke_app/view/phone_login/cubit/phone_login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class EnterCodeView extends StatelessWidget {
  final String verificationId;
  const EnterCodeView(this.verificationId, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PhoneLoginCubit _phoneLoginCubit =
        BlocProvider.of<PhoneLoginCubit>(context);
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text("SMS Code eingeben",
              style: Theme.of(context).textTheme.labelLarge),
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
