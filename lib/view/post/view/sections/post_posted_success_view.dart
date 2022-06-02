import 'package:flutter/material.dart';

class PostPostedSuccessView extends StatelessWidget {
  const PostPostedSuccessView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool hasPopped = false;
    Future.delayed(const Duration(seconds: 1, milliseconds: 500), () {
      if (!hasPopped) {
        Navigator.of(context).pop();
      }
    });
    return GestureDetector(
      onTap: () {
        hasPopped = true;
        Navigator.of(context).pop();
      },
      child: Scaffold(
        body: Center(
          child: Icon(
            Icons.check,
            color: Theme.of(context).colorScheme.primary,
            size: 40,
          ),
        ),
      ),
    );
  }
}
