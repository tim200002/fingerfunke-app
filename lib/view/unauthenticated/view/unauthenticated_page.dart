import 'package:fingerfunke_app/repositories/authentication_repository/authetication_repository.dart';
import 'package:fingerfunke_app/utils/illustration.dart';
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
          children: [
            Illustration(Illustrations.party),
            const Text(
              "Heyy!",
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(height: 20),
            const Text("Willkommen bei fingerfunke!",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ))
          ]));

  Widget _loginSection(BuildContext context) => Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ElevatedButton(
            onPressed: () => Navigator.of(context).push(PhoneLoginPage.route()),
            child: const Text("Anmelden"),
          ),
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
