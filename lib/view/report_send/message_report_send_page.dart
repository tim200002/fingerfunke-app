import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:path/path.dart' as p;

import 'widgets/chip_chooser.dart';
import '../../cubits/firebase_authentication_cubit/firebase_authentication_cubit_cubit.dart';
import '../../models/message/message.dart';
import '../../models/report.dart';
import '../../utils/tools.dart';
import '../../utils/type_aliases.dart';
import '../error/exception_view.dart';
import 'cubit/report_send_cubit.dart';


class MessageReportSendPopup extends StatelessWidget {
  final Message message;
  final FirestoreId postId;
  const MessageReportSendPopup({required this.message, required this.postId, super.key});

  static Future<void> openAsModalBottomSheet(
      BuildContext context, Message message, FirestoreId postId) {
    return showModalBottomSheet(
        context: context,
        builder: (_) => SafeArea(child: MessageReportSendPopup(message: message, postId: postId)));
  }

  Widget _messageCard(BuildContext context) {
    Widget getInternalWidget(Message message) {
      switch (message.type) {
        case MessageType.text:
          {
            return Text((message as TextMessage).text);
          }
        case MessageType.video:
          {
            throw UnimplementedError();
          }
        default:
          {
            throw InvalidMessageTypeException();
          }
      }
    }

    return Container(
        margin: const EdgeInsets.symmetric(vertical: 30),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              spreadRadius: 0,
              blurRadius: 15,
              offset: const Offset(0, 4), // changes position of shadow
            ),
          ],
        ),
        padding: const EdgeInsets.all(15),
        child: getInternalWidget(message));
  }

  Widget _successView(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(
          FeatherIcons.check,
          color: Colors.green,
          size: 35,
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          l10n(context).msg_reportSuccess,
          textAlign: TextAlign.center,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return FirebaseAuthenticationCubitCubit.userBuilder(
      (user) {
        return BlocProvider<ReportSendCubit>(
          create: (context) => ReportSendCubit(
              doc: message, type: ReportType.message, author: user.toInfo()),
          child: BlocBuilder<ReportSendCubit, ReportSendState>(
            builder: (context, state) => state.when(
              sending: () => const Center(
                child: CircularProgressIndicator.adaptive(),
              ),
              sent: () => _successView(context),
              error: ExceptionView.fromError,
              editing: (doc, type, reasons) => Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          _messageCard(context),
                          Text(l10n(context).lbl_reportReasonsMessage),
                          ChipChooser<ReportReason>(
                              selected: reasons,
                              onChanged: (r) =>
                                  context.read<ReportSendCubit>().setReasons(r),
                              chips: ReportReason.values
                                  .map((e) => ChipData(e.name.toString(), e))
                                  .toList()),
                        ],
                      ),
                    ),
                    ElevatedButton.icon(
                        onPressed: reasons.isEmpty
                            ? null
                            : () => context.read<ReportSendCubit>().send(p.join("posts", postId, "posts_messages")),
                        icon: const Icon(FeatherIcons.send),
                        label: Text(l10n(context).lbl_report)),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
