import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../../common_widgets/list_items/post_feed_image_item.dart';
import '../../../../../utils/tools.dart';
import '../../../../illustration_view/illustration_view.dart';

/// A widget that shows a loading indicator for a while and then shows an empty
/// state if the loading takes too long.
/// Important!!!! Due to a rebuild of the pagination service, this widget is no longer necessary, since 
/// an empty list is now returned by the pagination service if there are no items.
class FeedLoadingView extends StatefulWidget {
  final Duration maxLoadingDuration;
  const FeedLoadingView(
      {super.key, this.maxLoadingDuration = const Duration(seconds: 4)});

  @override
  State<FeedLoadingView> createState() => _FeedLoadingViewState();
}

class _FeedLoadingViewState extends State<FeedLoadingView> {
  bool loading = true;
  Timer? waitingTimer;
  @override
  void initState() {
    wait();
    super.initState();
  }

  wait() async {
    waitingTimer?.cancel();
     waitingTimer = Timer(widget.maxLoadingDuration, () => setState(() => loading = false));
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? PostFeedImageItem.loading()
        : IllustrationView.empty(text: l10n(context).msg_feedEmpty);
  }

  @override
  void dispose() {
    waitingTimer?.cancel();
    super.dispose();
  }
}
