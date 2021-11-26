import 'package:fingerfunke_app/utils/dev_tools.dart';
import 'package:flutter/material.dart';

class PostEditorPage extends StatelessWidget {
  const PostEditorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: DevTools.placeholder("Post Editor"),
    );
  }
}
