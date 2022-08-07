// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

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
      _$ChatEditorStateCopyWithImpl<$Res>;
  $Res call({bool isValid});
}

/// @nodoc
class _$ChatEditorStateCopyWithImpl<$Res>
    implements $ChatEditorStateCopyWith<$Res> {
  _$ChatEditorStateCopyWithImpl(this._value, this._then);

  final ChatEditorState _value;
  // ignore: unused_field
  final $Res Function(ChatEditorState) _then;

  @override
  $Res call({
    Object? isValid = freezed,
  }) {
    return _then(_value.copyWith(
      isValid: isValid == freezed
          ? _value.isValid
          : isValid // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_ChatEditorStateCopyWith<$Res>
    implements $ChatEditorStateCopyWith<$Res> {
  factory _$$_ChatEditorStateCopyWith(
          _$_ChatEditorState value, $Res Function(_$_ChatEditorState) then) =
      __$$_ChatEditorStateCopyWithImpl<$Res>;
  @override
  $Res call({bool isValid});
}

/// @nodoc
class __$$_ChatEditorStateCopyWithImpl<$Res>
    extends _$ChatEditorStateCopyWithImpl<$Res>
    implements _$$_ChatEditorStateCopyWith<$Res> {
  __$$_ChatEditorStateCopyWithImpl(
      _$_ChatEditorState _value, $Res Function(_$_ChatEditorState) _then)
      : super(_value, (v) => _then(v as _$_ChatEditorState));

  @override
  _$_ChatEditorState get _value => super._value as _$_ChatEditorState;

  @override
  $Res call({
    Object? isValid = freezed,
  }) {
    return _then(_$_ChatEditorState(
      isValid: isValid == freezed
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
            const DeepCollectionEquality().equals(other.isValid, isValid));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(isValid));

  @JsonKey(ignore: true)
  @override
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
