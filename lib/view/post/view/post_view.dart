import 'package:fingerfunke_app/models/message/message.dart';
import 'package:fingerfunke_app/routes.dart';
import 'package:fingerfunke_app/utils/app_theme.dart';
import 'package:fingerfunke_app/utils/exceptions.dart';
import 'package:fingerfunke_app/view/chat/view/chat_page.dart';
import 'package:fingerfunke_app/view/comment_feed/comment_feed_with_editor.dart';
import 'package:fingerfunke_app/view/paginated_list/cubit/paginated_list_cubit.dart';
import 'package:fingerfunke_app/view/post/cubit/post_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fingerfunke_app/utils/type_aliases.dart';

class PostView extends StatelessWidget {
  final FirestoreId postId;
  const PostView(this.postId, {Key? key}) : super(key: key);

  Widget _iconTextItem({required IconData icon, required String label}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 8),
          child: Icon(icon),
        ),
        Text(label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ))
      ],
    );
  }

  Widget _tagWidget(String text) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Text(
        "#$text",
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _descriptionSection() {
    return BlocBuilder<PostCubit, PostState>(
      //ToDo implement build when
      builder: (context, state) => state.maybeWhen(
          normal: (post) => Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(post.description),
              ),
          orElse: () => ErrorWidget(InvalidStateException())),
    );
  }

  Widget _tagsSection(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: SizedBox(
        height: 30,
        child: ListView(
          //clipBehavior: Clip.none,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          children: [for (int i = 0; i < 10; i++) _tagWidget("Item$i")],
        ),
      ),
    );
  }

  Widget _dateTimeSection(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: [
          Expanded(
              child: _iconTextItem(
                  icon: Icons.calendar_today_rounded, label: "42.11.2021")),
          Expanded(
              child: _iconTextItem(icon: Icons.schedule, label: "ab 18 Uhr"))
        ],
      ),
    );
  }

  Widget _actionsSection(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Expanded(
              child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.bookmark_border_rounded),
                  label: Text("Ich bin dabei"))),
          Expanded(
              child: TextButton.icon(
                  onPressed: () => Navigator.of(context).pushNamed(chatRoute, arguments: ChatArguments(postId: postId, paginatedListCubit: BlocProvider.of<PaginatedListCubit<Message>>(context))),
                  icon: Icon(Icons.share_rounded),
                  label: Text("share")))
        ],
      ),
    );
  }

  Widget _commentsSection(BuildContext context) {
    final PostState state = BlocProvider.of<PostCubit>(context).state;
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: ConstrainedBox(
        constraints:
            BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.6),
        child: state.maybeWhen(
          normal: (post) => CommentFeedWithEditor(post.id),
          orElse: () => ErrorWidget(InvalidStateException),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          "This an example title of the event",
          style: AppTheme.textStyleAccent(
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
        ),
        _dateTimeSection(context),
        _tagsSection(context),
        _descriptionSection(),
        _actionsSection(context),
        _commentsSection(context)
      ],
    );
  }
}
