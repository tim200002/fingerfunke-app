import '../../../../../cubits/firebase_authentication_cubit/firebase_authentication_cubit_cubit.dart';
import '../../../../../utils/tools.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class ManageAccountPage extends StatelessWidget {
  const ManageAccountPage({Key? key}) : super(key: key);

  void _showDeleteAccountDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext ctx) {
        return AlertDialog(
          actionsPadding: const EdgeInsets.symmetric(horizontal: 7),
          title: Text(l10n(context).lbl_deleteAccount),
          content: Text(l10n(context).msg_deleteAccountConfirm),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(l10n(context).lbl_cancel),
            ),
            ElevatedButton(
              onPressed: () {
                BlocProvider.of<FirebaseAuthenticationCubitCubit>(context)
                    .deleteAccountRequested()
                    .catchError(
                      (_) => Tools.showSnackbar(
                          l10n(context).msg_deleteAccountFailed),
                    );
                Navigator.of(context).pop();
              },
              child: Text(l10n(context).lbl_yes),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(l10n(context).lbl_accountManage)),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(children: [
          const SizedBox(height: 50),
          TextButton.icon(
            icon: const Icon(FeatherIcons.logOut),
            label: Text(l10n(context).lbl_signOut),
            onPressed: () {
              BlocProvider.of<FirebaseAuthenticationCubitCubit>(context)
                  .logoutRequested()
                  .catchError(
                    (_) => Tools.showSnackbar(l10n(context).msg_signOutFailed),
                  );
            },
          ),
                    TextButton.icon(
            icon: const Icon(FeatherIcons.trash2),
            label: Text(l10n(context).lbl_deleteAccount),
            onPressed: () {
              _showDeleteAccountDialog(context);
            },
          ),
        ]),
      ),
    );
  }
}
