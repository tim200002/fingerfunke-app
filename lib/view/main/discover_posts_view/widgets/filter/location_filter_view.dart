import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_maps_place_picker_mb/google_maps_place_picker.dart';
import 'package:easy_debounce/easy_debounce.dart';

import '../../../../../../cubits/location_cubit/location_cubit.dart';
import '../../../../../../utils/app_config.dart';
import '../../../../../../utils/tools.dart';
import '../../../../maps/view/maps_place_picker_page.dart';
import 'cubit/feed_filter_cubit.dart';
import 'cubit/feed_filter_state.dart';

part "location_slider.dart";
part "filter_item.dart";

class LocationFilterView extends StatelessWidget {
  const LocationFilterView._({Key? key}) : super(key: key);

  static Widget _providers(BuildContext c) {
    return MultiBlocProvider(providers: [
      BlocProvider.value(
        value: BlocProvider.of<FeedFilterCubit>(c),
      ),
      BlocProvider.value(
        value: BlocProvider.of<LocationCubit>(c),
      ),
    ], child: const LocationFilterView._());
  }

  static void navigate(BuildContext context) {
    showDialog<void>(
        context: context,
        //useSafeArea: false,
        barrierDismissible: true, // user must not tap button!
        builder: (_) => Align(
            alignment: Alignment.topCenter,
            child: Material(
                type: MaterialType.transparency,
                child: ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(bottom: Radius.circular(20)),
                  child: ConstrainedBox(
                      constraints: const BoxConstraints(maxHeight: 600),
                      child: _providers(context)),
                ))));
  }

  Widget _sectionHeader(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final FeedFilterState initalFilterState =
        context.read<FeedFilterCubit>().state;
    return Container(
        color: Colors.white,
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AppBar(
                  title: Text(l10n(context).lbl_exploreFilterEdit),
                  automaticallyImplyLeading: false,
                  actions: [
                    IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: const Icon(FeatherIcons.check))
                  ]),
              ListView(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                shrinkWrap: true,
                children: [
                  _sectionHeader(context, l10n(context).lbl_filterPerimeter),
                  _LocationSlider(initalFilterState.radius, (v) {
                    context.read<FeedFilterCubit>().updateRadius(v);
                  }),
                  _sectionHeader(context, l10n(context).lbl_filterPosts),
                  _FilterItem(
                      l10n(context).lbl_filterAll,
                      l10n(context).lbl_filterHidePast,
                      initalFilterState.hideCompleted,
                      (v) => context
                          .read<FeedFilterCubit>()
                          .updateHidecCompleted(v)),
                  const SizedBox(height: 12),
                  _FilterItem(
                      l10n(context).lbl_filterAll,
                      l10n(context).lbl_filterOnlyNearFuture,
                      initalFilterState.hideFarFuture,
                      (v) => context
                          .read<FeedFilterCubit>()
                          .updateHideFartFuture(v)),
                  //_filterItem("alle anzeigen", "alte verstecken")
                ],
              ),
            ]));
  }
}
