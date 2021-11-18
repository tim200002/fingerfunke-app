import 'package:fingerfunke_app/utils/app_theme.dart';
import 'package:fingerfunke_app/utils/dev_tools.dart';
import 'package:fingerfunke_app/utils/util_widgets/page_screen.dart';
import 'package:fingerfunke_app/view/post/post_view.dart';
import 'package:flutter/material.dart';

class PostPage extends StatelessWidget {
  const PostPage({Key? key}) : super(key: key);

  static const List<BoxShadow> _cardShadow = [
    BoxShadow(
        color: Color(0xff6161616), //Colors.grey[700]!,
        offset: Offset(0, 3),
        spreadRadius: -2,
        blurRadius: 7)
  ];

  static final Widget _contentCardDecoration = Transform.translate(
      offset: const Offset(0, 1),
      child: Container(
          height: 15,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
              color: Colors.white)));

  Widget _closeButton(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(100),
            boxShadow: _cardShadow),
        child: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(Icons.close)));
  }

  @override
  Widget build(BuildContext context) {
    return PageScreen(
        appBar: AppBar(leading: _closeButton(context)),
        extendBodyBehindAppBar: true,
        headerHeight: 200,
        sidePadding: 0,
        roundedBody: false,
        roundedHeader: false,
        header: DevTools.placeholder("Video"),
        headerBottom: _contentCardDecoration,
        children: [
          Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(
                horizontal: AppTheme.PADDING_SIDE,
              ),
              child: PostView())
        ]);
  }
}
