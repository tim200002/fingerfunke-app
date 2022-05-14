import 'package:fingerfunke_app/utils/dev_tools.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import '../../../../cubits/authentication_cubit/authentication_cubit.dart';
import '../../../../models/message/message.dart';
import '../../../../routes.dart';
import '../../../../utils/tools.dart';
import '../../../chat/view/chat_page.dart';
import '../../../paginated_list/cubit/paginated_list_cubit.dart';
import '../../cubits/post_viewing_cubit/post_cubit.dart';

class PostActionButtons extends StatelessWidget {
  final bool editing;
  const PostActionButtons(this.editing, {Key? key}) : super(key: key);

  Widget _mainFAB(BuildContext context,
      {required String title,
      required IconData icon,
      bool isLoading = false,
      Function()? onTap}) {
    return ElevatedButton.icon(
        style: ButtonStyle(
            minimumSize: MaterialStateProperty.all(const Size(0, 55)),
            elevation: MaterialStateProperty.all(10),
            foregroundColor: MaterialStateProperty.all(
                Theme.of(context).colorScheme.onPrimary),
            backgroundColor: MaterialStateProperty.all(
                Theme.of(context).colorScheme.primary),
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
        onPressed: onTap);
  }

  Widget _editContent(BuildContext context) {
    return _mainFAB(context,
        title: "speichern",
        icon: FeatherIcons.send,
        onTap: () => DevTools.showToDoSnackbar(context,
            message: "Editor Cubit anbinden"));
  }

  Widget _viewContent(BuildContext context) {
    return BlocBuilder<PostCubit, PostState>(
        builder: (context, state) => state.when(
            loading: (_) => const CircularProgressIndicator.adaptive(),
            normal: (post, isJoining) {
              bool isParticipant = BlocProvider.of<AuthenticationCubit>(context)
                  .state
                  .maybeWhen(
                      signedIn: (currentUser) =>
                          post.isUserParticipant(currentUser),
                      orElse: () => false);
              bool isLoggedIn = BlocProvider.of<AuthenticationCubit>(context)
                  .state
                  .maybeWhen(signedIn: (_) => true, orElse: () => false);
              return Stack(
                children: <Widget>[
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: _mainFAB(context,
                          title: isParticipant ? "Ich bin dabei" : "Ich komme",
                          icon: isParticipant ? Icons.check : Icons.add,
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
    return editing ? _editContent(context) : _viewContent(context);
  }
}
