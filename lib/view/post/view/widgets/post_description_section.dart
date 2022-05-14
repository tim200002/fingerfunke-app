import 'package:fingerfunke_app/models/post/post.dart';
import 'package:fingerfunke_app/utils/dev_tools.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/post_cubit.dart';

class PostDescriptionSection extends StatelessWidget {
  final bool editing;
  const PostDescriptionSection(this.editing, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return editing
        ? DevTools.placeholder("description")
        : BlocBuilder<PostCubit, PostState>(
            builder: (context, state) => state.when(
                loading: (_) => const CircularProgressIndicator.adaptive(),
                normal: (post, isJoining) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Text(
                        post.description,
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                    )));
  }
}
