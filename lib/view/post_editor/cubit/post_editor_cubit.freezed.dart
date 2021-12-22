// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'post_editor_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PostEditorStateTearOff {
  const _$PostEditorStateTearOff();

  _Loading loading() {
    return const _Loading();
  }

  _Editing editing(EditingPost post, bool invalid) {
    return _Editing(
      post,
      invalid,
    );
  }

  _Submitting submitting() {
    return const _Submitting();
  }

  _Submitted submitted() {
    return const _Submitted();
  }

  _Error error(String message) {
    return _Error(
      message,
    );
  }
}

/// @nodoc
const $PostEditorState = _$PostEditorStateTearOff();

/// @nodoc
mixin _$PostEditorState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(EditingPost post, bool invalid) editing,
    required TResult Function() submitting,
    required TResult Function() submitted,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(EditingPost post, bool invalid)? editing,
    TResult Function()? submitting,
    TResult Function()? submitted,
    TResult Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(EditingPost post, bool invalid)? editing,
    TResult Function()? submitting,
    TResult Function()? submitted,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Editing value) editing,
    required TResult Function(_Submitting value) submitting,
    required TResult Function(_Submitted value) submitted,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Editing value)? editing,
    TResult Function(_Submitting value)? submitting,
    TResult Function(_Submitted value)? submitted,
    TResult Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Editing value)? editing,
    TResult Function(_Submitting value)? submitting,
    TResult Function(_Submitted value)? submitted,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostEditorStateCopyWith<$Res> {
  factory $PostEditorStateCopyWith(
          PostEditorState value, $Res Function(PostEditorState) then) =
      _$PostEditorStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$PostEditorStateCopyWithImpl<$Res>
    implements $PostEditorStateCopyWith<$Res> {
  _$PostEditorStateCopyWithImpl(this._value, this._then);

  final PostEditorState _value;
  // ignore: unused_field
  final $Res Function(PostEditorState) _then;
}

/// @nodoc
abstract class _$LoadingCopyWith<$Res> {
  factory _$LoadingCopyWith(_Loading value, $Res Function(_Loading) then) =
      __$LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$LoadingCopyWithImpl<$Res> extends _$PostEditorStateCopyWithImpl<$Res>
    implements _$LoadingCopyWith<$Res> {
  __$LoadingCopyWithImpl(_Loading _value, $Res Function(_Loading) _then)
      : super(_value, (v) => _then(v as _Loading));

  @override
  _Loading get _value => super._value as _Loading;
}

/// @nodoc

class _$_Loading implements _Loading {
  const _$_Loading();

  @override
  String toString() {
    return 'PostEditorState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(EditingPost post, bool invalid) editing,
    required TResult Function() submitting,
    required TResult Function() submitted,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(EditingPost post, bool invalid)? editing,
    TResult Function()? submitting,
    TResult Function()? submitted,
    TResult Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(EditingPost post, bool invalid)? editing,
    TResult Function()? submitting,
    TResult Function()? submitted,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Editing value) editing,
    required TResult Function(_Submitting value) submitting,
    required TResult Function(_Submitted value) submitted,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Editing value)? editing,
    TResult Function(_Submitting value)? submitting,
    TResult Function(_Submitted value)? submitted,
    TResult Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Editing value)? editing,
    TResult Function(_Submitting value)? submitting,
    TResult Function(_Submitted value)? submitted,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements PostEditorState {
  const factory _Loading() = _$_Loading;
}

/// @nodoc
abstract class _$EditingCopyWith<$Res> {
  factory _$EditingCopyWith(_Editing value, $Res Function(_Editing) then) =
      __$EditingCopyWithImpl<$Res>;
  $Res call({EditingPost post, bool invalid});
}

/// @nodoc
class __$EditingCopyWithImpl<$Res> extends _$PostEditorStateCopyWithImpl<$Res>
    implements _$EditingCopyWith<$Res> {
  __$EditingCopyWithImpl(_Editing _value, $Res Function(_Editing) _then)
      : super(_value, (v) => _then(v as _Editing));

  @override
  _Editing get _value => super._value as _Editing;

  @override
  $Res call({
    Object? post = freezed,
    Object? invalid = freezed,
  }) {
    return _then(_Editing(
      post == freezed
          ? _value.post
          : post // ignore: cast_nullable_to_non_nullable
              as EditingPost,
      invalid == freezed
          ? _value.invalid
          : invalid // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_Editing implements _Editing {
  const _$_Editing(this.post, this.invalid);

  @override
  final EditingPost post;
  @override
  final bool invalid;

  @override
  String toString() {
    return 'PostEditorState.editing(post: $post, invalid: $invalid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Editing &&
            (identical(other.post, post) || other.post == post) &&
            (identical(other.invalid, invalid) || other.invalid == invalid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, post, invalid);

  @JsonKey(ignore: true)
  @override
  _$EditingCopyWith<_Editing> get copyWith =>
      __$EditingCopyWithImpl<_Editing>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(EditingPost post, bool invalid) editing,
    required TResult Function() submitting,
    required TResult Function() submitted,
    required TResult Function(String message) error,
  }) {
    return editing(post, invalid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(EditingPost post, bool invalid)? editing,
    TResult Function()? submitting,
    TResult Function()? submitted,
    TResult Function(String message)? error,
  }) {
    return editing?.call(post, invalid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(EditingPost post, bool invalid)? editing,
    TResult Function()? submitting,
    TResult Function()? submitted,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (editing != null) {
      return editing(post, invalid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Editing value) editing,
    required TResult Function(_Submitting value) submitting,
    required TResult Function(_Submitted value) submitted,
    required TResult Function(_Error value) error,
  }) {
    return editing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Editing value)? editing,
    TResult Function(_Submitting value)? submitting,
    TResult Function(_Submitted value)? submitted,
    TResult Function(_Error value)? error,
  }) {
    return editing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Editing value)? editing,
    TResult Function(_Submitting value)? submitting,
    TResult Function(_Submitted value)? submitted,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (editing != null) {
      return editing(this);
    }
    return orElse();
  }
}

abstract class _Editing implements PostEditorState {
  const factory _Editing(EditingPost post, bool invalid) = _$_Editing;

  EditingPost get post;
  bool get invalid;
  @JsonKey(ignore: true)
  _$EditingCopyWith<_Editing> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$SubmittingCopyWith<$Res> {
  factory _$SubmittingCopyWith(
          _Submitting value, $Res Function(_Submitting) then) =
      __$SubmittingCopyWithImpl<$Res>;
}

/// @nodoc
class __$SubmittingCopyWithImpl<$Res>
    extends _$PostEditorStateCopyWithImpl<$Res>
    implements _$SubmittingCopyWith<$Res> {
  __$SubmittingCopyWithImpl(
      _Submitting _value, $Res Function(_Submitting) _then)
      : super(_value, (v) => _then(v as _Submitting));

  @override
  _Submitting get _value => super._value as _Submitting;
}

/// @nodoc

class _$_Submitting implements _Submitting {
  const _$_Submitting();

  @override
  String toString() {
    return 'PostEditorState.submitting()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Submitting);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(EditingPost post, bool invalid) editing,
    required TResult Function() submitting,
    required TResult Function() submitted,
    required TResult Function(String message) error,
  }) {
    return submitting();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(EditingPost post, bool invalid)? editing,
    TResult Function()? submitting,
    TResult Function()? submitted,
    TResult Function(String message)? error,
  }) {
    return submitting?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(EditingPost post, bool invalid)? editing,
    TResult Function()? submitting,
    TResult Function()? submitted,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (submitting != null) {
      return submitting();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Editing value) editing,
    required TResult Function(_Submitting value) submitting,
    required TResult Function(_Submitted value) submitted,
    required TResult Function(_Error value) error,
  }) {
    return submitting(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Editing value)? editing,
    TResult Function(_Submitting value)? submitting,
    TResult Function(_Submitted value)? submitted,
    TResult Function(_Error value)? error,
  }) {
    return submitting?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Editing value)? editing,
    TResult Function(_Submitting value)? submitting,
    TResult Function(_Submitted value)? submitted,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (submitting != null) {
      return submitting(this);
    }
    return orElse();
  }
}

