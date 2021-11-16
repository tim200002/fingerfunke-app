import 'package:fingerfunke_app/cubits/authentication_cubit/authentication_cubit.dart';
import 'package:fingerfunke_app/view/create_account/create_account_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateAccountView extends StatelessWidget {
  CreateAccountView({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => CreateAccountView());
  }

  final CreateAccountController _controller = CreateAccountController();
  final TextEditingController _userNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
              "Hi um zu starten brauchen wir deinen Namen. Gerne darfst du auch ein Profilbild hochladen, damit andere dich besser erkennen"),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _userNameController,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: OutlinedButton(
                onPressed: () {
                  _controller.createUser(
                    name: _userNameController.text,
                    authenticationCubit:
                        BlocProvider.of<AuthenticationCubit>(context),
                  );
                },
                child: const Text("Los gehts")),
          )
        ],
      ),
    );
  }
}
