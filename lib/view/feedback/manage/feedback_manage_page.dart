import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../common_widgets/helper_widgets.dart';
import '../../../models/user/user.dart';
import '../../../utils/tools.dart';
import '../../../utils/util_widgets/clearance_appbar.dart';
import '../../error/exception_view.dart';
import '../../illustration_view/illustration_view.dart';
import 'cubit/feedback_manage_cubit.dart';
import 'mamage_item/feedback_manage_item_page.dart';

class FeedbackManagePage extends StatelessWidget {
  const FeedbackManagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FeedbackManageCubit>(
        create: (context) => FeedbackManageCubit(),
        child: Scaffold(
            appBar: ClearanceAppBar.widget(context, UserClearance.development,
                title: l10n(context).lbl_devFeedbackManTitle,
                actions: [
                  BlocBuilder<FeedbackManageCubit, FeedbackManageState>(
                      builder: (context, state) => state.maybeWhen(
                          neutral: (_, onlyOpen) => IconButton(
                              onPressed: () => context
                                  .read<FeedbackManageCubit>()
                                  .toggleOnlyOpen(),
                              icon: Icon(onlyOpen
                                  ? Icons.visibility_off
                                  : Icons.visibility)),
                          orElse: () => Container()))
                ]),
            body: Padding(
                padding: const EdgeInsets.all(20),
                child: BlocBuilder<FeedbackManageCubit, FeedbackManageState>(
                    builder: (context, state) => state.when(
                        loading: () => const Center(
                            child: CircularProgressIndicator.adaptive()),
                        error: ExceptionView.builder,
                        neutral: (items, onlyOpen) => items.isEmpty
                            ? IllustrationView.empty(
                                text: onlyOpen
                                    ? l10n(context)
                                        .lbl_devFeedbackNoOpenFeedback
                                    : l10n(context).lbl_devFeedbackNoFeedback)
                            : ListView.builder(
                                itemCount: items.length,
                                itemBuilder: (context, i) => InkWell(
                                    onTap: () => Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                FeedbackManageItemPage(
                                                    feedbackId: items[i].id))),
                                    child: HelperWidgets.materialHero(
                                      tag: "fb_${items[i].id}",
                                      child: Container(
                                        margin:
                                            const EdgeInsets.only(bottom: 10),
                                        padding: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Colors.grey.shade200),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(DateFormat("dd.MM.yyyy")
                                                    .format(
                                                        items[i].creationTime)),
                                                Container(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      vertical: 5,
                                                      horizontal: 7),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      color:
                                                          items[i].state.color),
                                                  child: Text(
                                                    items[i].state.name,
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.white),
                                                  ),
                                                )
                                              ],
                                            ),
                                            const SizedBox(height: 7),
                                            Text(
                                              items[i].title,
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18),
                                            )
                                          ],
                                        ),
                                      ),
                                    ))))))));
  }
}
