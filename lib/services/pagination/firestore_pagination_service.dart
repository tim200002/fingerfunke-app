import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:logger/logger.dart';

abstract class FirestorePaginationService<T> {
  final int paginationDistance;
  final FirebaseFirestore firestore;
  final StreamController<List<T>> _itemsStreamController =
      StreamController<List<T>>();
  List<StreamSubscription> _subscriptionStack = [];

  /// Subscription is only used when list has been empty at beginning
  /// Then we use this to subscribe to a change when list becomes not empty
  /// after that we can start fetching normal using requestNewPage()
  StreamSubscription? _emptyQuerySubscription;

  /// Firestore query to collection.
  /// Should already include all necessary ordering
  final Query _startQuery;

  /// mapper function for each documentSnapshot this function is invoked to return matching object
  final T Function(QueryDocumentSnapshot document) _mapper;

  /// last document retrieved from firestore, this is the starting point for next query
  DocumentSnapshot? lastDocument;

  /// list of all received pages, each page is ideally a list of length pagination Distance
  List<List<T>> _allReceivedPages = [];

  final Logger _logger = Logger();

  FirestorePaginationService(this._startQuery, this._mapper,
      {required this.firestore, this.paginationDistance = 20});

  // requests new page and adds elements to pagination
  // returns true if no new posts could be found
  Future<bool> requestNewPage() async {
    _logger.i(
        "Firestore pagination service request new page. This is the ${_allReceivedPages.length} page");
    Completer<bool> didReachEndCompleter = Completer();

    //------------------------------------------------------
    // This part finds the first and last document for each query
    Query newQuery = _startQuery.limit(paginationDistance);

    if (lastDocument != null) {
      newQuery = newQuery.startAfterDocument(lastDocument!);
    }

    QueryDocumentSnapshot? endDocumentOfThisQuery;
    final documents = (await newQuery.get()).docs;

    // Special case when query returns empty we subscribe to see if elements are added later
    if (documents.isEmpty) {
      _logger.i(
          "Empty Query subscription has been created since the current Query returned empty.");
      _emptyQuerySubscription = newQuery.limit(1).snapshots().listen(
          (firstElementSnapshot) {
        if (firstElementSnapshot.docs.isNotEmpty) {
          _elementAddedToEmptyQueryCallback();
        }
      },
          onDone: () => _logger.i("Empty Query Subscription stream closed"),
          onError: (err) => _logger.e(err));

      // check if we are on the first page, if so emit empty list
      if (_allReceivedPages.isEmpty) {
        _emitUpdatedValues([]);
      }

      return true;
    }

    //------------------------------------------------------------------------

    //------------------------------------------------------------------------
    // construct new query limited to start and end -> elements can be included in the middle
    // if not start is provided elements can also be included at the front
    endDocumentOfThisQuery = documents.last;
    newQuery = _startQuery.endAtDocument(endDocumentOfThisQuery);

    if (lastDocument != null) {
      newQuery = newQuery.startAfterDocument(lastDocument!);
    }

    //-----------------------------------------------------------------------

    int currentPageIndex = _allReceivedPages.length;

    // create a listener function to listen for this specific page
    StreamSubscription currentPageListener = newQuery.snapshots().listen(
        (currentPageSnapshot) {
      _logger.i(
          "Firesore pagination service read snapshots for page index: $currentPageIndex. This page contains ${currentPageSnapshot.docs.isNotEmpty ? currentPageSnapshot.docs.length : "none"} Elements");
      // were we able to receive more documents
      late final List<T> elements;
      if (currentPageSnapshot.docs.isNotEmpty) {
        elements = currentPageSnapshot.docs
            .map((QueryDocumentSnapshot postDocument) => _mapper(postDocument))
            .toList();

        // check if we are on last page and if so update last document to right value
        if (currentPageIndex == _allReceivedPages.length - 1) {
          lastDocument = currentPageSnapshot.docs.last;
        }
      } else {
        // if there are no documents in this snapshot there are in theory two explanations
        // 1) We reached end and there are just no more elements to query for -> however this case is already handled
        //    in the first part of this function -> can be ignored
        //
        // 2) All Elements in the current page have been deleted
        elements = [];
      }

        // check if we are working on an already exisiting page (currentPageIndex < number of pages)
        // or if we have to create a new page
        bool pageExists = currentPageIndex < _allReceivedPages.length;

        if (pageExists) {
          // If we are working on existing page just update the elements
          _allReceivedPages[currentPageIndex] = elements;
        } else {
          // Create new page
          _allReceivedPages.add(elements);
        }

        List<T> allElements = _concatenatePagesToList();
        _emitUpdatedValues(allElements);

        // determine if we received full page, or if this page is (currently at least) the last one
        // return true if there are more posts
        if (!didReachEndCompleter.isCompleted) {
          didReachEndCompleter.complete(elements.length < paginationDistance);
        }

    },
        onDone: () => _logger.e("Pagination Stream Subscription closed"),
        onError: (err) => _logger.e(err));
    _subscriptionStack.add(currentPageListener);
    return didReachEndCompleter.future;
  }

  void dispose() {
    _emptyQuerySubscription?.cancel();
    for (var subscription in _subscriptionStack) {
      subscription.cancel();
    }
    _subscriptionStack = [];
    _emptyQuerySubscription = null;
    lastDocument = null;
    _allReceivedPages = [];
  }

  List<T> _concatenatePagesToList() {
    return _allReceivedPages.fold<List<T>>(
        [], (previousValue, pageItems) => previousValue..addAll(pageItems));
  }

  void _emitUpdatedValues(List<T> items) {
    _itemsStreamController.add(items);
  }

  /// Used when list was empty initially
  /// We subscribe to change in not being empty
  /// When list receives first element this callbacl is triggered
  /// it cancels the subscription to the list and fetches the list now normally using requestNewPage()
  void _elementAddedToEmptyQueryCallback() {
    _logger.i(
        "An element has been added to the empty Query. Therefore Callback triggered");
    _emptyQuerySubscription?.cancel();
    requestNewPage();
  }

  Stream<List<T>> getItemsStream() => _itemsStreamController.stream;
}
