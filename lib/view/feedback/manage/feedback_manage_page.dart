import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../models/user/user.dart';
import '../../../utils/util_widgets/admin_appbar.dart';
import '../../error/exception_view.dart';
import 'cubit/feedback_manage_cubit.dart';

class FeedbackManagePage extends StatelessWidget {
  const FeedbackManagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FeedbackManageCubit>(
        create: (context) => FeedbackManageCubit(),
        child: Scaffold(
            appBar: AdminAppBar.widget(context, UserClearance.development,
                title: "Feedback",
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
                        neutral: (items, showClosed) => ListView.builder(
                            itemCount: items.length,
                            itemBuilder: (context, i) => Container(
                                  margin: const EdgeInsets.only(bottom: 10),
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
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
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(DateFormat("dd.MM.yyyy")
                                              .format(items[i].creationTime)),
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 5, horizontal: 7),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                color: items[i].state.color),
                                            child: Text(
                                              items[i].state.name,
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
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
                                )))))));
  }
}
