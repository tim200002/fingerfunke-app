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
  String number = "";
  bool inputValid = false;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PhoneLoginCubit, PhoneLoginState>(
      builder: (context, state) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(l10n(context).lbl_phoneNumberLogin,
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
                  onChanged: (nr) => setState(() {
                        number = nr.countryCode + nr.number;
                        inputValid =
                            validatePhoneNumber(nr.countryCode, nr.number);
                      }))),
          ElevatedButton(
            onPressed: inputValid
                ? () => BlocProvider.of<PhoneLoginCubit>(context)
                    .sendSMSCode(phoneNumber: number)
                : null,
            child: Text(l10n(context).lbl_loginSendCode),
          )
        ],
      ),
    );
  }

  /// Validates the phone number
  bool validatePhoneNumber(String countryCode, String number) {
    // edge case validation
    if (countryCode.isEmpty) {
      return false;
    }

    if(number.isEmpty) {
      return false;
    }

    RegExp validPhoneNumberChecker = RegExp(
        r"\(?\+[0-9]{1,3}\)? ?-?[0-9]{1,3} ?-?[0-9]{3,5} ?-?[0-9]{4}( ?-?[0-9]{3})?");
    String mergedNumber = (countryCode + number);
    print(mergedNumber);
    return validPhoneNumberChecker.hasMatch(mergedNumber);
  }

  @override
  void dispose() {
    super.dispose();
  }
}
