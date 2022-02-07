import 'package:fingerfunke_app/view/post_editor/cubit/post_editor_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Prototype for an generic text input field for the Post Editor
class BasicTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  const BasicTextField(
      {required this.controller, required this.hintText, Key? key})
      : super(key: key);

  @override
  State<BasicTextField> createState() => _BasicTextFieldState();
}

class _BasicTextFieldState extends State<BasicTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: null,
      controller: widget.controller,
      onChanged: (_) =>
          BlocProvider.of<PostEditorCubit>(context).validateInput(),
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: widget.hintText,
        hintStyle: const TextStyle(color: Colors.grey),
      ),
    );
  }

  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }
}
