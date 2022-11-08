import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../common_widgets/list_view/list_items/post_feed_image_item.dart';
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

  Widget _locationError(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 250),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Illustration(
              Illustrations.location,
              height: 100,
            ),
            const SizedBox(height: 30),
            const Text(
              "Die App benötigt Deinen Standort für das Anzeigen von Posts in Deiner Nähe. Bitte gebe diesen frei.",
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            TextButton(
                onPressed: () {
                  context.read<LocationCubit>().reload();
                },
                child: const Text("erneut versuchen"))
          ],
        ),
      ),
    );
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
                      error: (_) => _locationError(context),
                      loading: () => const Center(
                          child: CircularProgressIndicator.adaptive()),
                      loaded: (location, address) =>
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
                                      neutral: (posts) => BlocBuilder<
                                              AppSettingsCubit, AppSettings>(
                                          builder: (_, settings) => feedList(
                                                items: posts,
                                                itemBuilder: (post) =>
                                                    PostFeedImageItem(
                                                  post,
                                                  video:
                                                      settings.dsFeedAutoplay,
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
