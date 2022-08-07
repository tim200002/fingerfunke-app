import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../../../models/user/user.dart';
import '../../../../models/user_feedback.dart';
import '../../../../repositories/user_feedback_repository/user_feedback_repository.dart';
import '../../../../repositories/user_feedback_repository/user_feedback_repository.impl.dart';

part 'feedback_send_state.dart';
part 'feedback_send_cubit.freezed.dart';

class FeedbackSendCubit extends Cubit<FeedbackSendState> {
  final UserFeedbackRepository _feedbackRepository =
      UserFeedbackRepositoryImpl();
  final UserInfo author;
  FeedbackSendCubit({required this.author})
      : super(FeedbackSendState.editing(
            [], TextEditingController(), TextEditingController()));

  void setCategories(List<UserFeedbackCategories> cats) {
    state.whenOrNull(
        editing: ((_, title, description) =>
            emit(FeedbackSendState.editing(cats, title, description))));
  }

  void send() {
    state.whenOrNull(
      editing: (cat, title, desc) async {
        emit(const FeedbackSendState.sending());
        if (title.value.text.isEmpty) return;

        PackageInfo packageInfo = await PackageInfo.fromPlatform();
        String appVersion = "${packageInfo.version}+${packageInfo.buildNumber}";

        UserFeedback feedback = UserFeedback(
            author: author,
            creationTime: DateTime.now(),
            categories: cat,
            state: UserFeedbackState.open,
            appVersion: appVersion,
            title: title.value.text,
            description: desc.value.text);
        _feedbackRepository.createReport(feedback).then(
            (value) => emit(const FeedbackSendState.sent()),
            onError: (e) => emit(FeedbackSendState.error(e)));
      },
    );
  }
}
