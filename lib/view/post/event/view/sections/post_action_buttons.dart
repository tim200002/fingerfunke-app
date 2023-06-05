import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../cubits/better_pagination/cubit/better_pagination_cubit.dart';
import '../../../../../cubits/firebase_authentication_cubit/firebase_authentication_cubit_cubit.dart';
import '../../../../../models/message/message.dart';
import '../../../../../models/user/user.dart';
import '../../../../../routes.dart';
import '../../../../../utils/tools.dart';
import '../../../../../utils/util_widgets/floating_modal.dart';
import '../../../../chat/view/chat_page.dart';
import '../../../../video_recorder/view/video_recorder_page.dart';
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

  Widget _addMediaButton(BuildContext outerContext, EventEditorCubit cubit) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: FloatingActionButton(
          backgroundColor: Theme.of(outerContext).colorScheme.onBackground,
          child: const Icon(Icons.add),
          onPressed: () {
            // open pop up with different sources
            showFloatingModalBottomSheet(
                context: outerContext,
                builder: (context) => Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                                                ListTile(
                          leading: const Icon(Icons.videocam),
                          title: Text(l10n(context).lbl_selectVideo),
                          onTap: () async {
                            Navigator.pop(context);
                            
                            // open video recorder page
                             File? video = await Navigator.push<File?>(context, VideoRecorderPage.route());
                            if (video != null) {
                              cubit.addMediaFromFile(video);
                            }
                          },
                        ),
                        ListTile(
                          leading: const Icon(Icons.photo_library),
                          title: Text(l10n(context).lbl_selectPhoto),
                          onTap: () async {
                            Navigator.pop(context);
                            XFile? result = await ImagePicker()
                                .pickImage(source: ImageSource.gallery);
                            if (result != null) {
                              File file = File(result.path);
                              cubit.addMediaFromFile(file);
                            }
                          },
                        ),
                        ListTile(
                          leading: const Icon(Icons.insert_drive_file_rounded),
                          title: Text(l10n(context).lbl_selectFile),
                          onTap: () async {
                            Navigator.pop(context);
                            FilePickerResult? result =
                                await FilePicker.platform.pickFiles(type: FileType.custom, allowedExtensions: ["pdf"]);
                            if (result != null) {
                              File file = File(result.files.single.path!);
                              cubit.addMediaFromFile(file);
                            }
                          },
                        ),
                      ],
                    ));
          }),
    );
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
          editing: (_, valid) =>
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Expanded(child: _addMediaButton(context, context.read<EventEditorCubit>())),
                _sendButton(context, false, valid: valid),
                Spacer()
              ]),
          submitting: () => _sendButton(context, true)),
    );
  }
}
