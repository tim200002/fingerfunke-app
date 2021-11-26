import 'package:fingerfunke_app/common_widgets/user/author_info.dart';
import 'package:fingerfunke_app/models/user/user.dart';
import 'package:flutter/material.dart';

class TextComment extends StatelessWidget {
  const TextComment({Key? key}) : super(key: key);
  static const double _commentPadding = 8;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(_commentPadding),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          //Text(text),
          const AuthorInfo(
            UserInfo(id: "test", name: "test"),
          ),
        ],
      ),
    );
  }
}
