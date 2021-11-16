import 'package:fingerfunke_app/utils/dev_tools.dart';
import 'package:fingerfunke_app/utils/util_widgets/page_screen.dart';
import 'package:flutter/material.dart';

class PostPage extends StatelessWidget {
  const PostPage({Key? key}) : super(key: key);

  static final Widget _contentCardDecoration = Container(
      height: 10,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
          color: Colors.white));

  @override
  Widget build(BuildContext context) {
    return PageScreen(
        appBar: AppBar(title: Text("post")),
        headerHeight: 200,
        sidePadding: 0,
        roundedBody: false,
        roundedHeader: false,
        header: DevTools.placeholder("Video"),
        headerBottom: _contentCardDecoration,
        body: Container(
          color: Colors.white,
        ));
  }
}
