import 'package:fingerfunke_app/repositories/authentication_repository/authetication_repository.dart';
import 'package:fingerfunke_app/utils/tools.dart';
import 'package:fingerfunke_app/view/phone_login/view/phone_login_page.dart';
import 'package:flutter/material.dart';

class UnauthenticatedPage extends StatelessWidget {
  const UnauthenticatedPage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const UnauthenticatedPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("Hi thanks for choosing Finkerfunke"),
            ElevatedButton(
              onPressed: () =>
                  Navigator.of(context).push(PhoneLoginPage.route()),
              child: const Text("Login or create new Account"),
            ),
            ElevatedButton(
              onPressed: () {
                AuthenticaionRepositoryImpl().signInAnonymously().onError((_,
                        __) =>
                    Tools.showSnackbar(context, "Oops something went wrong"));
              },
              child: const Text("I don't need an Account"),
            )
          ],
        ),
      ),
    );
  }
}
