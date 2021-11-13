import 'package:fingerfunke_app/repositories/authentication_repository/authetication_repository.dart';
import 'package:fingerfunke_app/utils/tools.dart';
import 'package:fingerfunke_app/view/phone_login/view/phone_login_page.dart';
import 'package:flutter/material.dart';

class UnauthenticatedPage extends StatelessWidget {
  const UnauthenticatedPage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const UnauthenticatedPage());
  }

  Widget _heroSection(BuildContext context) => Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Text(
              "Hi!",
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text("welcome to fingerfunke",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ))
          ]));

  Widget _loginSection(BuildContext context) => Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ElevatedButton(
            onPressed: () => Navigator.of(context).push(PhoneLoginPage.route()),
            child: const Text("Login or create new Account"),
          ),
          TextButton(
            onPressed: () {
              AuthenticaionRepositoryImpl().signInAnonymously().onError(
                  (_, __) =>
                      Tools.showSnackbar(context, "Oops something went wrong"));
            },
            child: const Text("skip"),
          )
        ],
      ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: Column(
        children: [
          Expanded(child: Center(child: _heroSection(context))),
          _loginSection(context)
        ],
      )),
    );
  }
}
