import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import '../../../cubits/firebase_authentication_cubit/firebase_authentication_cubit_cubit.dart';
import '../../../utils/tools.dart';
import '../../error/exception_view.dart';
import '../../report_send/widgets/chip_chooser.dart';
import '../../../models/user_feedback.dart';
import 'cubit/feedback_send_cubit.dart';

class FeedbackSendPage extends StatelessWidget {
  const FeedbackSendPage({Key? key}) : super(key: key);

  /*Widget _feedbackType() {
    double borderwidth = 1.5;
    return LayoutBuilder(
      builder: (context, constraints) => ToggleButtons(
        borderRadius: BorderRadius.circular(10),
        borderWidth: 1,
        borderColor: Colors.grey.shade100,
        selectedBorderColor: Colors.grey.shade100,
        constraints: BoxConstraints.expand(
            width: constraints.maxWidth / 2 - (borderwidth * 3) / 2,
            height: 70),
        children: const [
          Icon(FeatherIcons.thumbsUp),
          Icon(FeatherIcons.meh),
        ],
        onPressed: (int index) {},
        isSelected: const [false, true],
      ),
    );
  }*/

  @override
  Widget build(BuildContext context) {
    return FirebaseAuthenticationCubitCubit.userBuilder(
      (user) => BlocProvider(
        create: (context) => FeedbackSendCubit(author: user.toInfo()),
        child: BlocBuilder<FeedbackSendCubit, FeedbackSendState>(
          builder: (context, state) => state.when(
            error: (e) => ExceptionView.fromErrorClosable(e),
            sending: () => const Scaffold(
              body: Center(child: CircularProgressIndicator.adaptive()),
            ),
            sent: () => Scaffold(
              appBar: AppBar(),
              body: Center(
                  child: Text(
                l10n(context).lbl_feedbackThanks,
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              )),
            ),
            editing: ((categories, title, description) => Scaffold(
                  appBar: AppBar(title: Text(l10n(context).lbl_feedbackTitle)),
                  body: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: SingleChildScrollView(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(height: 30),
                        Text(l10n(context).lbl_feedbackDesc),
                        const SizedBox(height: 30),
                        //_feedbackType(),
                        //SizedBox(height: 40),
                        Text(l10n(context).lbl_feedbackCategory,
                            style: Theme.of(context).textTheme.headline6),
                        const SizedBox(height: 20),
                        ChipChooser<UserFeedbackCategories>(
                            selected: categories,
                            onChanged: (r) => context
                                .read<FeedbackSendCubit>()
                                .setCategories(r),
                            chips: UserFeedbackCategories.values
                                .map((e) => ChipData(e.label, e))
                                .toList()),
                        const SizedBox(height: 30),
                        TextFormField(
                          controller: title,
                          maxLines: 1,
                          style: const TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w600),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: l10n(context).lbl_feedbackYourTitle,
                            hintStyle: const TextStyle(
                                color: Colors.grey, fontSize: 17),
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: description,
                          maxLines: null,
                          onChanged: (value) => {},
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: l10n(context).lbl_feedbackYourText,
                            hintStyle: const TextStyle(color: Colors.grey),
                          ),
                        ),
                        const SizedBox(height: 100)
                      ],
                    )),
                  ),
                  floatingActionButton: ElevatedButton.icon(
                      onPressed: () {
                        if (title.value.text.isEmpty) {
                          Tools.showSnackbar(
                              l10n(context).msg_feedbackMissingTitle);
                          return;
                        }
                        context.read<FeedbackSendCubit>().send();
                      },
                      icon: const Icon(FeatherIcons.send),
                      label: Text(l10n(context).lbl_feedbackSend)),
                )),
          ),
        ),
      ),
    );
  }
}
