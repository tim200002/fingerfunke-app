import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/user/user.dart';
import '../../../utils/tools.dart';
import '../../../utils/util_widgets/clearance_appbar.dart';
import '../../error/exception_view.dart';
import '../../illustration_view/illustration_view.dart';
import 'cubit/mod_post_cubit.dart';
import 'widgets/mod_report_view.dart';

class ModPostReportPage extends StatelessWidget {
  const ModPostReportPage({Key? key}) : super(key: key);

  void _performAction(BuildContext context, bool accept) {
    showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            actionsPadding: const EdgeInsets.symmetric(horizontal: 7),
            title: Text(
                l10n(context).lbl_modManConfirm + '  ' + (accept ? "❌" : "✅")),
            content: Text(accept
                ? l10n(context).lbl_modManDelete
                : l10n(context).lbl_modManApprove),
            actions: [
              TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text(l10n(context).lbl_modManCancel)),
              ElevatedButton(
                  onPressed: () {
                    context.read<ModPostCubit>().closeReport(accept);
                    Navigator.of(context).pop();
                  },
                  child: Text(l10n(context).lbl_modManYes))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ModPostCubit>(
      create: (context) => ModPostCubit(),
      child: Scaffold(
          appBar: ClearanceAppBar.widget(context, UserClearance.moderation,
              title: l10n(context).lbl_modReportedPosts),
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: BlocBuilder<ModPostCubit, ModPostState>(
                builder: (context, state) => state.when(
                    loading: () => const Center(
                        child: CircularProgressIndicator.adaptive()),
                    error: ExceptionView.builder,
                    empty: () => IllustrationView.empty(
                        text: l10n(context).lbl_modNoReports),
                    neutral: (report, count) => Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: Text(
                                "$count " + l10n(context).lbl_modOpenReports,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Expanded(
                                child: Container(
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.surface,
                                borderRadius: BorderRadius.circular(10.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.15),
                                    spreadRadius: 0,
                                    blurRadius: 15,
                                    offset: const Offset(
                                        0, 4), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  Expanded(
                                    child: SingleChildScrollView(
                                        child: Padding(
                                            padding: const EdgeInsets.all(15),
                                            child:
                                                ModReportView(report: report))),
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: ElevatedButton(
                                            style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateColor
                                                        .resolveWith((states) =>
                                                            Colors.teal
                                                                .shade300)),
                                            onPressed: () =>
                                                _performAction(context, false),
                                            child: Text(
                                              l10n(context)
                                                  .lbl_modElementApprove,
                                              textAlign: TextAlign.center,
                                            )),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: ElevatedButton(
                                            style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateColor
                                                        .resolveWith((states) =>
                                                            Colors
                                                                .red.shade300)),
                                            onPressed: () =>
                                                _performAction(context, true),
                                            child: Text(
                                              l10n(context)
                                                  .lbl_modElementDelete,
                                              textAlign: TextAlign.center,
                                            )),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ))
                          ],
                        ))),
          )),
    );
  }
}
