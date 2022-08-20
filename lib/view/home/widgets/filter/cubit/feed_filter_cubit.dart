import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../models/post/post.dart';

part 'feed_filter_cubit.freezed.dart';
part 'feed_filter_state.dart';

class FeedFilterCubit extends Cubit<FeedFilterState> {
  FeedFilterCubit() : super(const FeedFilterState.neutral(10, true, false));

  void change(FeedFilterState changed) {
    emit(changed);
  }

  List<Post> filter(List<Post> posts) {
    if (state.hideCompleted) {
      posts = posts.where((p) => !(p.asEvent?.isCompleted ?? true)).toList();
    }
    if (state.hideFarFuture) {
      posts = posts
          .where((p) => !(p.asEvent?.startTime
                  .isBefore(DateTime.now()..add(const Duration(days: 30))) ??
              false))
          .toList();
    }
    return posts;
  }
}
