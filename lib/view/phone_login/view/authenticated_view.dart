import 'package:flutter/material.dart';

class AuthenticatedView extends StatelessWidget {
  const AuthenticatedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Du bist angemeldet!"),
    );
  }
}
