import 'package:fingerfunke_app/utils/app_theme.dart';
import 'package:fingerfunke_app/utils/dev_tools.dart';
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
        Text("Olymp")
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
            onPressed: () => Navigator.pushNamed(context, '/account'),
            icon: const Icon(Icons.menu)),
        actions: [
          IconButton(
              onPressed: () => Navigator.pushNamed(context, '/saved'),
              icon: const Icon(Icons.bookmark_outlined))
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: AppTheme.PADDING_SIDE),
        child: PostFeedView(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () => DevTools.showToDoSnackbar(context),
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
            _bottomNavItem(context, title: "Events", icon: Icons.mood),
            _bottomNavItem(context, title: "Gruppen", icon: Icons.people),
          ],
        ),
      ),
    );
  }
}
