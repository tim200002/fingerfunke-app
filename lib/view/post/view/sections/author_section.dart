import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/post_viewer_cubit/post_cubit.dart';

class AuthorSection extends StatelessWidget {
  final bool editing;
  const AuthorSection(this.editing, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return editing
        ? Container()
        : BlocBuilder<PostCubit, PostState>(
            builder: (context, state) => state.when(
                loading: (_) => const CircularProgressIndicator.adaptive(),
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
