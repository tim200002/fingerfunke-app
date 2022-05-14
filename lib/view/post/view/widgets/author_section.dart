import 'package:fingerfunke_app/models/user/user.dart';
import 'package:fingerfunke_app/utils/dev_tools.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../utils/util_widgets/loading_page.dart';
import '../../cubit/post_cubit.dart';

class AuthorSection extends StatelessWidget {
  final bool editing;
  const AuthorSection(this.editing, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return editing
        ? DevTools.placeholder("authorSection")
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
