import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/beta_indicator.dart';
import '../../../utils/illustration.dart';
import '../../../utils/tools.dart';
import '../../app_info/app_version_view.dart';
import '../../phone_login/view/phone_login_page.dart';
import 'static_test_phase_wall.dart';

class WelcomePage extends StatelessWidget {
  final String? betaMessage;
  final bool useStaticTestphaseWall;
  const WelcomePage(
      {Key? key, this.betaMessage, this.useStaticTestphaseWall = false})
      : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const WelcomePage());
  }

  Widget _heroSection(BuildContext context) => Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
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
        ),
      );

  Widget _actionSection(BuildContext context) => Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ElevatedButton(
            style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(const Size(0, 60))),
            onPressed: () => Navigator.of(context).push(MaterialPageRoute<void>(
                builder: (_) => useStaticTestphaseWall
                    ? const StaticTestPhaseWall(codes: ["FUNKEN"])
                    : const PhoneLoginPage())),
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
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const AppVersionView(
              compact: true,
              alignment: MainAxisAlignment.end,
              style: TextStyle(color: Color(0xFF9E9E9E)),
            ),
            Expanded(child: Center(child: _heroSection(context))),
            _actionSection(context)
          ],
        ),
      ),
    );
  }
}
