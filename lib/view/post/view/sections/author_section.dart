import 'package:fingerfunke_app/utils/placeholder_box.dart';
import 'package:fingerfunke_app/utils/tools.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/post_viewer_cubit/post_cubit.dart';

/// shows information about the author of the post.
/// In [editing] mode, nothing is shown
class AuthorSection extends StatelessWidget {
  final bool editing;
  const AuthorSection(this.editing, {Key? key}) : super(key: key);

  Widget _loading() {
    return const PlaceholderBox.headline(
      alignment: Alignment.center,
      margin: EdgeInsets.all(12),
      width: 120,
    );
  }

  @override
  Widget build(BuildContext context) {
    return editing
        ? Container() // show nothing on editing
        : BlocBuilder<PostCubit, PostState>(
            builder: (context, state) => state.when(
                loading: (_) => PlaceholderBox.shimmer(_loading()),
                normal: (post, isJoining) => Center(
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Text(
                          "Erstellt von ${post.author.name}",
                          style: Theme.of(context).textTheme.caption,
                        ),
                      ),
                    )));
  }
}
