import 'package:fingerfunke_app/view/post_feed/view/post_feed_view.dart';
import 'package:flutter/material.dart';

class SavedPage extends StatelessWidget {
  const SavedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gespeicherte Posts"),
      ),
      body: const Padding(
          padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
          child: PostFeedView()),
    );
  }
}
