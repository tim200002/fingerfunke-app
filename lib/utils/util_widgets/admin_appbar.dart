import 'package:flutter/material.dart';

enum AdminFunction { moderation, development }

class AdminAppBar {
  static AppBar widget(AdminFunction func,
      {required String title, List<Widget>? actions}) {
    return AppBar(
      centerTitle: false,
      title: Row(
        children: [
          Container(
              margin: EdgeInsets.only(right: 10),
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 9),
              decoration: BoxDecoration(
                  color: func == AdminFunction.moderation
                      ? Colors.orange.shade400
                      : Colors.teal.shade400,
                  borderRadius: BorderRadius.circular(30)),
              child: Text(
                func == AdminFunction.moderation ? "mod" : "dev",
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              )),
          Expanded(
              child: Text(
            title,
            maxLines: 2,
          )),
        ],
      ),
      actions: actions,
    );
  }
}
