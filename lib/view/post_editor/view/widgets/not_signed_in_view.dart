import 'package:flutter/material.dart';

class NotSignedInView extends StatelessWidget {
  const NotSignedInView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text("Melde dich an um zu posten"),
      ),
    );
  }
}
