import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../utils/illustration.dart';
import '../../../utils/tools.dart';
import '../../phone_login/view/phone_login_page.dart';

class TermsAgreeView extends StatefulWidget {
  const TermsAgreeView({super.key});

  @override
  State<TermsAgreeView> createState() => _TermsAgreeViewState();
}

class _TermsAgreeViewState extends State<TermsAgreeView> {
  List<bool> termsAgreeStatus = [false, false];

  bool get allAgreed => !termsAgreeStatus.contains(false);

  Widget _heroSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 40),
      child: SingleChildScrollView(
          reverse: true,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Illustration(Illustrations.contract),
              const SizedBox(height: 30),
              Text(l10n(context).lbl_termsInfo,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.signika(
                    fontSize: 19,
                    fontWeight: FontWeight.w500,
                  )),
            ],
          )),
    );
  }

  Widget _policyItem(BuildContext context,
      {required int index,
      required String policyName,
      required String policyLink}) {
    String label = l10n(context).lbl_termsAgree(policyName);
    List<String> labelParts = label.split(policyName);
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 22),
        child: Row(children: [
          Padding(
            padding: const EdgeInsets.only(right: 3),
            child: Checkbox(
                activeColor: Theme.of(context).colorScheme.primary,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                checkColor: Colors.white,
                value: termsAgreeStatus[index],
                onChanged: (v) =>
                    setState(() => termsAgreeStatus[index] = v ?? false)),
          ),
          Expanded(
              child: Text.rich(
            TextSpan(
              children: [
                TextSpan(text: labelParts[0]),
                TextSpan(
                    text: policyName,
                    style: const TextStyle(color: Colors.blue),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => launchUrlString(policyLink,
                          mode: LaunchMode.inAppWebView)),
                TextSpan(text: labelParts[1]),
              ],
            ),
          )),
        ]));
  }

  _agreeSection(BuildContext context) {
    return Form(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _policyItem(context,
              index: 0,
              policyName: l10n(context).lbl_termsTOC,
              policyLink: "https://fingerfunke.app/TOC"),
          _policyItem(context,
              index: 1,
              policyName: l10n(context).lbl_termsUP,
              policyLink: "https://fingerfunke.app/UP")
        ],
      ),
    );
  }

  Widget _nextButton(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton(
                style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(const Size(0, 60))),
                onPressed: !allAgreed
                    ? null
                    : () => Navigator.of(context).pushReplacement(
                        MaterialPageRoute<void>(
                            builder: (_) => const PhoneLoginPage())),
                child: Text(l10n(context).lbl_next),
              ),
            ]));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: ListView(
        reverse: true,
        children: <Widget>[
          _heroSection(context),
          _agreeSection(context),
          _nextButton(context)
        ].reversed.toList(),
      ),
    );
  }
}
