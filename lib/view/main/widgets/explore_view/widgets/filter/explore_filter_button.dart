import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import '../../../../../../cubits/location_cubit/location_cubit.dart';
import '../../../../../../utils/tools.dart';
import 'explore_filter_view.dart';

class ExploreFilterButton extends StatelessWidget {
  const ExploreFilterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
        onPressed: () => ExploreFilterView.navigate(context),
        icon: const Icon(FeatherIcons.mapPin),
        label: BlocBuilder<LocationCubit, LocationState>(
            builder: (c, state) => Text(state.maybeWhen(
                loaded: (l) => l.getCityName() ?? l10n(c).lbl_exploreFilter,
                orElse: () => l10n(c).lbl_exploreFilter))));
  }
}
