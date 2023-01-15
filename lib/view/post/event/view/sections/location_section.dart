import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../models/post/post.dart';
import '../../../../../utils/exceptions.dart';
import '../../../../../utils/skeleton_view.dart';
import '../../../../../utils/tools.dart';
import '../../../../maps/view/static_maps_provider.dart';
import '../../../cubits/abstract_post_editor_cubit/abstract_post_editor_cubit.dart';
import '../../../cubits/post_viewer_cubit/post_cubit.dart';
import '../../cubit/event_editor_cubit.dart';

/// Shows structured information about the event
/// In [editing] mode, the values of these fields can be changed
class LocationSection extends StatelessWidget {
  final bool editing;

  const LocationSection(this.editing, {Key? key}) : super(key: key);

  Widget _loading() {
    return const SkeletonView(height: 140);
  }

  @override
  Widget build(BuildContext context) {
    return editing
        ? const _Edit()
        : BlocBuilder<PostCubit, PostState>(
            builder: (context, state) => state.when(
                loading: (_) => SkeletonView.shimmer(_loading()),
                normal: (post, _) => post is! Event
                    ? Text(l10n(context).msg_postOnlyEventsSupported)
                    : StaticMapsProvider(address: post.place.address)));
  }
}

class _Edit extends StatelessWidget {
  const _Edit({super.key});

  @override
  Widget build(BuildContext context) {
    EventEditorCubit eventEditorCubit = context.read<EventEditorCubit>();
    return BlocBuilder<EventEditorCubit, PostEditorState>(
        // ToDo Build when to only update after change to the map
        builder: (context, state) {
      print("rebuild");
      return state.maybeWhen(
          editing: (_, __) => StaticMapsProvider(
              address: eventEditorCubit.place?.address ?? ""),
          orElse: () => throw InvalidStateException());
    });
  }
}
