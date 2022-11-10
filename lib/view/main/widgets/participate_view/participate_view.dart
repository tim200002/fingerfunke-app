import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../cubits/app_cubit/app_cubit.dart';
import '../../../../utils/app_theme.dart';
import '../../../../utils/tools.dart';
import '../../../post_feed/posts_list_cubit/posts_list_cubit.dart';
import '../../../post_feed/view/compact_post_feed.dart';

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
    return Padding(
        padding: const EdgeInsets.only(
            left: AppTheme.PADDING_SIDE, right: AppTheme.PADDING_SIDE, top: 15),
        child: widget.child);
  }

  @override
  bool get wantKeepAlive => true;
}

class ParticipateView extends StatelessWidget {
  const ParticipateView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const TabBar(
            indicatorColor: Color(0xffF0ACB0),
            labelColor: Colors.black,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorWeight: 3,
            tabs: [
              Tab(text: "Teilnahmen"),
              Tab(text: "meine Posts"),
            ],
          ),
          //title: const Text('Tabs Demo'),
        ),
        body: BlocBuilder<AppCubit, AppState>(
            builder: (context, state) => TabBarView(
                  children: [
                    _PersTabItem(CompactPostsFeed(
                      query: () =>
                          PostsListCubit.queryJoinedPosts(state.user.id),
                      filter: (posts) => posts
                          .where((p) => !p.isAuthor(state.user.id))
                          .toList(),
                      emptyMessage: l10n(context).lbl_notParticipating,
                    )),
                    _PersTabItem(CompactPostsFeed(
                      query: () =>
                          PostsListCubit.queryAuthorPosts(state.user.id),
                      emptyMessage: l10n(context).lbl_notAuthor,
                    ))
                  ],
                )),
      ),
    );
  }
}
