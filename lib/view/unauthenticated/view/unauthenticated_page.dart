import 'package:fingerfunke_app/repositories/authentication_repository/authetication_repository.dart';
import 'package:fingerfunke_app/utils/illustration.dart';
import 'package:fingerfunke_app/utils/tools.dart';
import 'package:fingerfunke_app/view/phone_login/view/phone_login_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UnauthenticatedPage extends StatelessWidget {
  const UnauthenticatedPage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const UnauthenticatedPage());
  }

  Widget _heroSection(BuildContext context) => Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Illustration(Illustrations.party),
            Text("Heyy",
                textAlign: TextAlign.center,
                style: GoogleFonts.playfairDisplay(
                  fontSize: 50,
                  fontWeight: FontWeight.w900,
                )),
            const SizedBox(height: 22),
            Text("Willkommen bei\nfingerfunke",
                textAlign: TextAlign.center,
                style: GoogleFonts.signika(
                  fontSize: 19,
                  fontWeight: FontWeight.w700,
                ))
          ]));

  Widget _loginSection(BuildContext context) => Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ElevatedButton(
            style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(const Size(0, 60))),
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
