import 'package:fingerfunke_app/utils/dev_tools.dart';
import 'package:flutter/material.dart';

class CommentEditor extends StatelessWidget {
  const CommentEditor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(30),
          ),
          child: TextField(
            decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 7, horizontal: 15),
                border: InputBorder.none,
                labelText: "neuer Kommentar",
                suffixIcon: IconButton(
                    onPressed: () => DevTools.showToDoSnackbar(context),
                    icon: Icon(Icons.video_call_rounded))),
          ),
        )),
        Padding(
          padding: EdgeInsets.only(left: 5),
          child: IconButton(
              onPressed: () => DevTools.showToDoSnackbar(context),
              icon: Icon(Icons.send_rounded)),
        )
      ],
    );
  }
}
