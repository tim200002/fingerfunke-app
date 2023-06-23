import 'package:get_it/get_it.dart';

import '../../../models/report.dart';
import '../../../models/user/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_settings_ui/flutter_settings_ui.dart';

import '../../../repositories/message_repository.dart/message_repository.dart';
import '../../../repositories/post_repository/post_repository.dart';
import '../../../utils/tools.dart';
import '../../../utils/util_widgets/clearance_appbar.dart';
import '../views/mod_message_view.dart';
import '../views/mod_report_view.dart';
import 'moderation_feed_page.dart';

class ModerationPage extends StatelessWidget {
  final PostRepository _postRepository = GetIt.I<PostRepository>();
  final MessageRepository _messageRepository = GetIt.I<MessageRepository>();
  ModerationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ClearanceAppBar.widget(context, UserClearance.moderation,
          title: l10n(context).lbl_modOverview),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          shrinkWrap: true,
          children: [
            SettingsTile(
              title: l10n(context).lbl_modReportedPosts,
              subtitle: l10n(context).lbl_modReportedPostsDesc,
              trailing: const Icon(Icons.arrow_forward_ios),
              onPressed: (_) => Navigator.of(context).push(ModFeedPage.route(
                  reportType: ReportType.post,
                  ReportView: (report) => ModPostReportView(report: report),
                  onReportAccepted: (report) => _postRepository.moderatePost(
                      report.objectReference,
                      shouldBeDeleted: true))),
            ),
            SettingsTile(
              title: "gemeldete Nachrichten",
              subtitle: "gemeldtete Nachrichten",
              trailing: const Icon(Icons.arrow_forward_ios),
              onPressed: (_) => Navigator.of(context).push(ModFeedPage.route(
                  reportType: ReportType.message,
                  ReportView: (report) => ModMessageReportView(report: report),
                  onReportAccepted: (report) =>
                      _messageRepository.moderateMessage(
                          fullPath: report.objectReferenceFullPath,
                          shouldBeDeleted: true))),
            )
          ],
        ),
      ),
    );
  }
}
