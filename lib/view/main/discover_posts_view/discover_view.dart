import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import '../../../../cubits/live_config_cubit/live_config_cubit.dart';
import '../../../../routes.dart';
import '../../../../utils/app_theme.dart';
import '../../../services/meta_info_service.dart';
import '../../tutorial/tutorial_overlay.dart';
import 'widgets/feed/discover_feed.dart';
import 'widgets/filter/cubit/feed_filter_cubit.dart';
import 'widgets/filter/filter_button.dart';

class DiscoverView extends StatefulWidget {
  const DiscoverView({super.key});

  @override
  State<DiscoverView> createState() => _DiscoverViewState();
}

class _DiscoverViewState extends State<DiscoverView> {
  @override
  void initState() {
    super.initState();

    // show tutorial on first open

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (await MetaInfoService.showTutorial()) {
        TutorialOverlay.asBottomSheet(context);
      }
    });
  }

  Widget _drawerButton(BuildContext outerContext) {
    return IconButton(
        onPressed: () => Scaffold.of(outerContext).openDrawer(),
        icon: const Icon(FeatherIcons.menu));
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<FeedFilterCubit>(create: (_) => FeedFilterCubit.create())
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
                child: DiscoverFeed()),
          );
        },
      ),
    );
  }
}
