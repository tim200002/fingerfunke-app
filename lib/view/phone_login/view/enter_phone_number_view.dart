import 'package:fingerfunke_app/view/phone_login/cubit/phone_login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

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
            Text("Telefonnummer",
                style: Theme.of(context).textTheme.labelLarge),
            const Padding(
              padding: EdgeInsets.only(bottom: 20, top: 15),
              child: Text(
                  "Wir senden dir einen Code an Deine Nummer um diese zu verifizieren. Auf diese Weise musst Du Dir kein Passwort merken."),
            ),
            Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: IntlPhoneField(
                  showDropdownIcon: false,
                  disableLengthCheck: true,
                  decoration: const InputDecoration(
                    labelText: 'Phone Number',
                    border: OutlineInputBorder(
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
              child: const Text("Code senden"),
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
