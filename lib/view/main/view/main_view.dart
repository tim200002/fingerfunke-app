import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import '../../../routes.dart';
import '../../../utils/tools.dart';
import '../../saved_feed/view/saved_posts_feed.dart';
import '../widgets/explore_view/explore_view.dart';
import '../widgets/saved_view/saved_view.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

enum _MainViewPages { explore, saved }

class _MainViewState extends State<MainView> {
  _MainViewPages _activePage = _MainViewPages.explore;

  Widget _bottomNavItem(BuildContext context,
      {required String title,
      required IconData icon,
      final Color? color,
      bool selected = false,
      double minWidth = 80.0,
      required Function() onPressed}) {
    return InkWell(
      borderRadius: BorderRadius.circular(17),
      onTap: onPressed,
      child: Container(
          constraints: BoxConstraints(minWidth: minWidth),
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: color != null
                  ? Color.alphaBlend(
                      color.withOpacity(0.1), Theme.of(context).canvasColor)
                  : null),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            // Replace with a Row for horizontal icon + text
            children: [
              Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: selected
                      ? Text(
                          String.fromCharCode(icon.codePoint),
                          style: TextStyle(
                            inherit: false,
                            color: color ?? Colors.black,
                            fontSize: 24.0,
                            fontWeight: FontWeight.w900,
                            fontFamily: icon.fontFamily,
                            package: icon.fontPackage,
                          ),
                        )
                      : Icon(
                          icon,
                          color: color,
                        )),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 9),
                /*decoration: selected
                    ? BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color.alphaBlend(
                            Theme.of(context)
                                .colorScheme
                                .primary
                                .withOpacity(0.1),
                            Theme.of(context).canvasColor))
                    : null,*/
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontWeight: selected ? FontWeight.w900 : null,
                      color: color),
                ),
              )
            ],
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _activePage == _MainViewPages.explore
          ? const ExploreView()
          : const SavedView(),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _bottomNavItem(context,
                title: l10n(context).lbl_explore,
                icon: FeatherIcons.compass,
                selected: _activePage == _MainViewPages.explore,
                onPressed: () =>
                    setState(() => _activePage = _MainViewPages.explore)),
            _bottomNavItem(context,
                title: l10n(context).lbl_create,
                icon: FeatherIcons.plus,
                color: Theme.of(context).colorScheme.primary,
                onPressed: () =>
                    Navigator.of(context).pushNamed(Routes.postEditor)),
            _bottomNavItem(context,
                title: l10n(context).lbl_saved,
                selected: _activePage == _MainViewPages.saved,
                icon: FeatherIcons.heart,
                onPressed: () =>
                    setState(() => _activePage = _MainViewPages.saved)),
          ],
        ),
      ),
    );
  }
}
