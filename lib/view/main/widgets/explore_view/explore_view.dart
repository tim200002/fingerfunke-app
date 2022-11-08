import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import '../../../../cubits/location_cubit/location_cubit.dart';
import '../../../../routes.dart';
import '../../../../utils/app_theme.dart';
import 'widgets/post_discovery_feed/paged_post_discovery_feed.dart';
import 'widgets/filter/cubit/feed_filter_cubit.dart';
import 'widgets/filter/explore_filter_view.dart';
import 'widgets/home_drawer/home_drawer_view.dart';

class _MenuButton extends StatelessWidget {
  final IconData icon;
  const _MenuButton({Key? key, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () => Scaffold.of(context).openDrawer(), icon: Icon(icon));
  }
}

class ExploreView extends StatelessWidget {
  const ExploreView({super.key});

  Widget _filterButton() {
    return Builder(
        builder: (c) => TextButton.icon(
            onPressed: () => Navigator.of(c).push(MaterialPageRoute(
                builder: (context) => MultiBlocProvider(providers: [
                      BlocProvider.value(
                        value: BlocProvider.of<FeedFilterCubit>(c),
                      ),
                      BlocProvider.value(
                        value: BlocProvider.of<LocationCubit>(c),
                      ),
                    ], child: const ExploreFilterView()))),
            icon: const Icon(FeatherIcons.mapPin),
            label: const Text("Filter")));
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<FeedFilterCubit>(
            create: (context) => FeedFilterCubit(),
          ),
          BlocProvider<LocationCubit>(
            create: (context) => LocationCubit(),
          ),
        ],
        child: Scaffold(
          appBar: AppBar(
            leading: const _MenuButton(icon: FeatherIcons.menu),
            title: _filterButton(),
            actions: [
              const SizedBox(
                width: 62,
              ),
              IconButton(
                  onPressed: () =>
                      Navigator.of(context).pushNamed(Routes.feedback),
                  icon: const Icon(Icons.thumbs_up_down_rounded))
              /*IconButton(
                        onPressed: null, //() => DevTools.showToDoSnackbar(context),
                        icon: Icon(FeatherIcons.calendar))*/
            ],
          ),
          drawer: const HomeDrawer(),
          body: Container(
              padding: const EdgeInsets.only(
                  left: AppTheme.PADDING_SIDE,
                  right: AppTheme.PADDING_SIDE,
                  top: 15),
              clipBehavior: Clip.none,
              child: PagedPostDiscoveryFeed()),
        ));
  }
}
