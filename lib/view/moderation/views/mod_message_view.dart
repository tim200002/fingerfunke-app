import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';

import '../../../models/message/message.dart';
import '../../../models/report.dart';
import 'package:flutter/material.dart';

import '../../../models/user/user.dart';
import '../../../repositories/user_repository/user_repository.dart';
import '../../../utils/tools.dart';
import '../../../utils/util_widgets/future_text.dart';
import '../../error/exception_view.dart';
import '../../report_send/widgets/chip_chooser.dart';

class ModMessageReportView extends StatelessWidget {
  final Report report;
  final UserRepository _userRepository = GetIt.instance<UserRepository>();
  ModMessageReportView({Key? key, required this.report}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<User?> authorFuture = _userRepository.getUser(report.authorId);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(report.type.name, style: Theme.of(context).textTheme.labelLarge),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: // Container with rounded corners
              Container(
            decoration: BoxDecoration(
                color: Colors.grey.shade500,
                borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ChatExtract(
                  chatMessageReference: report.objectReferenceFullPath),
            ),
          ),
        ),
        FutureText(authorFuture.then((value) =>
            l10n(context).lbl_modReportedBy +
            (value?.name ?? l10n(context).lbl_deleted_user))),
        const SizedBox(
          height: 10,
        ),
        Text(l10n(context).lbl_modReportedBecause),
        const SizedBox(
          height: 5,
        ),
        ChipChooser<ReportReason>(
            selected: report.reasons,
            chips: ReportReason.values
                .map((e) => ChipData(e.name.toString(), e))
                .toList())
      ],
    );
  }
}

class ChatExtract extends StatelessWidget {
  final String chatMessageReference;
  final FirebaseFirestore _firestore = GetIt.I.get<FirebaseFirestore>();
  ChatExtract({required this.chatMessageReference, super.key});

  Future<TextMessage> getMessage() {
    return _firestore
        .doc(chatMessageReference)
        .get()
        .then((value) => 
        Message.fromDoc(value) as TextMessage
        );
  }

  @override
  Widget build(BuildContext context) {
    var messageFuture = getMessage();
    return FutureBuilder(
        future: messageFuture,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Text(snapshot.data!.text);
          }
          // if (snapshot.hasError) {
          //   return ExceptionView(
          //     exception: snapshot.error,
          //   );
          // }
          return const CircularProgressIndicator.adaptive();
        });
  }
}
