import 'package:fingerfunke_app/models/post/post.dart';
import 'package:fingerfunke_app/utils/extensions/date_time.dart';
import 'package:fingerfunke_app/view/maps/view/maps_place_picker_page.dart';
import 'package:fingerfunke_app/view/maps/view/static_maps_provider.dart';
import 'package:fingerfunke_app/view/post/view/widgets/icon_text_item.dart';
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

  @override
  Widget build(BuildContext context) {
    return editing
        ? const _Edit()
        : BlocBuilder<PostCubit, PostState>(
        builder: (context, state) => state.when(
            loading: (_) => Container(),
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
          editEvent: (eventEditorFields, _) => StaticMapsProvider(address: eventEditorFields.location),
          orElse: () => throw InvalidStateException()),
    );
  }
}
