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
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                  "Hi", style: Theme.of(context).textTheme.headline2,),
            ),

            Text(
                "um zu starten brauchen wir deinen Namen.\nGerne darfst du auch ein Profilbild hochladen, damit andere dich besser erkennen",  style: Theme.of(context).textTheme.headline6,),
            TextField(
              controller: _userNameController,
            ),
            Center(
              child: Padding(
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
