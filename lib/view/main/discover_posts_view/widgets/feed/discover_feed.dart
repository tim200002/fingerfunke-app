import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get_it/get_it.dart';

import '../../../../../../../common_widgets/list_items/post_feed_image_item.dart';
import '../../../../../../../cubits/location_cubit/location_cubit.dart';
import '../../../../../../../cubits/settings_cubit/app_settings_cubit.dart';
import '../../../../../../../models/post/post.dart';
import '../../../../../../../models/settings/app_settings.dart';
import '../../../../../../../utils/illustration.dart';
import '../../../../../../../utils/tools.dart';
import '../../../../../common_widgets/paginated_list/paged_paginated_list_double_direction.dart';
import '../../../../../cubits/better_pagination/cubit/double_pagination_cubit.dart';
import '../../../../../models/filter/feed_filter.dart';
import '../../../../../models/place.dart';
import '../../../../../repositories/geocoding_repository/geocodig_repository.dart';
import '../../../../illustration_view/illustration_view.dart';
import '../../../../maps/view/maps_place_picker_page.dart';
import '../filter/cubit/feed_filter_cubit.dart';

class DiscoverFeed extends StatelessWidget {
  DiscoverFeed({Key? key}) : super(key: key);

  final FirebaseFirestore _firestore = GetIt.I.get<FirebaseFirestore>();

  Query<Post> _createBackwardQuery(Place userLocation, FeedFilter filters) {
    Query<Map<String, dynamic>> untypedQuery = _firestore
        .collection('posts')
        .where('visibility', isEqualTo: PostVisibility.visible.name)
        .where('geohashesByRadius.${filters.locationRadius}',
            arrayContains: userLocation.geohash)
        .where('startTime',
            isLessThanOrEqualTo: DateTime.now().millisecondsSinceEpoch)
        .orderBy('startTime', descending: true);

    Query<Post> typedQuery = untypedQuery.withConverter<Post>(
        fromFirestore: (snapshot, _) => Post.fromDoc(snapshot),
        toFirestore: (post, _) => post.toJson());

    return typedQuery;
  }

  /// Creates a query for the discover feed
  Query<Post> _createForwardQuery(Place userLocation, FeedFilter filters) {
    Query<Map<String, dynamic>> untypedQuery = _firestore
        .collection('posts')
         .where('visibility', isEqualTo: PostVisibility.visible.name)
        .where('geohashesByRadius.${filters.locationRadius}',
            arrayContains: userLocation.geohash)
        .where('startTime',
            isGreaterThanOrEqualTo: DateTime.now().millisecondsSinceEpoch);

    if (filters.hideFarFuture) {
      DateTime farFuture = DateTime.now();
      farFuture = farFuture.add(const Duration(days: 30));
      untypedQuery = untypedQuery.where('startTime',
          isLessThanOrEqualTo: farFuture.millisecondsSinceEpoch);
    }

    // ugly hack: Problem after inequality first order by must start with same field
    untypedQuery = untypedQuery
        .orderBy('startTime')
        .orderBy('creationTime', descending: true);

    Query<Post> typedQuery = untypedQuery.withConverter<Post>(
        fromFirestore: (snapshot, _) => Post.fromDoc(snapshot),
        toFirestore: (post, _) => post.toJson());

    return typedQuery;
  }

  Widget _locationBuilders(
      Widget Function(FeedFilter filter, Place place) builder) {
    return BlocBuilder<FeedFilterCubit, FeedFilter>(
      builder: (_, filter) => BlocBuilder<LocationCubit, LocationState>(
        builder: (context, state) => state.when(
          error: (e) => IllustrationView.error(
              text: l10n(context).lbl_locationLoadError,
              retry: () => context.read<LocationCubit>().loadLocation()),
          noPosition: (permissionState) => const _NoLocationWidget(),
          uninitialized: () =>
              const Center(child: CircularProgressIndicator.adaptive()),
          loaded: (location) => builder(filter, location),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Expanded(
          child: _locationBuilders((filter, place) =>
              BlocBuilder<AppSettingsCubit, AppSettings>(
                buildWhen: ((previous, current) =>
                    previous.dsAutoplay != current.dsAutoplay),
                builder: (context, settings) {
                  return BlocProvider<DoublePaginationCubit<Post>>(
                    // Necessary to trigger rebuilds whenever location or filters change
                    key: Key(
                        filter.hashCode.toString() + place.hashCode.toString()),
                    create: (_) => DoublePaginationCubit<Post>(
                      _createForwardQuery(place, filter),
                      _createBackwardQuery(place, filter),
                    ),
                    child: PagedPaginatedListDoubleDirection<Post>(
                        itemBuilder: (post) => PostFeedImageItem(
                              post,
                              video: settings.dsAutoplay,
                              key: ValueKey(post.id),
                            ),
                        emptyListIndicator: IllustrationView.empty(
                            text: l10n(context).msg_feedEmpty),
                        endIndicatorForward: IllustrationView.empty(
                            text: l10n(context).msg_feedNoMoreNewPosts),
                        endIndicatorBackward: IllustrationView.empty(
                            text: l10n(context).msg_feedNoMoreOldPosts),
                        loadingIndicator: const FeedItemLoading()),
                  );
                },
              )),
        ),
      ]),
    );
  }
}

class _NoLocationWidget extends StatelessWidget {
  const _NoLocationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return IllustrationView(
      illustration: Illustrations.location,
      illustrationHeight: 100,
      text: l10n(context).lbl_locationRequired,
      action: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 20),
          ...[
            TextButton(
                onPressed: () => Geolocator.openAppSettings(), //.then((_) => ),
                child: Text(l10n(context).lbl_grantLocationPermission)),
            TextButton(
                onPressed: () =>
                    _maunallyPickLocation(context), //.then((_) => ),
                child: Text(l10n(context).lbl_manuallyChooseLocation)),
          ],
        ],
      ),
    );
  }

  Future<void> _maunallyPickLocation(BuildContext context) =>
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => MapsPlacePickerPage(
            onPlacePicked: (p) async {
              var location = p.geometry!.location;
              Place place = await GeoCodingRepository.placeFromCoordinate(
                  Coordinate(location.lat, location.lng));
              context.read<LocationCubit>().setLocation(place);
              Navigator.of(context).pop();
            },
          ),
        ),
      );
}
