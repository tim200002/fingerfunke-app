import 'package:fingerfunke_app/utils/exceptions.dart';
import 'package:fingerfunke_app/utils/form_validator.dart';
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Enter your phone number",
            style: Theme.of(context).textTheme.headline4,
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 20, top: 15),
            child: Text(
                "We will send you a verification code once you entered your phone nnumber"),
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
                //validator:  (number) => FormValidator.validatePhoneNumber(number.toString()),
                //controller: _phoneInputController.,
              )),
          BlocBuilder<PhoneLoginCubit, PhoneLoginState>(
              builder: (context, state) {
            return state.maybeWhen(
              enterPhoneNumber: (isLoading) {
                if (isLoading) {
                  return const Center(
                      child: CircularProgressIndicator.adaptive());
                } else {
                  return ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        BlocProvider.of<PhoneLoginCubit>(context).sendSMSCode(
                            phoneNumber: _phoneInputController.text);
                      }
                    },
                    child: const Text("send code"),
                  );
                }
              },
              orElse: () => ErrorWidget(InvalidStateException()),
            );
          })
        ],
      ),
    );
  }

  @override
  void dispose() {
    _phoneInputController.dispose();
    super.dispose();
  }
}
