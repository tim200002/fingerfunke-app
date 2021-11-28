import 'package:fingerfunke_app/models/message/message.dart';
import 'package:fingerfunke_app/services/pagination/message_pagination_service.dart';
import 'package:fingerfunke_app/view/comment_feed/widgets/text_comment.dart';
import 'package:fingerfunke_app/view/comment_feed/widgets/video_comment.dart';
import 'package:fingerfunke_app/view/paginated_list/view/paginated_list.dart';
import 'package:flutter/material.dart';
import 'package:fingerfunke_app/utils/type_aliases.dart';

class CommentFeed extends StatelessWidget {
  const CommentFeed(this._postId, {Key? key}) : super(key: key);

  final FirestoreId _postId;

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: PaginatedList<Message>(
        firestorePaginationService: MessagePaginationService(_postId),
        itemBuilder: (message) {
          switch (message.type) {
            case message_type.text:
              return TextComment(message as TextMessage);
            case message_type.video:
              return VideoComment(message as VideoMessage);
          }
        },
        reverse: true,
        shouldShrinkWrap: (int noOfItems) => noOfItems < 10,
        endMessage: "There are no more messages",
      ),
    );
  }
}
