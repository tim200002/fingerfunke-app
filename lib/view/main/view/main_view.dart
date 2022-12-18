import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import '../../../routes.dart';
import '../../../utils/tools.dart';
import '../widgets/explore_view/explore_view.dart';
import '../widgets/explore_view/widgets/home_drawer/home_drawer_view.dart';
import '../widgets/participate_view/participate_view.dart';
import 'bottom_nav_item.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

enum _MainViewPages { explore, user }

class _MainViewState extends State<MainView> {
  _MainViewPages _activePage = _MainViewPages.explore;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _activePage == _MainViewPages.explore
          ? const ExploreView()
          : const ParticipateView(),
      drawer: const HomeDrawer(),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomNavItem(
                title: l10n(context).lbl_explore,
                icon: FeatherIcons.compass,
                selected: _activePage == _MainViewPages.explore,
                onPressed: () =>
                    setState(() => _activePage = _MainViewPages.explore)),
            BottomNavItem(
                title: l10n(context).lbl_create,
                icon: FeatherIcons.plus,
                color: Theme.of(context).colorScheme.primary,
                onPressed: () =>
                    Navigator.of(context).pushNamed(Routes.postEditor)),
            BottomNavItem(
                title: l10n(context).lbl_mine,
                selected: _activePage == _MainViewPages.user,
                icon: FeatherIcons.user,
                onPressed: () =>
                    setState(() => _activePage = _MainViewPages.user)),
          ],
        ),
      ),
    );
  }
}
