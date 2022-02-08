import 'package:fingerfunke_app/utils/exceptions.dart';
import 'package:fingerfunke_app/view/post_editor/cubit/post_editor_cubit.dart';
import 'package:fingerfunke_app/view/post_editor/models/general_editor_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

const _titleMaxCharacters = 160;

class TextFieldSection extends StatelessWidget {
  const TextFieldSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GeneralEditorFields fields = BlocProvider.of<PostEditorCubit>(context)
        .state
        .maybeWhen(
            editEvent: (fields, _) => fields,
            editGroup: (fields, _) => fields,
            orElse: () => throw InvalidStateException());
    return BlocListener<PostEditorCubit, PostEditorState>(
      listener: (context, state) => state.maybeWhen(
          editEvent: (updatedFields, _) => fields = updatedFields,
          editGroup: (updatedFields, _) => fields = updatedFields,
          orElse: () => throw InvalidStateException()),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // title field
          TextFormField(
            initialValue: fields.title,
            style: Theme.of(context).textTheme.headline5,
            minLines: 1,
            maxLines: 3,
            maxLength: _titleMaxCharacters,
            onChanged: (value) => BlocProvider.of<PostEditorCubit>(context)
                .updateInformation(
                    GeneralEditorFields.copyWithHelper(fields, title: value)),
            decoration: InputDecoration(
                counterText: "",
                border: InputBorder.none,
                hintText: "Titel des Posts",
                hintStyle: Theme.of(context)
                    .textTheme
                    .headline5
                    ?.copyWith(color: Colors.grey)),
          ),
          // Description field
          TextFormField(
            initialValue: fields.description,
            maxLines: null,
            onChanged: (value) => BlocProvider.of<PostEditorCubit>(context)
                .updateInformation(GeneralEditorFields.copyWithHelper(fields,
                    description: value)),
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: "Beschreibe deinen Post",
              hintStyle: TextStyle(color: Colors.grey),
            ),
          )
        ],
      ),
    );
  }
}