abstract class _Submitting implements PostEditorState {
  const factory _Submitting() = _$_Submitting;
}

/// @nodoc
abstract class _$SubmittedCopyWith<$Res> {
  factory _$SubmittedCopyWith(
          _Submitted value, $Res Function(_Submitted) then) =
      __$SubmittedCopyWithImpl<$Res>;
}

/// @nodoc
class __$SubmittedCopyWithImpl<$Res> extends _$PostEditorStateCopyWithImpl<$Res>
    implements _$SubmittedCopyWith<$Res> {
  __$SubmittedCopyWithImpl(_Submitted _value, $Res Function(_Submitted) _then)
      : super(_value, (v) => _then(v as _Submitted));

  @override
  _Submitted get _value => super._value as _Submitted;
}

/// @nodoc

class _$_Submitted implements _Submitted {
  const _$_Submitted();

  @override
  String toString() {
    return 'PostEditorState.submitted()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Submitted);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(EditingPost post, bool invalid) editing,
    required TResult Function() submitting,
    required TResult Function() submitted,
    required TResult Function(String message) error,
  }) {
    return submitted();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(EditingPost post, bool invalid)? editing,
    TResult Function()? submitting,
    TResult Function()? submitted,
    TResult Function(String message)? error,
  }) {
    return submitted?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(EditingPost post, bool invalid)? editing,
    TResult Function()? submitting,
    TResult Function()? submitted,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (submitted != null) {
      return submitted();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Editing value) editing,
    required TResult Function(_Submitting value) submitting,
    required TResult Function(_Submitted value) submitted,
    required TResult Function(_Error value) error,
  }) {
    return submitted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Editing value)? editing,
    TResult Function(_Submitting value)? submitting,
    TResult Function(_Submitted value)? submitted,
    TResult Function(_Error value)? error,
  }) {
    return submitted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Editing value)? editing,
    TResult Function(_Submitting value)? submitting,
    TResult Function(_Submitted value)? submitted,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (submitted != null) {
      return submitted(this);
    }
    return orElse();
  }
}

