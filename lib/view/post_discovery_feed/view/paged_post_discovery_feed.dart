import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common_widgets/list_view/list_items/post_feed_image_item.dart';
import '../../../cubits/location_cubit/location_cubit.dart';
import '../../../models/post/post.dart';
import '../../../repositories/post_repository/post_repository.impl.dart';
import '../../../utils/tools.dart';
import '../../../utils/util_cubits/stream/stream_subscribe_cubit.dart';
import '../../error/exception_view.dart';
import '../../home/widgets/filter/cubit/feed_filter_cubit.dart';
import '../../moderation/mod_post_report/mod_post_report_page.dart';

class PagedPostDiscoveryFeed extends StatelessWidget {
  const PagedPostDiscoveryFeed({Key? key}) : super(key: key);

  Widget demoFeedList(
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
                      error: ExceptionView.builder,
                      loading: () => const Center(
                          child: CircularProgressIndicator.adaptive()),
                      loaded: (location) =>
                          BlocBuilder<FeedFilterCubit, FeedFilterState>(
                              builder: (context, filter) {
                            var stream = PostRepositoryImpl()
                                .observeNearbyPosts(
                                    point: GeoPoint(
                                        location.latitude, location.longitude),
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
                                      neutral: (posts) => demoFeedList(
                                        items: posts,
                                        itemBuilder: (post) =>
                                            PostFeedImageItem(
                                          post,
                                          key: ValueKey(post.id),
                                        ),
                                        endIndicator:
                                            ModPostReportPage.emptyIndicator(
                                                l10n(context).msg_feedEmpty),
                                      ),
                                    ));
                          }))))
        ],
      ),
    );
  }
}
