import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../utils/illustration.dart';
import '../../../utils/tools.dart';
import '../../phone_login/view/phone_login_page.dart';

class StaticTestPhaseWall extends StatelessWidget {
  final List<String> codes;
  const StaticTestPhaseWall({super.key, required this.codes});

  Widget _heroSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
          reverse: true,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Illustration(Illustrations.build),
              const SizedBox(height: 30),
              Text(l10n(context).lbl_wallAppDev,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.signika(
                    fontSize: 19,
                    fontWeight: FontWeight.w500,
                  )),
              const SizedBox(height: 30),
              Text(l10n(context).lbl_wallInviteCode,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.signika(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  )),
              const SizedBox(height: 10),
            ],
          )),
    );
  }

  Widget _codeSection(BuildContext context) {
    final StreamController<ErrorAnimationType> errorAnimation =
        StreamController<ErrorAnimationType>();

    final Color fieldColor = Theme.of(context).colorScheme.primary;
    return Container(
        clipBehavior: Clip.hardEdge,
        margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6), color: fieldColor),
        child: PinCodeTextField(
            hintCharacter: "·",
            errorAnimationController: errorAnimation,
            errorTextSpace: 0,
            animationType: AnimationType.scale,
            textStyle: const TextStyle(color: Colors.white),
            hintStyle: const TextStyle(color: Colors.white),
            enableActiveFill: true,
            pinTheme: PinTheme(
              fieldOuterPadding: EdgeInsets.zero,
              selectedColor: fieldColor,
              selectedFillColor: fieldColor,
              inactiveColor: fieldColor,
              inactiveFillColor: fieldColor,
              activeColor: fieldColor,
              activeFillColor: fieldColor,
              disabledColor: fieldColor,
              errorBorderColor: fieldColor,
              shape: PinCodeFieldShape.box,
              borderWidth: 0,
              borderRadius: BorderRadius.circular(10),
            ),
            textCapitalization: TextCapitalization.characters,
            boxShadows: [],
            appContext: context,
            length: 6,
            onChanged: (_) {},
            onCompleted: (value) {
              if (codes.contains(value.toUpperCase())) {
                Navigator.of(context).pushReplacement(MaterialPageRoute<void>(
                    builder: (_) => const PhoneLoginPage()));
              } else {
                errorAnimation.add(ErrorAnimationType.shake);
              }
            }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Expanded(child: _heroSection(context)),
          _codeSection(context),
        ],
      ),
    );
  }
}
