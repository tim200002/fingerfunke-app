import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import '../../../../cubits/live_config_cubit/live_config_cubit.dart';
import '../../../../cubits/location_cubit/location_cubit.dart';
import '../../../../routes.dart';
import '../../../../utils/app_theme.dart';
import '../../../../utils/tools.dart';
import 'widgets/filter/cubit/feed_filter_cubit.dart';
import 'widgets/filter/explore_filter_view.dart';
import 'widgets/post_discovery_feed/paged_post_discovery_feed.dart';

class ExploreView extends StatelessWidget {
  const ExploreView({super.key});

  Widget _drawerButton(BuildContext outerContext) {
    return IconButton(
        onPressed: () => Scaffold.of(outerContext).openDrawer(),
        icon: const Icon(FeatherIcons.menu));
  }

  Route _filterRoute(BuildContext c) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          MultiBlocProvider(providers: [
        BlocProvider.value(
          value: BlocProvider.of<FeedFilterCubit>(c),
        ),
        BlocProvider.value(
          value: BlocProvider.of<LocationCubit>(c),
        ),
      ], child: const ExploreFilterView()),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, -1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  Widget _filterButton(BuildContext context) {
    return Builder(
        builder: (c) => TextButton.icon(
            onPressed: () => Navigator.of(c).push(_filterRoute(c)),
            icon: const Icon(FeatherIcons.mapPin),
            label: Text(l10n(context).lbl_exploreFilter)));
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
            leading: _drawerButton(context),
            title: _filterButton(context),
            actions: [
              const SizedBox(
                width: 62,
              ),
              LiveConfig.builder((config) => config.hideFeedbackBtn
                  ? Container()
                  : IconButton(
                      onPressed: () =>
                          Navigator.of(context).pushNamed(Routes.feedback),
                      icon: const Icon(Icons.thumbs_up_down_rounded)))
            ],
          ),
          body: Container(
              padding: const EdgeInsets.only(
                  left: AppTheme.PADDING_SIDE,
                  right: AppTheme.PADDING_SIDE,
                  top: 15),
              clipBehavior: Clip.none,
              child: const PagedPostDiscoveryFeed()),
        ));
  }
}
