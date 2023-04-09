import 'package:get_it/get_it.dart';

import '../../../cubits/firebase_authentication_cubit/firebase_authentication_cubit_cubit.dart';
import '../../../models/message/message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../repositories/user_repository/user_repository.dart';
import '../../../utils/skeleton_view.dart';
import '../../../utils/type_aliases.dart';

class ChatMessage extends StatelessWidget {
  final TextMessage message;
  const ChatMessage(this.message, {Key? key}) : super(key: key);

  static const double _messageMargin = 7;
  static const double _messagePadding = 15;
  static const _bubbleBorderRadius = Radius.circular(17);

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
                /*border: amIAuthor
                    ? null
                    : Border.all(
                        color: Theme.of(context)
                            .colorScheme
                            .primary
                            .withOpacity(0.7),
                        width: 2),*/
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
    );
  }
}

class _AuthorName extends StatefulWidget {
  final GetIt _getIt = GetIt.I;
  final FirestoreId _userId;
  late final UserRepository _userRepository;

  _AuthorName(this._userId, {Key? key}) : super(key: key) {
    _userRepository = _getIt<UserRepository>();
  }

  @override
  State<_AuthorName> createState() => __AuthorNameState();
}

class __AuthorNameState extends State<_AuthorName> {
  String? name;

  @override
  void initState() {
    widget._userRepository.getUser(widget._userId).then((value) {
      if (mounted) {
        setState(() => name = value.name);
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
