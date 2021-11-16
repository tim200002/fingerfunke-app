import 'package:fingerfunke_app/utils/exceptions.dart';
import 'package:fingerfunke_app/utils/form_validator.dart';
import 'package:fingerfunke_app/view/phone_login/cubit/phone_login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EnterPhoneNumberView extends StatelessWidget {
  EnterPhoneNumberView({Key? key}) : super(key: key);

  //! This is of course not bloc but its way easier this way
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
            child: TextFormField(
              decoration: const InputDecoration(labelText: "mobile number"),
              keyboardType: TextInputType.phone,
              validator: (number) => FormValidator.validatePhoneNumber(number),
              controller: _phoneInputController,
            ),
          ),
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
}
