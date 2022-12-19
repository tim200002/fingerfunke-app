import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../common_widgets/list_items/post_feed_image_item.dart';
import '../../../../../../cubits/location_cubit/location_cubit.dart';
import '../../../../../../cubits/settings_cubit/app_settings_cubit.dart';
import '../../../../../../models/post/post.dart';
import '../../../../../../models/settings/app_settings.dart';
import '../../../../../../repositories/post_repository/post_repository.impl.dart';
import '../../../../../../utils/illustration.dart';
import '../../../../../../utils/tools.dart';
import '../../../../../../utils/util_cubits/stream/stream_subscribe_cubit.dart';
import '../../../../../error/exception_view.dart';
import '../../../../../illustration_view/illustration_view.dart';
import '../filter/cubit/feed_filter_cubit.dart';

class PagedPostDiscoveryFeed extends StatelessWidget {
  const PagedPostDiscoveryFeed({Key? key}) : super(key: key);

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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: BlocBuilder<LocationCubit, LocationState>(
                  builder: (context, state) => state.when(
                      error: (e) => IllustrationView.error(
                          text: l10n(context).lbl_locationLoadError,
                          retry: () => context.read<LocationCubit>().refresh),
                      denied: (p) => _locationDenied(context, p),
                      loading: () => const Center(
                          child: CircularProgressIndicator.adaptive()),
                      loaded: (location) =>
                          BlocBuilder<FeedFilterCubit, FeedFilterState>(
                              builder: (context, filter) {
                            var stream = PostRepositoryImpl()
                                .observeNearbyPosts(
                                    point: location.toGeoPoint(),
                                    radius: filter.distance,
                                    worker: (l) => context
                                        .read<FeedFilterCubit>()
                                        .filter(l));
                            return StreamSubscribeCubit.asWidget<List<Post>>(
                                key: Key(filter.hashCode.toString()),
                                dataStream: stream,
                                builder: (context, state) => state.when(
                                      loading: () => const Center(
                                          child: CircularProgressIndicator
                                              .adaptive()),
                                      error: ExceptionView.builder,
                                      neutral: (posts) => BlocBuilder<
                                              AppSettingsCubit, AppSettings>(
                                          builder: (_, settings) => feedList(
                                                items: posts,
                                                itemBuilder: (post) =>
                                                    PostFeedImageItem(
                                                  post,
                                                  video: settings.dsAutoplay,
                                                  key: ValueKey(post.id),
                                                ),
                                                endIndicator:
                                                    IllustrationView.empty(
                                                        text: l10n(context)
                                                            .msg_feedEmpty),
                                              )),
                                    ));
                          }))))
        ],
      ),
    );
  }
}
