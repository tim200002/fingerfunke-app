import 'package:fingerfunke_app/cubits/authentication_cubit/authentication_cubit.dart';
import 'package:fingerfunke_app/utils/tools.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ManageAccountPage extends StatelessWidget {
  const ManageAccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Account verwalten")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text("Logout?"),
                content: const Text(
                    "Hey willst du dich witklich abmelden. Wenn du mit deiner Telefonnummer angemeldet bist kannst du dich jederzeit wieder anmelden. Wenn nicht gehen aber alle deine Informationen verloren"),
                actions: [
                  TextButton(
                    onPressed: () {
                      BlocProvider.of<AuthenticationCubit>(context)
                          .signOut()
                          .catchError(
                            (_) =>
                                Tools.showSnackbar(context, "Logout failed?"),
                          );
                    },
                    child: const Text("Ja"),
                  ),
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text("Nein"),
                  )
                ],
              ),
            );
          },
          child: const Text("Logout"),
        ),
      ),
    );
  }
}
