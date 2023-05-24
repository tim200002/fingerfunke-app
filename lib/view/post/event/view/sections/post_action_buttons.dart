import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import '../../../../../cubits/better_pagination/cubit/better_pagination_cubit.dart';
import '../../../../../cubits/firebase_authentication_cubit/firebase_authentication_cubit_cubit.dart';
import '../../../../../models/message/message.dart';
import '../../../../../models/user/user.dart';
import '../../../../../routes.dart';
import '../../../../../utils/tools.dart';
import '../../../../chat/view/chat_page.dart';
import '../../../cubits/abstract_post_editor_cubit/abstract_post_editor_cubit.dart';
import '../../../cubits/post_viewer_cubit/post_cubit.dart';
import '../../cubit/event_editor_cubit.dart';

/// Buttons on the post page. In viewing mode, these are used to allow the user
/// to join posts and access the chat. In [editing] mode the button is used to
/// submit the post
class PostActionButtons extends StatelessWidget {
  final bool editing;
  const PostActionButtons(this.editing, {Key? key}) : super(key: key);

  static Widget _mainFAB(BuildContext context,
      {required String title,
      required IconData icon,
      required Color color,
      bool isLoading = false,
      Function()? onTap}) {
    return ElevatedButton.icon(
        style: ButtonStyle(
            minimumSize: MaterialStateProperty.all(const Size(0, 55)),
            elevation: MaterialStateProperty.all(10),
            foregroundColor: MaterialStateProperty.all(
                Theme.of(context).colorScheme.onPrimary),
            backgroundColor: MaterialStateProperty.all(color),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100)))),
        label: Padding(
          padding: const EdgeInsets.only(right: 5),
          child: Text(title),
        ),
        icon: Padding(
          padding: const EdgeInsets.only(right: 6),
          child: !isLoading
              ? Icon(icon)
              : const SizedBox.square(
                  dimension: 24,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  )),
        ),
        onPressed: isLoading ? null : onTap);
  }

  Widget _viewContent(BuildContext context) {
    return BlocBuilder<PostCubit, PostState>(
        builder: (context, state) => state.when(
            loading: (_) => Container(),
            normal: (post, isMember) {
              final UserInfo loggedInUser = context
                  .read<FirebaseAuthenticationCubitCubit>()
                  .getUser()
                  .toInfo();
              return Stack(
                children: <Widget>[
                  if (!post.isUserAuthor(loggedInUser) &&
                      (isMember || !(post.asEvent?.isCompleted ?? false)))
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: _mainFAB(
                        context,
                        title: isMember
                            ? l10n(context).lbl_joinedPost
                            : l10n(context).lbl_joinPost,
                        icon: isMember ? Icons.check : Icons.add,
                        isLoading: false,
                        color: isMember
                            ? Theme.of(context).colorScheme.secondary
                            : Theme.of(context).colorScheme.primary,
                        onTap: () => (isMember
                                ? context.read<PostCubit>().leavePost
                                : context.read<PostCubit>().joinPost)
                            .call()
                            ?.catchError(
                              (_) => Tools.showSnackbar(
                                  l10n(context).msg_errorUndefined),
                            ),
                      ),
                    ),
                  if (post.isUserMember(loggedInUser))
                    Align(
                      alignment: Alignment.bottomRight,
                      child: FloatingActionButton(
                          heroTag: "post_chat",
                          backgroundColor:
                              Theme.of(context).colorScheme.onBackground,
                          child: const Icon(Icons.chat_bubble_outline_rounded),
                          onPressed: () => Navigator.of(context).pushNamed(
                                Routes.chat,
                                arguments: ChatArguments(
                                  chatName: post.title,
                                  postId: post.id,
                                  chatMessagePaginationCubit: context
                                      .read<BetterPaginationCubit<Message>>(),
                                ),
                              )),
                    ),
                ],
              );
            }));
  }

  @override
  Widget build(BuildContext context) {
    return editing ? const _Edit() : _viewContent(context);
  }
}

class _Edit extends StatelessWidget {
  const _Edit({Key? key}) : super(key: key);

  Color _lightenColor(Color color, double amount) {
    final hsl = HSLColor.fromColor(color);
    return hsl
        .withLightness((hsl.lightness + amount).clamp(0.0, 1.0))
        .toColor();
  }

  Widget _sendButton(BuildContext context, bool processing,
      {bool valid = true}) {
    return Stack(children: <Widget>[
      Align(
          alignment: Alignment.bottomCenter,
          child: PostActionButtons._mainFAB(
            context,
            title: l10n(context).lbl_submitPost,
            icon: FeatherIcons.send,
            isLoading: processing,
            color: valid
                ? Theme.of(context).colorScheme.primary
                : _lightenColor(
                    Theme.of(context).colorScheme.onBackground, 0.4),
            onTap: valid
                ? () => context.read<EventEditorCubit>().submit()
                : () => Tools.showSnackbar(l10n(context).msg_editFieldsMissing),
          ))
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EventEditorCubit, PostEditorState>(
      builder: (context, state) => state.maybeWhen(
          orElse: () => Container(),
          editing: (_, valid) => _sendButton(context, false, valid: valid),
          submitting: () => _sendButton(context, true)),
    );
  }
}
