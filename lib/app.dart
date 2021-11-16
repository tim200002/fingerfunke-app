import 'package:fingerfunke_app/view/home/view/home_view.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const App());
  }

  @override
  Widget build(BuildContext context) => const HomeView();
}
