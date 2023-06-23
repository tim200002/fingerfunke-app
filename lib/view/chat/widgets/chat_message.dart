import 'package:get_it/get_it.dart';

import '../../../cubits/firebase_authentication_cubit/firebase_authentication_cubit_cubit.dart';
import '../../../models/message/message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../repositories/user_repository/user_repository.dart';
import '../../../utils/skeleton_view.dart';
import '../../../utils/tools.dart';
import '../../../utils/type_aliases.dart';
import '../../../utils/util_widgets/floating_modal.dart';
import '../../report_send/message_report_send_page.dart';

const double _messageMargin = 7;
const double _messagePadding = 15;
const _bubbleBorderRadius = Radius.circular(17);

class ChatMessage extends StatelessWidget {
  final TextMessage message;
  final FirestoreId postId;
  const ChatMessage({required this.message, required this.postId, super.key});

  @override
  Widget build(BuildContext context) {
    switch (message.visibility) {
      case MessageVisibility.visible:
        {
          return _ChatMessageNormal(message: message, postId: postId);
        }
      case MessageVisibility.deleted:
        {
          return _ChatMessageDeleted(message: message, postId: postId);
        }
      default:
        {
          throw Exception('Invalid message visibility');
        }
    }
  }
}

class _ChatMessageNormal extends StatelessWidget {
  final TextMessage message;
  final FirestoreId postId;
  const _ChatMessageNormal(
      {required this.message, required this.postId, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final bool amIAuthor =
        BlocProvider.of<FirebaseAuthenticationCubitCubit>(context)
                .getUser()
                .id ==
            message.authorId;
    return Padding(
      padding: const EdgeInsets.all(_messageMargin),
      child: InkWell(
        onLongPress: () {
          // show bottom sheet with possibility to report
          showFloatingModalBottomSheet(
            context: context,
            builder: (context) => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  leading: const Icon(Icons.report),
                  title: Text(l10n(context).lbl_report),
                  onTap: () {
                    Navigator.of(context).pop();

                    MessageReportSendPopup.openAsModalBottomSheet(
                        context, message, postId);
                  },
                )
              ],
            ),
          );
        },
        child: Row(
          mainAxisAlignment:
              amIAuthor ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            Container(
              constraints: BoxConstraints(
                  minWidth: size.width * 0.3, maxWidth: size.width * 0.7),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: _bubbleBorderRadius,
                      topRight: _bubbleBorderRadius,
                      bottomLeft: amIAuthor ? _bubbleBorderRadius : Radius.zero,
                      bottomRight:
                          !amIAuthor ? _bubbleBorderRadius : Radius.zero),
                  color: amIAuthor
                      ? Theme.of(context).colorScheme.primary
                      : const Color(0xFFe9e9e9)),
              child: Padding(
                padding: const EdgeInsets.all(_messagePadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (!amIAuthor) ...[
                      _AuthorName(message.authorId),
                      const SizedBox(height: 10)
                    ],
                    Text(message.text,
                        style: amIAuthor
                            ? Theme.of(context).primaryTextTheme.bodyMedium
                            : Theme.of(context).textTheme.bodyMedium)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _AuthorName extends StatefulWidget {
  final FirestoreId _userId;
  final UserRepository _userRepository = GetIt.I<UserRepository>();

  _AuthorName(this._userId, {Key? key}) : super(key: key);

  @override
  State<_AuthorName> createState() => __AuthorNameState();
}

class __AuthorNameState extends State<_AuthorName> {
  String? name;

  @override
  void initState() {
    widget._userRepository.getUser(widget._userId).then((value) {
      if (mounted) {
        setState(() => name = value?.name ?? l10n(context).lbl_deleted_user);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return name != null
        ? Text(name!, style: Theme.of(context).textTheme.labelMedium)
        : SkeletonView.shimmer(const SkeletonView.text());
  }
}

class _ChatMessageDeleted extends StatelessWidget {
  final TextMessage message;
  final FirestoreId postId;
  const _ChatMessageDeleted(
      {required this.message, required this.postId, super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(_messageMargin),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            constraints: BoxConstraints(
                minWidth: size.width * 0.3, maxWidth: size.width * 0.7),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: _bubbleBorderRadius,
                    topRight: _bubbleBorderRadius,
                    bottomLeft: Radius.zero,
                    bottomRight: _bubbleBorderRadius),
                color: Color(0xFFe9e9e9)),
            child: Padding(
              padding: const EdgeInsets.all(_messagePadding),
              child: Text("Deleted Message",
                  style: Theme.of(context).textTheme.bodyMedium),
            ),
          )
        ],
      ),
    );
  }
}