abstract class _Submitted implements PostEditorState {
  const factory _Submitted() = _$_Submitted;
}

/// @nodoc
abstract class _$ErrorCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) then) =
      __$ErrorCopyWithImpl<$Res>;
  $Res call({String message});
}

/// @nodoc
class __$ErrorCopyWithImpl<$Res> extends _$PostEditorStateCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(_Error _value, $Res Function(_Error) _then)
      : super(_value, (v) => _then(v as _Error));

  @override
  _Error get _value => super._value as _Error;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_Error(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Error implements _Error {
  const _$_Error(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'PostEditorState.error(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Error &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  _$ErrorCopyWith<_Error> get copyWith =>
      __$ErrorCopyWithImpl<_Error>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(EditingPost post, bool invalid) editing,
    required TResult Function() submitting,
    required TResult Function() submitted,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(EditingPost post, bool invalid)? editing,
    TResult Function()? submitting,
    TResult Function()? submitted,
    TResult Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(EditingPost post, bool invalid)? editing,
    TResult Function()? submitting,
    TResult Function()? submitted,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Editing value) editing,
    required TResult Function(_Submitting value) submitting,
    required TResult Function(_Submitted value) submitted,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Editing value)? editing,
    TResult Function(_Submitting value)? submitting,
    TResult Function(_Submitted value)? submitted,
    TResult Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Editing value)? editing,
    TResult Function(_Submitting value)? submitting,
    TResult Function(_Submitted value)? submitted,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements PostEditorState {
  const factory _Error(String message) = _$_Error;

  String get message;
  @JsonKey(ignore: true)
  _$ErrorCopyWith<_Error> get copyWith => throw _privateConstructorUsedError;
}
