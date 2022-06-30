import 'package:fingerfunke_app/view/error/exception_view.dart';
import 'package:fingerfunke_app/view/moderation/mod_post_report/cubit/mod_post_cubit.dart';
import 'package:fingerfunke_app/view/moderation/mod_post_report/widgets/mod_report_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/illustration.dart';
import '../../../utils/util_widgets/admin_appbar.dart';

class ModPostReportPage extends StatelessWidget {
  const ModPostReportPage({Key? key}) : super(key: key);

  Widget _emptyIndicator() {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 300),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Illustration(
              Illustrations.empty,
              height: null,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "keine offenen Meldungen",
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }

  void _performAction(BuildContext context, bool accept) {
    showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            actionsPadding: const EdgeInsets.symmetric(horizontal: 7),
            title: Text('Bestätigen:  ' + (accept ? "❌" : "✅")),
            content: Text(accept
                ? "Der Beitrag verstößt gegen unsere Richtlinen. \nDen Beitrag unwiderruflich löschen."
                : 'Den Beitrag als "in Ordnung" markieren'),
            actions: [
              TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('abbrechen')),
              ElevatedButton(
                  onPressed: () {
                    context.read<ModPostCubit>().closeReport(accept);
                    Navigator.of(context).pop();
                  },
                  child: const Text('Ja'))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ModPostCubit>(
      create: (context) => ModPostCubit(),
      child: Scaffold(
          appBar: AdminAppBar.widget(context, AdminFunction.moderation,
              title: "gemeldete Posts"),
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: BlocBuilder<ModPostCubit, ModPostState>(
                builder: (context, state) => state.when(
                    loading: () => const Center(
                        child: CircularProgressIndicator.adaptive()),
                    error: ExceptionView.builder,
                    empty: () => _emptyIndicator(),
                    neutral: (report, count) => Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: Text(
                                "$count offene Meldungen",
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
                                            child: const Text(
                                              "Beitrag\nist okay",
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
                                            child: const Text(
                                              "Beitrag\nlöschen",
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
