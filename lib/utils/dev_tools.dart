import 'package:flutter/material.dart';

class DevTools {
  static void showToDoSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("ToDo")));
  }
}
