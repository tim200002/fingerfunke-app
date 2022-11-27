import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/beta_indicator.dart';
import '../../../utils/illustration.dart';
import '../../../utils/tools.dart';
import '../../phone_login/view/phone_login_page.dart';

class WelcomePage extends StatelessWidget {
  final String? betaMessage;
  const WelcomePage({Key? key, this.betaMessage}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const WelcomePage());
  }

  Widget _heroSection(BuildContext context) => Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Illustration(Illustrations.party),
            Text(l10n(context).lbl_welcomeHello,
                textAlign: TextAlign.center,
                style: GoogleFonts.playfairDisplay(
                  fontSize: 50,
                  fontWeight: FontWeight.w900,
                )),
            const SizedBox(height: 22),
            Text(l10n(context).lbl_welcomeToApp,
                textAlign: TextAlign.center,
                style: GoogleFonts.signika(
                  fontSize: 19,
                  fontWeight: FontWeight.w500,
                )),
            if (betaMessage != null) _betaIndicator(betaMessage ?? "err")
          ],
        ),
      );

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
            child: Text(l10n(context).lbl_login),
          ),
        ],
      ));

  Widget _betaIndicator(String msg) {
    return Center(
      child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: BetaIndicator(message: msg)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child: Center(child: _heroSection(context))),
            _loginSection(context)
          ],
        ),
      ),
    );
  }
}
