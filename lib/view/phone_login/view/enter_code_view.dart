import '../../../utils/tools.dart';
import '../cubit/phone_login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

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
              _AutoDetectingLabel(active: autoDetecting)
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

class _AutoDetectingLabel extends StatelessWidget {
  final bool active;

  const _AutoDetectingLabel({required this.active});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: active
          ? Row(
              children: [
                const SizedBox.square(
                    dimension: 10,
                    child: CircularProgressIndicator.adaptive(
                      strokeWidth: 2,
                    )),
                const SizedBox(width: 10),
                Expanded(child: Text(l10n(context).lbl_autoDetectingLoginCode))
              ],
            )
          : Text(l10n(context).lbl_loginCodeNotAutoDetectable),
    );
  }
}
