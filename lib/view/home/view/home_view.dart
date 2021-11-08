import 'package:fingerfunke_app/utils/dev_tools.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

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
            onPressed: () => DevTools.showToDoSnackbar(context),
            icon: const Icon(Icons.menu)),
        actions: [
          IconButton(
              onPressed: () => DevTools.showToDoSnackbar(context),
              icon: const Icon(Icons.bookmark_outlined))
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () => DevTools.showToDoSnackbar(context),
        child: const Icon(Icons.add_rounded),
      ),
      bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(), //shape of notch
          notchMargin:
              5, //notche margin between floating button and bottom appbar
          child: Row(
            //children inside bottom appbar
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _bottomNavItem(context, title: "Events", icon: Icons.mood),
              _bottomNavItem(context, title: "Gruppen", icon: Icons.people),
            ],
          )),
    );
  }
}
