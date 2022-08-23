import 'dart:math' as math;

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import '../../../../cubits/location_cubit/location_cubit.dart';
import 'cubit/feed_filter_cubit.dart';

class HomeFilterView extends StatelessWidget {
  const HomeFilterView({Key? key}) : super(key: key);

  Widget _filterItem(
      String off, String on, bool value, Function(bool) onChanged) {
    double borderwidth = 1.5;
    return LayoutBuilder(
      builder: (context, constraints) => ToggleButtons(
        borderRadius: BorderRadius.circular(10),
        borderWidth: 1,
        borderColor: Colors.grey.shade100,
        selectedBorderColor: Colors.grey.shade100,
        constraints: BoxConstraints.expand(
            width: constraints.maxWidth / 2 - (borderwidth * 3) / 2,
            height: 70),
        children: [
          Text(off, textAlign: TextAlign.center),
          Text(on, textAlign: TextAlign.center),
          //Icon(FeatherIcons.thumbsUp),
          //Icon(FeatherIcons.meh),
        ],
        onPressed: (int index) => onChanged(index == 1),
        isSelected: [!value, value],
      ),
    );
  }

  Widget _locationSlider(BuildContext context, double value,
      {double max = 35, required Function(double) onChanged}) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(FeatherIcons.mapPin, size: 17),
                const SizedBox(width: 5),
                AutoSizeText(context.read<LocationCubit>().getAddress())
              ],
            ),
            const SizedBox(height: 10),
            Slider(
              value: math.max(5, math.min(max, value)),
              max: max,
              divisions: 6,
              min: 5,
              label: value < max ? "+ ${value.floor()} km" : "alle",
              onChanged: (v) => onChanged(v < max ? v : 1000),
            ),
          ],
        ));
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
    return Scaffold(
      appBar: AppBar(
        title: const Text("Filter bearbeiten"),
        leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(FeatherIcons.x)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: BlocBuilder<FeedFilterCubit, FeedFilterState>(
          builder: (context, filter) {
            return ListView(
              children: [
                _sectionHeader(context, "Umkreis"),
                _locationSlider(context, filter.distance,
                    onChanged: (v) => context
                        .read<FeedFilterCubit>()
                        .change(filter.copyWith(distance: v))),
                _sectionHeader(context, "Posts"),
                _filterItem(
                    "alle",
                    "vergangene\nausblenden",
                    filter.hideCompleted,
                    (v) => context
                        .read<FeedFilterCubit>()
                        .change(filter.copyWith(hideCompleted: v))),
                const SizedBox(height: 12),
                _filterItem(
                    "alle",
                    "nur demnächst stattindende",
                    filter.hideFarFuture,
                    (v) => context
                        .read<FeedFilterCubit>()
                        .change(filter.copyWith(hideFarFuture: v))),
                //_filterItem("alle anzeigen", "alte verstecken")
              ],
            );
          },
        ),
      ),
    );
  }
}
