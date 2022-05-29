import 'package:fingerfunke_app/cubits/authentication_cubit/authentication_cubit.dart';
import 'package:fingerfunke_app/utils/tools.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class ManageAccountPage extends StatelessWidget {
  const ManageAccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Account verwalten")),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(children: [
          ElevatedButton.icon(
            icon: Icon(FeatherIcons.logOut),
            label: const Text("abmelden"),
            onPressed: () {
              BlocProvider.of<AuthenticationCubit>(context)
                  .signOut()
                  .catchError(
                    (_) => Tools.showSnackbar(context, "Logout failed?"),
                  );
            },
          ),
        ]),
      ),
    );
  }
}
