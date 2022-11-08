import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import '../../../../utils/app_theme.dart';
import '../../../saved_feed/view/saved_posts_feed.dart';

class SavedView extends StatelessWidget {
  const SavedView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const TabBar(
            indicatorColor: Color(0xffF0ACB0),
            labelColor: Colors.black,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorWeight: 3,
            tabs: [
              Tab(text: "gespeichert"),
              Tab(text: "meine Posts"),
            ],
          ),
          //title: const Text('Tabs Demo'),
        ),
        body: const Padding(
          padding: EdgeInsets.only(
              left: AppTheme.PADDING_SIDE,
              right: AppTheme.PADDING_SIDE,
              top: 15),
          child: TabBarView(
            children: [
              SavedPostsFeed(),
              Icon(Icons.directions_transit),
            ],
          ),
        ),
      ),
    );
  }
}
