import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../common_widgets/list_items/post_feed_image_item.dart';
import '../../../../../../../cubits/location_cubit/location_cubit.dart';
import '../../../../../../../cubits/settings_cubit/app_settings_cubit.dart';
import '../../../../../../../models/post/post.dart';
import '../../../../../../../models/settings/app_settings.dart';
import '../../../../../../../utils/illustration.dart';
import '../../../../../../../utils/tools.dart';
import '../../../../../common_widgets/paginated_list/paged_paginated_list.dart';
import '../../../../illustration_view/illustration_view.dart';
import '../filter/cubit/feed_filter_cubit.dart';
import '../filter/cubit/feed_filter_state.dart';
import 'cubit/discover_feed_cubit.dart';

class DiscoverFeed extends StatelessWidget {
  const DiscoverFeed({Key? key}) : super(key: key);

  Widget feedList(
      {required List<Post> items,
      required Widget Function(Post) itemBuilder,
      required Widget endIndicator}) {
    return PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: items.length + 1,
        itemBuilder: (context, i) {
          return i >= items.length ? endIndicator : itemBuilder(items[i]);
        });
  }

  Widget _locationDenied(BuildContext context, bool permanent) =>
      IllustrationView(
          illustration: Illustrations.location,
          illustrationHeight: 100,
          text: l10n(context).lbl_locationRequired,
          action: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (permanent) const SizedBox(height: 20),
              TextButton(
                  onPressed: permanent
                      ? context.read<LocationCubit>().openSettings
                      : context.read<LocationCubit>().refresh,
                  child: Text(l10n(context).lbl_grantLocationPermission)),
              if (permanent)
                IllustrationView.retryButton(
                    context, context.read<LocationCubit>().refresh)
            ],
          ));

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Expanded(
          child: BlocBuilder<LocationCubit, LocationState>(
            builder: (context, state) => state.when(
              error: (e) => IllustrationView.error(
                  text: l10n(context).lbl_locationLoadError,
                  retry: () => context.read<LocationCubit>().refresh),
              denied: (p) => _locationDenied(context, p),
              loading: () =>
                  const Center(child: CircularProgressIndicator.adaptive()),
              loaded: (location) =>
                  BlocBuilder<FeedFilterCubit, FeedFilterState>(
                builder: (context, locationFilters) {
                    return BlocProvider<DiscoverFeedCubit>(
                  //! Not sure if this is valid 
                  key: Key(locationFilters.toString()+location.toString()),
                  create: (_) => DiscoverFeedCubit(
                      userLocation: location, filters: locationFilters),
                  child:
                      // This will forcfully lead to rebuild whenever settings change, however,
                      // it should be mroe efficient then doing same operation on a per post level
                      // worth it in my opinion
                      BlocBuilder<AppSettingsCubit, AppSettings>(
                    buildWhen: ((previous, current) =>
                        previous.dsAutoplay != current.dsAutoplay),
                    builder: (context, settings) =>
                        BlocBuilder<DiscoverFeedCubit, DiscoverFeedState>(
                      builder: (context, state) => PagedPaginatedList<Post>(
                        state: state,
                        itemBuilder: (post) => PostFeedImageItem(
                          post,
                          video: settings.dsAutoplay,
                          key: ValueKey(post.id),
                        ),
                        onRequestNewPage: () =>
                            context.read<DiscoverFeedCubit>().requestNewPage(),
                        endIndicator: IllustrationView.empty(
                            text: l10n(context).msg_feedEmpty),
                        loadingIndicator: IllustrationView.empty(
                      text: "One Moment we are loading new posts"),
                      ),
                    ),
                  ),
                );},
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
