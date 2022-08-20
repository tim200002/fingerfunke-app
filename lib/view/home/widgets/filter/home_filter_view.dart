import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import '../../../../utils/dev_tools.dart';
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

  Widget _locationSlider(double value,
      {double max = 30, required Function(double) onChanged}) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(FeatherIcons.mapPin, size: 17),
                SizedBox(width: 5),
                Text("dein Standort")
              ],
            ),
            const SizedBox(height: 10),
            Slider(
              value: value,
              max: max,
              divisions: 6,
              min: 1,
              label: "+ ${value.floor()} km",
              onChanged: onChanged,
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
                _locationSlider(filter.distance,
                    onChanged: (v) => context
                        .read<FeedFilterCubit>()
                        .change(filter.copyWith(distance: v))),
                _sectionHeader(context, "Posts"),
                _filterItem(
                    "alle anzeigen",
                    "alte verstecken",
                    filter.hideCompleted,
                    (v) => context
                        .read<FeedFilterCubit>()
                        .change(filter.copyWith(hideCompleted: v))),
                const SizedBox(height: 12),
                //_filterItem("alle anzeigen", "alte verstecken")
              ],
            );
          },
        ),
      ),
    );
  }
}
