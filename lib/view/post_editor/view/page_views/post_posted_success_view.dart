import 'package:flutter/material.dart';

class PostPostedSuccessView extends StatelessWidget {
  const PostPostedSuccessView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pop();
    });
    return const Scaffold(body: Center(child: Icon(Icons.check)));
  }
}
