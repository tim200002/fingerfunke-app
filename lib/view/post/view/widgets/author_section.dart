import 'package:fingerfunke_app/models/user/user.dart';
import 'package:flutter/material.dart';

class AuthorSection extends StatelessWidget {
  final UserInfo author;
  const AuthorSection(this.author, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Text(
          "Erstellt von ${author.name}",
          style: Theme.of(context).textTheme.caption,
        ),
      ),
    );
  }
}
