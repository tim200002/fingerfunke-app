import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

abstract class FirestorePaginationService<T> {
  @protected
  final int paginationDistance;
  @protected
  final FirebaseFirestore firestore;
  @protected
  final StreamController<List<T>> itemsStreamController =
      StreamController<List<T>>();
  @protected
  List<StreamSubscription> subscriptionStack = [];

  // last document retrieved from firestore, this is the starting point for next query
  @protected
  DocumentSnapshot? lastDocument;
  // list of all received pages, each page is ideally a list of length pagination Distance
  @protected
  List<List<T>> allReceivedPages = [];

  FirestorePaginationService(
      {FirebaseFirestore? firestore, this.paginationDistance = 20})
      : firestore = firestore ?? FirebaseFirestore.instance;

  // requests new page and adds elements to pagination
  // returns false if no new posts could be found
  //! Todo this could probably be written in a generic way for most cases
  Future<bool> requestNewPage();

  void dispose() {
    for (var subscription in subscriptionStack) {
      subscription.cancel();
    }
    subscriptionStack = [];
    lastDocument = null;
  }

  List<T> concatenatePagesToList() {
    return allReceivedPages.fold<List<T>>(
        [], (previousValue, pageItems) => previousValue..addAll(pageItems));
  }

  void emitUpdatedValues(List<T> items) {
    itemsStreamController.add(items);
  }

  Stream<List<T>> getItemsStream() => itemsStreamController.stream;
}
