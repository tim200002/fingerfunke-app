import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

import '../../../../../../../common_widgets/list_items/post_feed_image_item.dart';
import '../../../../../../../cubits/location_cubit/location_cubit.dart';
import '../../../../../../../cubits/settings_cubit/app_settings_cubit.dart';
import '../../../../../../../models/post/post.dart';
import '../../../../../../../models/settings/app_settings.dart';
import '../../../../../../../utils/illustration.dart';
import '../../../../../../../utils/tools.dart';
import '../../../../../common_widgets/paginated_list/paged_paginated_list.dart';
import '../../../../../models/filter/feed_filter.dart';
import '../../../../../models/place.dart';
import '../../../../../repositories/geocoding_repository/geocodig_repository.dart';
import '../../../../illustration_view/illustration_view.dart';
import '../../../../maps/view/maps_place_picker_page.dart';
import '../filter/cubit/feed_filter_cubit.dart';
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

  Widget _locationBuilders(
      Widget Function(FeedFilter filter, Place place) builder) {
    return BlocBuilder<FeedFilterCubit, FeedFilter>(
      builder: (_, filter) => BlocBuilder<LocationCubit, LocationState>(
        builder: (context, state) => state.when(
          error: (e) => IllustrationView.error(
              text: l10n(context).lbl_locationLoadError,
              retry: () => context.read<LocationCubit>().loadLocation()),
          noPosition: (permissionState) => const _NoLocationWidget(
          ),
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
          child: _locationBuilders(
            (filter, place) => BlocProvider<DiscoverFeedCubit>(
              // Necessary to trigger rebuilds whenever location or filters change
              key: Key(filter.hashCode.toString() + place.hashCode.toString()),
              create: (_) =>
                  DiscoverFeedCubit(userLocation: place, filters: filter),
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
                      loadingIndicator: const FeedItemLoading()),
                ),
              ),
            ),
          ),
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
