import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../utils/tools.dart';
import '../cubit/phone_login_cubit.dart';

class EnterPhoneNumberView extends StatefulWidget {
  const EnterPhoneNumberView({Key? key}) : super(key: key);

  @override
  State<EnterPhoneNumberView> createState() => _EnterPhoneNumberViewState();
}

class _EnterPhoneNumberViewState extends State<EnterPhoneNumberView> {
  final _phoneInputController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: BlocBuilder<PhoneLoginCubit, PhoneLoginState>(
        builder: (context, state) => Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(l10n(context).lbl_phoneNumber,
                style: Theme.of(context).textTheme.labelLarge),
            Padding(
                padding: const EdgeInsets.only(bottom: 20, top: 15),
                child: Text(l10n(context).msg_loginCodeAbout)),
            Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: IntlPhoneField(
                  showDropdownIcon: false,
                  disableLengthCheck: true,
                  decoration: InputDecoration(
                    labelText: l10n(context).lbl_phoneNumber,
                    border: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                  ),
                  initialCountryCode: 'DE',
                  onChanged: (nr) =>
                      _phoneInputController.text = nr.countryCode + nr.number,
                )),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  BlocProvider.of<PhoneLoginCubit>(context)
                      .sendSMSCode(phoneNumber: _phoneInputController.text);
                }
              },
              child: Text(l10n(context).lbl_loginSendCode),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _phoneInputController.dispose();
    super.dispose();
  }
}
