import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import '../../../../cubits/live_config_cubit/live_config_cubit.dart';
import '../../../../cubits/location_cubit/location_cubit.dart';
import '../../../../routes.dart';
import '../../../../utils/app_theme.dart';
import '../../../../utils/tools.dart';
import '../../../repositories/storage_repository/storage_repository.dart';
import 'widgets/feed/discover_feed.dart';
import 'widgets/filter/cubit/feed_filter_cubit.dart';
import 'widgets/filter/location_filter_view.dart';

class DiscoverView extends StatelessWidget {
  const DiscoverView({super.key});

  Widget _drawerButton(BuildContext outerContext) {
    return IconButton(
        onPressed: () => Scaffold.of(outerContext).openDrawer(),
        icon: const Icon(FeatherIcons.menu));
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LocationCubit>(
          create: (context) => LocationCubit(),
        ),
        BlocProvider<FeedFilterCubit>(create: (_) {
          final StorageRepository storageRepository = StorageRepositoryImpl();
          return FeedFilterCubit(
              storageRepository: storageRepository,
              initialFeedFilterState: storageRepository.feedFilterSettings);
        })
      ],
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              leading: _drawerButton(context),
              title: const FilterButton(),
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
                child: const DiscoverFeed()),
          );
        },
      ),
    );
  }
}

class FilterButton extends StatelessWidget {
  const FilterButton({super.key});

  /*Route _filterRoute(BuildContext c) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          MultiBlocProvider(providers: [
       
      ], child: const LocationFilterView()),
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
  }*/

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
        onPressed: () => LocationFilterView.navigate(context),
        icon: const Icon(FeatherIcons.mapPin),
        label: BlocBuilder<LocationCubit, LocationState>(
            builder: (c, state) => Text(state.maybeWhen(
                loaded: (l) => l.getCityName(),
                orElse: () => l10n(c).lbl_exploreFilter))));
  }
}
