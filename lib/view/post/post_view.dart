import 'package:fingerfunke_app/utils/app_theme.dart';
import 'package:fingerfunke_app/view/comments/comments_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class PostView extends StatelessWidget {
  const PostView({Key? key}) : super(key: key);

  Widget _iconTextItem({required IconData icon, required String label}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.only(right: 8),
          child: Icon(icon),
        ),
        Text(label,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ))
      ],
    );
  }

  Widget _tagWidget(String text) {
    return Padding(
        padding: EdgeInsets.only(right: 10),
        child: Text(
          "#$text",
          style: TextStyle(fontWeight: FontWeight.bold),
        ));
  }

  Widget _descriptionSection(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Text("Est nobis maiores accusantium optio autem est." +
          "Ut et aut modi explicabo. Voluptate consequuntur tempore qui" +
          "deserunt qui deserunt. Consequatur quo fugit officiis mollitia." +
          "Itaque libero cupiditate voluptas porro." +
          "In placeat ab numquam. Voluptates non ut ut qui molestiae." +
          "Et itaque facere ducimus. Sunt ut commodi eius ex.\n" +
          "Ipsum eos quam perspiciatis. Ullam aperiam praesentium ut non in." +
          "Quia omnis quaerat dolor vel molestiae accusamus quas nihil." +
          "Aliquam quae sunt voluptatum est quasi esse. Ducimus doloremque" +
          "qui temporibus qui hic deleniti. In quis corporis laborum esse." +
          "Qui iure laborum aspernatur." +
          "Molestias ducimus saepe quibusdam debitis facilis dicta cumque." +
          "A inventore ipsum accusamus laudantium beatae debitis. Ipsum" +
          "molestiae autem exercitationem distinctio aperiam accusamus vel." +
          "Qui dolor quia ex tenetur ut dolor recusandae."),
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
        ));
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
        ));
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
                  onPressed: () {},
                  icon: Icon(Icons.share_rounded),
                  label: Text("share")))
        ],
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
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
        ),
        _dateTimeSection(context),
        _tagsSection(context),
        _descriptionSection(context),
        _actionsSection(context),
        const Padding(
          padding: EdgeInsets.only(top: 20, bottom: 20),
          child: CommentsView(),
        )
      ],
    );
  }
}
