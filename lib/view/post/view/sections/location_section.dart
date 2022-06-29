import 'package:fingerfunke_app/models/post/post.dart';
import 'package:fingerfunke_app/utils/placeholder_box.dart';
import 'package:fingerfunke_app/view/maps/view/static_maps_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../utils/exceptions.dart';
import '../../cubits/post_editor_cubit/post_editor_cubit.dart';
import '../../cubits/post_viewer_cubit/post_cubit.dart';

/// Shows structured information about the event
/// In [editing] mode, the values of these fields can be changed
class LocationSection extends StatelessWidget {
  final bool editing;

  const LocationSection(this.editing, {Key? key}) : super(key: key);

  Widget _loading() {
    return const PlaceholderBox(height: 140);
  }

  @override
  Widget build(BuildContext context) {
    return editing
        ? const _Edit()
        : BlocBuilder<PostCubit, PostState>(
            builder: (context, state) => state.when(
                loading: (_) => PlaceholderBox.shimmer(_loading()),
                normal: (post, isJoining) => post is! Event
                    ? const Text("Die App unterstützt zur Zeit nur Events!")
                    : StaticMapsProvider(address: post.location)));
  }
}

class _Edit extends StatelessWidget {
  const _Edit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostEditorCubit, PostEditorState>(
      builder: (context, state) => state.maybeWhen(
          editEvent: (eventEditorFields, _) =>
              StaticMapsProvider(address: eventEditorFields.location),
          orElse: () => throw InvalidStateException()),
    );
  }
}
