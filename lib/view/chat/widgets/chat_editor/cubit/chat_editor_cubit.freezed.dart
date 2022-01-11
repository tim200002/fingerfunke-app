// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'chat_editor_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ChatEditorStateTearOff {
  const _$ChatEditorStateTearOff();

  _ChatEditorState call(
      {required TextEditingController controller, bool isValid = false}) {
    return _ChatEditorState(
      controller: controller,
      isValid: isValid,
    );
  }
}

/// @nodoc
const $ChatEditorState = _$ChatEditorStateTearOff();

/// @nodoc
mixin _$ChatEditorState {
  TextEditingController get controller => throw _privateConstructorUsedError;
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
  $Res call({TextEditingController controller, bool isValid});
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
    Object? controller = freezed,
    Object? isValid = freezed,
  }) {
    return _then(_value.copyWith(
      controller: controller == freezed
          ? _value.controller
          : controller // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      isValid: isValid == freezed
          ? _value.isValid
          : isValid // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$ChatEditorStateCopyWith<$Res>
    implements $ChatEditorStateCopyWith<$Res> {
  factory _$ChatEditorStateCopyWith(
          _ChatEditorState value, $Res Function(_ChatEditorState) then) =
      __$ChatEditorStateCopyWithImpl<$Res>;
  @override
  $Res call({TextEditingController controller, bool isValid});
}

/// @nodoc
class __$ChatEditorStateCopyWithImpl<$Res>
    extends _$ChatEditorStateCopyWithImpl<$Res>
    implements _$ChatEditorStateCopyWith<$Res> {
  __$ChatEditorStateCopyWithImpl(
      _ChatEditorState _value, $Res Function(_ChatEditorState) _then)
      : super(_value, (v) => _then(v as _ChatEditorState));

  @override
  _ChatEditorState get _value => super._value as _ChatEditorState;

  @override
  $Res call({
    Object? controller = freezed,
    Object? isValid = freezed,
  }) {
    return _then(_ChatEditorState(
      controller: controller == freezed
          ? _value.controller
          : controller // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      isValid: isValid == freezed
          ? _value.isValid
          : isValid // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_ChatEditorState implements _ChatEditorState {
  const _$_ChatEditorState({required this.controller, this.isValid = false});

  @override
  final TextEditingController controller;
  @JsonKey(defaultValue: false)
  @override
  final bool isValid;

  @override
  String toString() {
    return 'ChatEditorState(controller: $controller, isValid: $isValid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChatEditorState &&
            (identical(other.controller, controller) ||
                other.controller == controller) &&
            (identical(other.isValid, isValid) || other.isValid == isValid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, controller, isValid);

  @JsonKey(ignore: true)
  @override
  _$ChatEditorStateCopyWith<_ChatEditorState> get copyWith =>
      __$ChatEditorStateCopyWithImpl<_ChatEditorState>(this, _$identity);
}

abstract class _ChatEditorState implements ChatEditorState {
  const factory _ChatEditorState(
      {required TextEditingController controller,
      bool isValid}) = _$_ChatEditorState;

  @override
  TextEditingController get controller;
  @override
  bool get isValid;
  @override
  @JsonKey(ignore: true)
  _$ChatEditorStateCopyWith<_ChatEditorState> get copyWith =>
      throw _privateConstructorUsedError;
}
