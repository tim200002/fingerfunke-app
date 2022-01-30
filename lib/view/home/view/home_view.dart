import 'package:fingerfunke_app/routes.dart';
import 'package:fingerfunke_app/utils/app_theme.dart';
import 'package:fingerfunke_app/utils/dev_tools.dart';
import 'package:fingerfunke_app/view/error/exception_view.dart';
import 'package:fingerfunke_app/view/post_feed/view/post_feed_view.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  // ignore: non_constant_identifier_names
  Widget _DEMOPlaceIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Padding(
          padding: EdgeInsets.only(right: 5),
          child: Icon(Icons.place_rounded),
        ),
        Text("Ulm")
      ],
    );
  }

  Widget _bottomNavItem(BuildContext context,
      {required String title, required IconData icon}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(icon),
            onPressed: () => DevTools.showToDoSnackbar(context),
          ),
          //Text(title),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _DEMOPlaceIndicator(),
        leading: IconButton(
            onPressed: () => Navigator.pushNamed(context, accountRoute),
            icon: const Icon(Icons.menu)),
        actions: [
          IconButton(
              onPressed: () => Navigator.pushNamed(context, savedRoute),
              icon: const Icon(Icons.bookmark_outlined))
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: AppTheme.PADDING_SIDE),
        clipBehavior: Clip.none,
        child: const PostFeedView(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, postEditorRoute),
        child: const Icon(Icons.add_rounded),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(), //shape of notch
        notchMargin:
            5, //notche margin between floating button and bottom appbar
        child: Row(
          //children inside bottom appbar
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _bottomNavItem(context, title: "Events", icon: Icons.home),
            _bottomNavItem(context,
                title: "Events", icon: Icons.favorite_rounded),
            _bottomNavItem(context,
                title: "Gruppen", icon: Icons.account_circle),
          ],
        ),
      ),
    );
  }
}
