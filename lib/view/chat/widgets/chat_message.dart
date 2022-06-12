import 'package:fingerfunke_app/cubits/app_cubit/app_cubit.dart';
import 'package:fingerfunke_app/cubits/authentication_cubit/authentication_cubit.dart';
import 'package:fingerfunke_app/models/message/message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatMessage extends StatelessWidget {
  final TextMessage message;
  ChatMessage(this.message, {Key? key}) : super(key: key);

  static const double _messagePadding = 8;
  static const _bubbleBorderRadius = Radius.circular(12);
  final _myMessageColor = Colors.green[300];
  final _othersMessageColor = Colors.grey[200];
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final bool amIAuthor =
        BlocProvider.of<AppCubit>(context).state.user.id == message.author.id;
    return Padding(
      padding: const EdgeInsets.all(_messagePadding),
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
                color: amIAuthor ? _myMessageColor : _othersMessageColor),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (!amIAuthor) ...[
                    Row(
                      children: [
                        Text(
                          message.author.name,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: _messagePadding,
                    )
                  ],
                  Text(message.text)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
