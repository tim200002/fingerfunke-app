import 'package:fingerfunke_app/cubits/app_cubit/app_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import '../../../../models/message/message.dart';
import '../../../../routes.dart';
import '../../../../utils/tools.dart';
import '../../../chat/view/chat_page.dart';
import '../../../paginated_list/cubit/paginated_list_cubit.dart';
import '../../cubits/post_editor_cubit/post_editor_cubit.dart';
import '../../cubits/post_viewer_cubit/post_cubit.dart';

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
            loading: (_) =>
                const Center(child: CircularProgressIndicator.adaptive()),
            normal: (post, isJoining) {
              bool isParticipant = post.isUserParticipant(
                  BlocProvider.of<AppCubit>(context).state.user);
              // ToDo remove
              bool isLoggedIn = true;
              return Stack(
                children: <Widget>[
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: _mainFAB(context,
                          title: isParticipant ? "Ich bin dabei" : "Mach mit",
                          icon: isParticipant ? Icons.check : Icons.add,
                          color: isParticipant
                              ? Theme.of(context).colorScheme.secondary
                              : Theme.of(context).colorScheme.primary,
                          onTap: !isLoggedIn || isParticipant
                              ? null
                              : () => BlocProvider.of<PostCubit>(context)
                                  .joinPost()
                                  .catchError(
                                    (_) => Tools.showSnackbar(
                                        context, "Oops something went wrong"),
                                  ))),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: FloatingActionButton(
                        backgroundColor:
                            Theme.of(context).colorScheme.onBackground,
                        child: const Icon(Icons.chat_bubble_outline_rounded),
                        onPressed: () => Navigator.of(context).pushNamed(
                              Routes.chat,
                              arguments: ChatArguments(
                                chatName: post.title,
                                postId: post.id,
                                paginatedListCubit: BlocProvider.of<
                                    PaginatedListCubit<Message>>(context),
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
            title: "Posten",
            icon: FeatherIcons.send,
            isLoading: processing,
            color: valid
                ? Theme.of(context).colorScheme.primary
                : _lightenColor(Theme.of(context).colorScheme.onBackground, 0.4),
            onTap: valid
                ? () => context.read<PostEditorCubit>().submit()
                : () => Tools.showSnackbar(context, "Bitte alles ausfüllen"),
          ))
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostEditorCubit, PostEditorState>(
        builder: (context, state) => state.maybeWhen(
            orElse: () => Container(),
            editEvent: (_, valid) => _sendButton(context, false, valid: valid),
            submitting: () => _sendButton(context, true)));
  }
}
