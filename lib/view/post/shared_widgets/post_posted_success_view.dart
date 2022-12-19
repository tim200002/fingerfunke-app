import 'package:flutter/material.dart';

import '../../../../../routes.dart';

class PostPostedSuccessView extends StatelessWidget {
  final String? postId;
  const PostPostedSuccessView({Key? key, required this.postId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool hasPopped = false;
    Future.delayed(const Duration(seconds: 1, milliseconds: 500), () {
      if (!hasPopped) {
        postId != null
            ? Navigator.popAndPushNamed(context, Routes.post, arguments: postId)
            : Navigator.pop(context);
        //Navigator.of(context).pop();
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
