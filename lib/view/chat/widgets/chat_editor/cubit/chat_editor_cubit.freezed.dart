// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_editor_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ChatEditorState {
  bool get isValid => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChatEditorStateCopyWith<ChatEditorState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatEditorStateCopyWith<$Res> {
  factory $ChatEditorStateCopyWith(
          ChatEditorState value, $Res Function(ChatEditorState) then) =
      _$ChatEditorStateCopyWithImpl<$Res, ChatEditorState>;
  @useResult
  $Res call({bool isValid});
}

/// @nodoc
class _$ChatEditorStateCopyWithImpl<$Res, $Val extends ChatEditorState>
    implements $ChatEditorStateCopyWith<$Res> {
  _$ChatEditorStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isValid = null,
  }) {
    return _then(_value.copyWith(
      isValid: null == isValid
          ? _value.isValid
          : isValid // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ChatEditorStateCopyWith<$Res>
    implements $ChatEditorStateCopyWith<$Res> {
  factory _$$_ChatEditorStateCopyWith(
          _$_ChatEditorState value, $Res Function(_$_ChatEditorState) then) =
      __$$_ChatEditorStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isValid});
}

/// @nodoc
class __$$_ChatEditorStateCopyWithImpl<$Res>
    extends _$ChatEditorStateCopyWithImpl<$Res, _$_ChatEditorState>
    implements _$$_ChatEditorStateCopyWith<$Res> {
  __$$_ChatEditorStateCopyWithImpl(
      _$_ChatEditorState _value, $Res Function(_$_ChatEditorState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isValid = null,
  }) {
    return _then(_$_ChatEditorState(
      isValid: null == isValid
          ? _value.isValid
          : isValid // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_ChatEditorState implements _ChatEditorState {
  const _$_ChatEditorState({this.isValid = false});

  @override
  @JsonKey()
  final bool isValid;

  @override
  String toString() {
    return 'ChatEditorState(isValid: $isValid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChatEditorState &&
            (identical(other.isValid, isValid) || other.isValid == isValid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isValid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChatEditorStateCopyWith<_$_ChatEditorState> get copyWith =>
      __$$_ChatEditorStateCopyWithImpl<_$_ChatEditorState>(this, _$identity);
}

abstract class _ChatEditorState implements ChatEditorState {
  const factory _ChatEditorState({final bool isValid}) = _$_ChatEditorState;

  @override
  bool get isValid;
  @override
  @JsonKey(ignore: true)
  _$$_ChatEditorStateCopyWith<_$_ChatEditorState> get copyWith =>
      throw _privateConstructorUsedError;
}
