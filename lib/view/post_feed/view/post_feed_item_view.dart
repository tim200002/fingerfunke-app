import 'package:fingerfunke_app/utils/dev_tools.dart';
import 'package:flutter/material.dart';

class PostFeedItem extends StatelessWidget {
  const PostFeedItem({Key? key}) : super(key: key);

  Widget _PLACEHOLDER_authorImage() {
    return Container(
      height: 20,
      width: 20,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: DevTools.colorPlaceholder,
      ),
    );
  }

  Widget _authorInfo(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
      Padding(
          padding: EdgeInsets.only(right: 6),
          child: _PLACEHOLDER_authorImage()),
      Text(
        "Example User",
        style: TextStyle(fontWeight: FontWeight.bold),
      )
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(13),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Colors.grey[300]!,
              offset: Offset(0, 2),
              spreadRadius: 1,
              blurRadius: 3)
        ],
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
      ),
      margin: EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
              constraints: BoxConstraints(minHeight: 100),
              child: Text(
                "This an example title of the event",
                style: Theme.of(context).textTheme.headline4,
              )),
          _authorInfo(context)
        ],
      ),
    );
  }
}
