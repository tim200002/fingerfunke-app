import 'package:flutter/material.dart';

class MyLicensePage extends StatelessWidget {
  const MyLicensePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //TODO decide which licenses Page to use
    return const LicensePage(
        applicationVersion: "1.0",
        applicationName: "fingerfunke",
        applicationIcon: Image(image: AssetImage("assets/img/brand/logo.png")));
  }
}
