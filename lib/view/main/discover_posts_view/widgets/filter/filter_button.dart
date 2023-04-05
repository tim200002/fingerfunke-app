import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import '../../../../../cubits/location_cubit/location_cubit.dart';
import '../../../../../models/filter/feed_filter.dart';
import '../../../../../models/place.dart';
import '../../../../../utils/tools.dart';
import 'cubit/feed_filter_cubit.dart';
import 'location_filter_view.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({super.key});

  Widget _locationProviders(
      Widget Function(FeedFilter filter, Place? place) builder) {
    return BlocBuilder<FeedFilterCubit, FeedFilter>(
        builder: (_, filter) => BlocBuilder<LocationCubit, LocationState>(
            builder: (context, state) => state.maybeWhen(
                loaded: (p) => builder(filter, p),
                orElse: () => builder(filter, null))));
  }

  @override
  Widget build(BuildContext context) {
    return _locationProviders((filter, place) => TextButton.icon(
        onPressed: () => LocationFilterView.navigate(context),
        icon: const Icon(FeatherIcons.mapPin),
        label: Text(
          place?.getCityName() ?? l10n(context).lbl_exploreFilter,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        )));
  }
}
