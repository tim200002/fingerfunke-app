import 'package:fingerfunke_app/view/post_editor/cubit/post_editor_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/src/provider.dart';

const titleMaxCharacters = 160;

/// Special text field for the title of the Post
class TitleField extends StatefulWidget {
  final TextEditingController titleController;
  const TitleField(this.titleController, {Key? key}) : super(key: key);

  @override
  State<TitleField> createState() => _TitleFieldState();
}

class _TitleFieldState extends State<TitleField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: Theme.of(context).textTheme.headline5,
      minLines: 1,
      maxLines: 3,
      maxLength: titleMaxCharacters,
      controller: widget.titleController,
      onChanged: (_) =>
          BlocProvider.of<PostEditorCubit>(context).validateInput(),
      decoration: InputDecoration(
          counterText: "",
          border: InputBorder.none,
          hintText: "Titel des Posts",
          hintStyle: Theme.of(context)
              .textTheme
              .headline5
              ?.copyWith(color: Colors.grey)),
    );
  }

  @override
  void dispose() {
    widget.titleController.dispose();
    super.dispose();
  }
}
