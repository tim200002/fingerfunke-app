import 'package:fingerfunke_app/utils/dev_tools.dart';
import 'package:flutter/material.dart';

class MyAccountPage extends StatelessWidget {
  const MyAccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("mein Account"),
      ),
      body: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
          child: DevTools.placeholder("MyAccountPage")),
    );
  }
}
