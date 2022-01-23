import 'package:fingerfunke_app/models/message/message.dart';
import 'package:fingerfunke_app/routes.dart';
import 'package:fingerfunke_app/utils/app_theme.dart';
import 'package:fingerfunke_app/utils/exceptions.dart';
import 'package:fingerfunke_app/view/chat/view/chat_page.dart';
import 'package:fingerfunke_app/view/paginated_list/cubit/paginated_list_cubit.dart';
import 'package:fingerfunke_app/view/post/cubit/post_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fingerfunke_app/utils/type_aliases.dart';
import 'package:share_plus/share_plus.dart';

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
      padding: const EdgeInsets.only(right: 5),
      child: Chip(
        // TODO extract widget
        label: Text("#$text"),
        backgroundColor: Colors.grey.shade200,
      ),
    );
  }

  Widget _descriptionSection() {
    return BlocBuilder<PostCubit, PostState>(
      //ToDo implement build when
      builder: (context, state) => state.maybeWhen(
          normal: (post) => Container(
              constraints: const BoxConstraints(
              ),
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(post.description, style: Theme.of(context).textTheme.bodyText1,),
              ),
          orElse: () => ErrorWidget(InvalidStateException())),
    );
  }

  Widget _tagsSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
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

  Widget _headerSection(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          flex: 10,
          child: Text(
            "This an example title of the event",
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
        Flexible(
          flex: 2,
          child: IconButton(
            padding: const EdgeInsets.symmetric(
              vertical: 5,
            ),
            alignment: Alignment.topCenter,
            // TODO add share functionality
            onPressed: () => Share.share('Check out this awesome event: https://fingerfunke.de'),
            icon: const Icon(Icons.share_rounded),
          ),
        ),
      ],
    );
  }

  Widget _dateTimeSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
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
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
              flex: 10,
              fit: FlexFit.tight,
              child: ElevatedButton.icon(
                  onPressed: () {},
                  // TODO Change text and icon when user is added
                  icon: const Icon(Icons.add),
                  label: const Text("Ich bin dabei"))),
          Flexible(
              flex: 2,
              child: Center(
                child: IconButton(
                  onPressed: () => Navigator.of(context).pushNamed(chatRoute,
                      arguments: ChatArguments(
                          postId: postId,
                          paginatedListCubit:
                              BlocProvider.of<PaginatedListCubit<Message>>(
                                  context))),
                  //TODO change to filled icon when date is bookmarked
                  icon: const Icon(Icons.bookmark_border_rounded),
                ),
              ))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        _headerSection(context),
        _dateTimeSection(context),
        _tagsSection(context),
        _descriptionSection(),
        _actionsSection(context),
      ],
    );
  }
}
