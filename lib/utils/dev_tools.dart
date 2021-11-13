import 'package:flutter/material.dart';

class DevTools {
  static const Color colorPlaceholder = Color(0xFFBA68C8); // purple 300

  static void showToDoSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("ToDo")));
  }

  static Widget placeholder(String message) {
    return Container(
      color: colorPlaceholder,
      child: Center(
        child: Text("ToDo: $message"),
      ),
    );
  }
}
