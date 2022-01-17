import 'package:fingerfunke_app/common_widgets/image/network_placeholder_image.dart/network_placeholder_image.dart';
import 'package:fingerfunke_app/models/asset/asset.dart';
import 'package:fingerfunke_app/models/message/message.dart';
import 'package:fingerfunke_app/repositories/video_repository/video_repository.impl.dart';
import 'package:fingerfunke_app/services/pagination/message_pagination_service.dart';
import 'package:fingerfunke_app/utils/util_widgets/loading_page.dart';
import 'package:fingerfunke_app/utils/util_widgets/page_screen.dart';
import 'package:fingerfunke_app/view/fullscreen_video/view/fullscreen_video_page.dart';
import 'package:fingerfunke_app/view/paginated_list/cubit/paginated_list_cubit.dart';
import 'package:fingerfunke_app/view/post/cubit/post_cubit.dart';
import 'package:fingerfunke_app/view/post/view/post_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostPage extends StatelessWidget {
  const PostPage({Key? key}) : super(key: key);

  static const List<BoxShadow> _cardShadow = [
    BoxShadow(
        color: Color(0xFF919191),
        offset: Offset(0, 3),
        spreadRadius: -2,
        blurRadius: 7)
  ];

  static final Widget _contentCardDecoration = Transform.translate(
    offset: const Offset(0, 1),
    child: Container(
      height: 15,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
          color: Colors.white),
    ),
  );

  Widget _closeButton(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(100),
            boxShadow: _cardShadow),
        child: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(Icons.close)));
  }

  @override
  Widget build(BuildContext context) {
    final postId = ModalRoute.of(context)!.settings.arguments as String;
    return MultiBlocProvider(
      providers: [
        BlocProvider<PostCubit>(
          create: (_) => PostCubit(postId),
        ),
        // it makes sense to already provide the chat message cubit here
        // so that when opening the chat initial messages are typically already loaded
        // therefore we require the cubit to be instantly built -> lazy is set to false
        BlocProvider(
          create: (_) => PaginatedListCubit<Message>(
              paginationService: MessagePaginationService(postId)),
          lazy: false,
        )
      ],
      child: Builder(
        builder: (context) => AnimatedSwitcher(
          duration: const Duration(milliseconds: 100),
          child: BlocBuilder<PostCubit, PostState>(
            builder: (context, state) => state.when(
              loading: (_) => const LoadingPage(),
              normal: (post) => PageScreen(
                appBar: AppBar(leading: _closeButton(context)),
                extendBodyBehindAppBar: true,
                headerHeight: 200,
                roundedBody: false,
                roundedHeader: false,
                header: InkWell(
                  onTap: () => Navigator.of(context).push(
                      FullscreenVideoPage.route(
                          url: VideoRepositoryImpl().createPlaybackUrl((post
                                  .media
                                  .firstWhere((e) => e.type == asset_type.video)
                              as VideoAsset)))),
                  child: Stack(children: [
                    NetworkPlaceholderImage(
                      VideoRepositoryImpl()
                          .createThumbnailUrl(post.media[0] as VideoAsset),
                      Container(
                        color: Colors.grey,
                      ),
                      width: MediaQuery.of(context).size.width.toInt(),
                      fit: BoxFit.cover,
                    ),
                    const Center(
                      child: Icon(
                        Icons.play_arrow_rounded,
                        size: 70,
                        color: Colors.white,
                      ),
                    )
                  ]),
                ),
                headerBottom: _contentCardDecoration,
                body: PostView(postId),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
