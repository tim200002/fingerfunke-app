import 'package:fingerfunke_app/utils/dev_tools.dart';
import 'package:fingerfunke_app/view/post_editor/view/pe_info_section.dart';
import 'package:flutter/material.dart';

const TITLE_MAX_CHARACTERS = 160;

class PostEditorPage extends StatelessWidget {
  const PostEditorPage({Key? key}) : super(key: key);

  Widget _titleField(BuildContext context) {
    return TextField(
      style: Theme.of(context).textTheme.headline3,
      minLines: 1,
      maxLines: 3,
      maxLength: TITLE_MAX_CHARACTERS,
      decoration: InputDecoration(
          counterText: "",
          border: InputBorder.none,
          hintText: "Titel des Posts",
          hintStyle: Theme.of(context)
              .textTheme
              .headline3
              ?.copyWith(color: Colors.grey)),
    );
  }

  Widget _descriptionField(BuildContext context) {
    return const TextField(
        maxLines: null,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "Beschreibe dein Event",
            hintStyle: TextStyle(color: Colors.grey)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("neuer Post"),
          leading: IconButton(
              icon: const Icon(Icons.close_rounded),
              onPressed: () => Navigator.of(context).pop())),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            const PEInfoSection(),
            const SizedBox(height: 30),
            _titleField(context),
            //const SizedBox(height: 10),
            _descriptionField(context)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.send_rounded),
        onPressed: () => DevTools.showToDoSnackbar(context),
      ),
    );
  }
}
