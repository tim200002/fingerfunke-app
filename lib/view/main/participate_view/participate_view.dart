import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../cubits/firebase_authentication_cubit/firebase_authentication_cubit_cubit.dart';
import '../../../repositories/post_repository/post_repository.dart';
import '../../../utils/app_theme.dart';
import '../../../utils/tools.dart';
import '../../illustration_view/illustration_view.dart';
import '../../non_paginated_compact_post_feed/non_paginated_compact_post_feed.dart';

/// this class prevents elements within a TabView to be rebuilt upon
/// tab switching. In our case, this means that we do not (unnecessarily)
/// fetch new streams of posts each time the user switches the tab.
class _PersTabItem extends StatefulWidget {
  final Widget child;
  const _PersTabItem(this.child);

  @override
  State<_PersTabItem> createState() => __PersTabItemState();
}

class __PersTabItemState extends State<_PersTabItem>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Padding(
        padding: const EdgeInsets.only(
            left: AppTheme.PADDING_SIDE, right: AppTheme.PADDING_SIDE, top: 15),
        child: widget.child);
  }

  @override
  bool get wantKeepAlive => true;
}

class ParticipateView extends StatelessWidget {

  final PostRepository _postRepository = GetIt.I.get<PostRepository>();

  ParticipateView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: TabBar(
            indicatorColor: const Color(0xffF0ACB0),
            labelColor: Colors.black,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorWeight: 3,
            tabs: [
              Tab(text: l10n(context).lbl_PostsParticipating),
              Tab(text: l10n(context).lbl_PostsMy),
            ],
          ),
          //title: const Text('Tabs Demo'),
        ),
        body: FirebaseAuthenticationCubitCubit.userBuilder(
          (user) => TabBarView(
            children: [
              _PersTabItem(NonPaginatedCompactPostFeed(
                  stream: _postRepository.observeJoinedPosts(user.id, excludeAuthored: true),
                  loadingIndicator: const CircularProgressIndicator(),
                  emptyIndicator: IllustrationView.empty(
                    text: l10n(context).lbl_notParticipating,
                  ))),
              _PersTabItem(
                NonPaginatedCompactPostFeed(
                    stream: _postRepository.observeAuthoredPosts(user.id),
                    loadingIndicator: const CircularProgressIndicator(),
                    emptyIndicator: IllustrationView.empty(
                      text: l10n(context).lbl_notAuthor,
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
