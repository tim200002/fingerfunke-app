import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:intl/intl.dart';

import '../../../../common_widgets/helper_widgets.dart';
import '../../../../common_widgets/user/author_info.dart';
import '../../../../models/user/user.dart';
import '../../../../models/user_feedback.dart';
import '../../../../repositories/user_feedback_repository/user_feedback_repository.impl.dart';
import '../../../../utils/util_cubits/stream/stream_subscribe_cubit.dart';
import '../../../../utils/util_widgets/clearance_appbar.dart';
import '../../../error/exception_view.dart';

class FeedbackManageItemPage extends StatelessWidget {
  final String feedbackId;
  const FeedbackManageItemPage({Key? key, required this.feedbackId})
      : super(key: key);

  Widget _metaInfoItem(final String name,
      {final String? text, final Widget? child}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(flex: 1, child: Text("$name:")),
          Expanded(
              flex: 2,
              child: text != null
                  ? Text(
                      text,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    )
                  : child ?? const Text("??"))
        ],
      ),
    );
  }

  Widget _stateButton(UserFeedback r) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(7),
      child: Container(
        color: r.state.color,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<UserFeedbackState>(
            dropdownColor: Colors.grey.shade800,
            focusColor: Colors.white,
            value: r.state,
            //elevation: 5,
            icon: const Icon(
              FeatherIcons.arrowDown,
              color: Colors.white,
            ),
            isExpanded: true,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
            items: UserFeedbackState.values
                .map<DropdownMenuItem<UserFeedbackState>>(
                    (value) => DropdownMenuItem<UserFeedbackState>(
                          value: value,
                          child: Text(
                            value.name,
                          ),
                        ))
                .toList(),
            onChanged: (value) {
              if (value != null) {
                UserFeedbackRepositoryImpl().updateReportState(r.id, value);
              }
            },
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ClearanceAppBar.widget(context, UserClearance.development,
            title: "Feedback"),
        body: Padding(
            padding: const EdgeInsets.all(20),
            child: StreamSubscribeCubit.asWidget<UserFeedback>(
                dataStream:
                    UserFeedbackRepositoryImpl().observeReport(id: feedbackId),
                builder: (context, state) => state.when(
                    loading: () => const Center(
                        child: CircularProgressIndicator.adaptive()),
                    error: ExceptionView.builder,
                    neutral: (report) => ListView(
                          children: [
                            Text(
                              report.title,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 23),
                            ),
                            HelperWidgets.materialHero(
                                tag: "fb_$feedbackId",
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 20),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(14),
                                      color: Colors.grey.shade100),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      _metaInfoItem("Datum",
                                          text: DateFormat("dd.MM.yyyy")
                                              .format(report.creationTime)),
                                      _metaInfoItem("App Version",
                                          text: report.appVersion),
                                      _metaInfoItem("Kategorien",
                                          text: report.categories.fold(
                                              "", (p, e) => "$p#${e.label} ")),
                                      _metaInfoItem("Autor",
                                          child: AuthorInfo(report.author)),
                                      const SizedBox(height: 20),
                                      _stateButton(report)
                                    ],
                                  ),
                                )),
                            const SizedBox(height: 10),
                            Text(report.description)
                          ],
                        )))));
  }
}
