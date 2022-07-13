import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import '../../../cubits/live_config_cubit/live_config_cubit.dart';
import '../../../routes.dart';
import '../../../utils/app_theme.dart';
import '../../../utils/tools.dart';
import '../../maps/view/maps_place_picker_page.dart';
import '../../post_discovery_feed/view/paged_post_discovery_feed.dart';
import '../../post_discovery_feed/view/post_discovery_feed.dart';
import '../../saved_feed/view/saved_posts_feed.dart';
import '../widgets/home_drawer/home_drawer_view.dart';

class _menuButton extends StatelessWidget {
  final IconData icon;
  const _menuButton({Key? key, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () => Scaffold.of(context).openDrawer(), icon: Icon(icon));
  }
}

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

enum _HomePages { feedPage, savedPage }

class _HomeViewState extends State<HomeView> {
  _HomePages _activePage = _HomePages.feedPage;

  // ignore: non_constant_identifier_names
  Widget _DEMOPlaceIndicator(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context2) => MapsPlacePickerPage(
                onPlacePicked: (pickResult) => null //TODO STORE LOCATION,
                ),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Padding(
            padding: EdgeInsets.only(right: 5),
            child: Icon(Icons.place_rounded),
          ),
          Text(
            "Ulm",
            style: TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }

  Widget _bottomNavItem(BuildContext context,
      {required String title,
      required IconData icon,
      Color? color,
      bool selected = false,
      double minWidth = 75.0,
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
              color: color?.withOpacity(0.1)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            // Replace with a Row for horizontal icon + text
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 7),
                child: Icon(
                  icon,
                  color: color,
                ),
              ),
              Text(
                title,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontWeight: selected ? FontWeight.w900 : null,
                    color: color),
              )
            ],
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const _menuButton(icon: FeatherIcons.menu),
        title: _DEMOPlaceIndicator(context),
        actions: const [
          SizedBox(
            width: 62,
          )
          /*IconButton(
              onPressed: null, //() => DevTools.showToDoSnackbar(context),
              icon: Icon(FeatherIcons.calendar))*/
        ],
      ),
      drawer: const HomeDrawer(),
      body: Container(
        padding: const EdgeInsets.only(
            left: AppTheme.PADDING_SIDE, right: AppTheme.PADDING_SIDE, top: 15),
        clipBehavior: Clip.none,
        child: _activePage == _HomePages.feedPage
            ? LiveConfig.builder((config) => config.pagedFeed
                ? const PagedPostDiscoveryFeed()
                : const PostDiscoveryFeed()) //const PostFeedView()
            : const SavedPostsFeed(),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _bottomNavItem(context,
                title: l10n(context).lbl_explore,
                icon: FeatherIcons.compass,
                selected: _activePage == _HomePages.feedPage,
                onPressed: () =>
                    setState(() => _activePage = _HomePages.feedPage)),
            _bottomNavItem(context,
                title: l10n(context).lbl_create,
                icon: FeatherIcons.plus,
                color: Theme.of(context).colorScheme.secondary,
                onPressed: () =>
                    Navigator.of(context).pushNamed(Routes.postEditor)),
            _bottomNavItem(context,
                title: l10n(context).lbl_saved,
                selected: _activePage == _HomePages.savedPage,
                icon: FeatherIcons.heart,
                onPressed: () =>
                    setState(() => _activePage = _HomePages.savedPage)),
          ],
        ),
      ),
    );
  }
}
