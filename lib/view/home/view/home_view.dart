import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_maps_place_picker_mb/google_maps_place_picker.dart';

import '../../../cubits/live_config_cubit/live_config_cubit.dart';
import '../../../cubits/location_cubit/location_cubit.dart';
import '../../../repositories/location_repository/location_repository.dart';
import '../../../routes.dart';
import '../../../utils/app_theme.dart';
import '../../../utils/tools.dart';
import '../../maps/view/maps_place_picker_page.dart';
import '../../post/view/post_page.dart';
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
    return BlocProvider(
      create: (_) => LocationCubit(LocationRepositoryImpl()),
      child: BlocBuilder<LocationCubit, LocationState>(
        builder: (context, state) {
          if (state is Initial) context.read<LocationCubit>().loadLocation();
          return InkWell(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context2) => MapsPlacePickerPage(
                    onPlacePicked: (PickResult pickResult) => context
                        .read<LocationCubit>()
                        .updateLocation(location: pickResult.formattedAddress),
                  ),
                )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 5),
                  child: Icon(Icons.place_rounded),
                ),
                AutoSizeText(context.read<LocationCubit>().getCity())
              ],
            ),
          );
        },
      ),
    );
  }

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
        title: Text("TODO: Location"), //_DEMOPlaceIndicator(context),
        actions: [
          const SizedBox(
            width: 62,
          ),
          IconButton(
              onPressed: () => Navigator.of(context).pushNamed(Routes.feedback),
              icon: const Icon(FeatherIcons.frown))
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
                color: Theme.of(context).colorScheme.primary,
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
