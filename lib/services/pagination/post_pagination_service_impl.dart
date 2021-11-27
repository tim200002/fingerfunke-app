import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fingerfunke_app/models/post/post.dart';
import 'package:fingerfunke_app/services/pagination/firestore_pagination_service.dart';

class PostPaginationServiceImpl extends FirestorePaginationService<Post> {
  PostPaginationServiceImpl(
      {FirebaseFirestore? firestore, int paginationDistance = 10})
      : super(paginationDistance: paginationDistance, firestore: firestore);

  @override
  Future<bool> requestNewPage() async {
    Completer<bool> didReachEndCompleter = Completer();
    Query helperQuery = firestore
        .collection('posts')
        .orderBy('creationTime', descending: true)
        .limit(paginationDistance);

    if (lastDocument != null) {
      helperQuery = helperQuery.startAfterDocument(lastDocument!);
    }

    QueryDocumentSnapshot endDocumentOfThisQuery =
        (await helperQuery.get()).docs.last;

    Query firestoreQuery = firestore
        .collection('posts')
        .orderBy('creationTime', descending: true)
        //ToDo check if end at works when during activity last document has been deleted
        .endAtDocument(endDocumentOfThisQuery);

    //If last Document is specified, we need to start Pagination after last Document
    if (lastDocument != null) {
      firestoreQuery = firestoreQuery.startAfterDocument(lastDocument!);
    }

    int currentPageIndex = allReceivedPages.length;

    // create a listener function to listen for this specific page
    StreamSubscription currentPageListener =
        firestoreQuery.snapshots().listen((currentPageSnapshot) {
      // were we able to receive more documents
      if (currentPageSnapshot.docs.isNotEmpty) {
        List<Post> posts = currentPageSnapshot.docs.map(
          (QueryDocumentSnapshot postDocument) {
            Post post = Post.fromDoc(postDocument);
            return post;
          },
        ).toList();

        // check if we are working on an already exisiting page (currentPageIndex < number of pages)
        // or if we have to create a new page
        bool pageExists = currentPageIndex < allReceivedPages.length;

        if (pageExists) {
          // If we are working on existing page just update the elements
          allReceivedPages[currentPageIndex] = posts;
        } else {
          // Create new page
          allReceivedPages.add(posts);
        }

        List<Post> allPosts = concatenatePagesToList();
        emitUpdatedValues(allPosts);

        // check if we are on last page and if so update last document to right value
        if (currentPageIndex == allReceivedPages.length - 1) {
          lastDocument = currentPageSnapshot.docs.last;
        }

        // determine if we received full page, or if this page is (currently at least) the last one
        // return true if there are more posts
        if (!didReachEndCompleter.isCompleted) {
          didReachEndCompleter.complete(posts.length < paginationDistance);
        }
      } else {
        // if there are no documents in this snapshot there are two possibilities
        // first one we are requesting over the last document, receive empty last page
        // two all documents in a given page have been deleted

        // We will ignore case two for now since maybe only runtime overhead, but case one has to be dealt with

        if (currentPageIndex == allReceivedPages.length) {
          didReachEndCompleter.complete(true);
        } else {
          didReachEndCompleter.complete(false);
        }
      }
    });
    subscriptionStack.add(currentPageListener);
    return didReachEndCompleter.future;
  }
}
