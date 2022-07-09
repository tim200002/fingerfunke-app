import '../../../../../cubits/firebase_authentication_cubit/firebase_authentication_cubit_cubit.dart';
import '../../../../../utils/tools.dart';
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
            icon: const Icon(FeatherIcons.logOut),
            label: const Text("abmelden"),
            onPressed: () {
              BlocProvider.of<FirebaseAuthenticationCubitCubit>(context)
                  .logoutRequested()
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
