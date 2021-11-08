import 'package:flutter/material.dart';

class DevTools {
  static void showToDoSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("ToDo")));
  }

  static Widget placeholder(String message) {
    return Container(
      color: Colors.purple[300],
      child: Center(
        child: Text("ToDo: $message"),
      ),
    );
  }
}
