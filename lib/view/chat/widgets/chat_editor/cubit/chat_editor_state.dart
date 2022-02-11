part of 'chat_editor_cubit.dart';

@freezed
class ChatEditorState with _$ChatEditorState {
  const factory ChatEditorState({@Default(false) bool isValid}) =
      _ChatEditorState;
}
