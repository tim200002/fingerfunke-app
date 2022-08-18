import 'package:flutter/material.dart';

import '../../models/user/user.dart';

class AdminAppBar {
  static AppBar widget(BuildContext context, UserClearance clearance,
      {required String title, List<Widget>? actions}) {
    return AppBar(
      centerTitle: false,
      title: Row(
        children: [
          Container(
              margin: const EdgeInsets.only(right: 10),
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 9),
              decoration: BoxDecoration(
                  color: clearance.color.shade400,
                  borderRadius: BorderRadius.circular(30)),
              child: Text(
                clearance.label,
                style: Theme.of(context).primaryTextTheme.labelSmall,
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
