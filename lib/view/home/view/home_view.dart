import 'package:fingerfunke_app/routes.dart';
import 'package:fingerfunke_app/utils/app_theme.dart';
import 'package:fingerfunke_app/utils/dev_tools.dart';
import 'package:fingerfunke_app/view/home/widgets/home_drawer/home_drawer_view.dart';
import 'package:fingerfunke_app/view/post_feed/view/post_feed_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

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
      onTap: () => showDialog(
          context: context,
          builder: (BuildContext context) => const AlertDialog(
                title: Text('TODO'),
                content: Text('LocationDialog'),
              )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Padding(
            padding: EdgeInsets.only(right: 5),
            child: Icon(Icons.place_rounded),
          ),
          Text("Ulm")
        ],
      ),
    );
  }

  Widget _bottomNavItem(BuildContext context,
      {required String title,
      required IconData icon,
      Color? color,
      bool selected = false,
      required Function() onPressed}) {
    return InkWell(
        onTap: onPressed,
        child: Container(
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
                style: TextStyle(
                    color: color,
                    fontWeight: selected ? FontWeight.bold : null,
                    fontSize: 12),
              )
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _DEMOPlaceIndicator(context),
        actions: [
          IconButton(
              onPressed: () => DevTools.showToDoSnackbar(context),
              icon: const Icon(FeatherIcons.calendar))
        ],
      ),
      drawer: const HomeDrawer(),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: AppTheme.PADDING_SIDE),
        clipBehavior: Clip.none,
        child: _activePage == _HomePages.feedPage
            ? const PostFeedView()
            : DevTools.placeholder("saved posts"),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _bottomNavItem(context,
                title: "Entdecken",
                icon: FeatherIcons.compass,
                selected: _activePage == _HomePages.feedPage,
                onPressed: () =>
                    setState(() => _activePage = _HomePages.feedPage)),
            _bottomNavItem(context,
                title: "Erstellen",
                icon: FeatherIcons.plus,
                color: Theme.of(context).colorScheme.secondary,
                onPressed: () =>
                    Navigator.of(context).pushNamed(Routes.postEditor)),
            _bottomNavItem(context,
                title: "Merkliste",
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
