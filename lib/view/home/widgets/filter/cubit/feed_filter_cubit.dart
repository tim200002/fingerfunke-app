import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'feed_filter_state.dart';
part 'feed_filter_cubit.freezed.dart';

class FeedFilterCubit extends Cubit<FeedFilterState> {
  FeedFilterCubit() : super(const FeedFilterState.neutral(10, true));

  void change(FeedFilterState changed) {
    emit(changed);
  }

  Query createFilter(CollectionReference collection) {
    Query? query;
    print("create query ${state.hideCompleted}");

    if (state.hideCompleted) {
      query = collection.where("startTime",
          isGreaterThanOrEqualTo: DateTime.now().microsecondsSinceEpoch);
    }
    //TODO: das ist ein kleiner 'hack' mit der ID.
    //Müssen wir uns nochmal anschauen
    return query ?? collection.where("id", isNull: false);
  }
}
