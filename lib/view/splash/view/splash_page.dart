import 'package:fingerfunke_app/utils/app_theme.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const SplashPage());
  }

  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, //Theme.of(context).colorScheme.,
      body: Center(
          child: Image.asset(
        "assets/img/brand/icon_trans.png",
        height: 150,
        color: Colors.white,
      )),
    );
  }
}
