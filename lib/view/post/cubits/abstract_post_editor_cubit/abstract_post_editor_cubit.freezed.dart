// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'abstract_post_editor_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PostEditorState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PostUpdateTracker updateTracker, bool valid)
        editing,
    required TResult Function() submitting,
    required TResult Function(String? postId) submitted,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(PostUpdateTracker updateTracker, bool valid)? editing,
    TResult Function()? submitting,
    TResult Function(String? postId)? submitted,
    TResult Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PostUpdateTracker updateTracker, bool valid)? editing,
    TResult Function()? submitting,
    TResult Function(String? postId)? submitted,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Editing value) editing,
    required TResult Function(_Submitting value) submitting,
    required TResult Function(_Success value) submitted,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Editing value)? editing,
    TResult Function(_Submitting value)? submitting,
    TResult Function(_Success value)? submitted,
    TResult Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Editing value)? editing,
    TResult Function(_Submitting value)? submitting,
    TResult Function(_Success value)? submitted,
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
abstract class _$$_EditingCopyWith<$Res> {
  factory _$$_EditingCopyWith(
          _$_Editing value, $Res Function(_$_Editing) then) =
      __$$_EditingCopyWithImpl<$Res>;
  $Res call({PostUpdateTracker updateTracker, bool valid});
}

/// @nodoc
class __$$_EditingCopyWithImpl<$Res> extends _$PostEditorStateCopyWithImpl<$Res>
    implements _$$_EditingCopyWith<$Res> {
  __$$_EditingCopyWithImpl(_$_Editing _value, $Res Function(_$_Editing) _then)
      : super(_value, (v) => _then(v as _$_Editing));

  @override
  _$_Editing get _value => super._value as _$_Editing;

  @override
  $Res call({
    Object? updateTracker = freezed,
    Object? valid = freezed,
  }) {
    return _then(_$_Editing(
      updateTracker == freezed
          ? _value.updateTracker
          : updateTracker // ignore: cast_nullable_to_non_nullable
              as PostUpdateTracker,
      valid == freezed
          ? _value.valid
          : valid // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_Editing implements _Editing {
  const _$_Editing(this.updateTracker, this.valid);

  @override
  final PostUpdateTracker updateTracker;
  @override
  final bool valid;

  @override
  String toString() {
    return 'PostEditorState.editing(updateTracker: $updateTracker, valid: $valid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Editing &&
            const DeepCollectionEquality()
                .equals(other.updateTracker, updateTracker) &&
            const DeepCollectionEquality().equals(other.valid, valid));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(updateTracker),
      const DeepCollectionEquality().hash(valid));

  @JsonKey(ignore: true)
  @override
  _$$_EditingCopyWith<_$_Editing> get copyWith =>
      __$$_EditingCopyWithImpl<_$_Editing>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PostUpdateTracker updateTracker, bool valid)
        editing,
    required TResult Function() submitting,
    required TResult Function(String? postId) submitted,
    required TResult Function(String message) error,
  }) {
    return editing(updateTracker, valid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(PostUpdateTracker updateTracker, bool valid)? editing,
    TResult Function()? submitting,
    TResult Function(String? postId)? submitted,
    TResult Function(String message)? error,
  }) {
    return editing?.call(updateTracker, valid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PostUpdateTracker updateTracker, bool valid)? editing,
    TResult Function()? submitting,
    TResult Function(String? postId)? submitted,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (editing != null) {
      return editing(updateTracker, valid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Editing value) editing,
    required TResult Function(_Submitting value) submitting,
    required TResult Function(_Success value) submitted,
    required TResult Function(_Error value) error,
  }) {
    return editing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Editing value)? editing,
    TResult Function(_Submitting value)? submitting,
    TResult Function(_Success value)? submitted,
    TResult Function(_Error value)? error,
  }) {
    return editing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Editing value)? editing,
    TResult Function(_Submitting value)? submitting,
    TResult Function(_Success value)? submitted,
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
  const factory _Editing(
      final PostUpdateTracker updateTracker, final bool valid) = _$_Editing;

  PostUpdateTracker get updateTracker;
  bool get valid;
  @JsonKey(ignore: true)
  _$$_EditingCopyWith<_$_Editing> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SubmittingCopyWith<$Res> {
  factory _$$_SubmittingCopyWith(
          _$_Submitting value, $Res Function(_$_Submitting) then) =
      __$$_SubmittingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_SubmittingCopyWithImpl<$Res>
    extends _$PostEditorStateCopyWithImpl<$Res>
    implements _$$_SubmittingCopyWith<$Res> {
  __$$_SubmittingCopyWithImpl(
      _$_Submitting _value, $Res Function(_$_Submitting) _then)
      : super(_value, (v) => _then(v as _$_Submitting));

  @override
  _$_Submitting get _value => super._value as _$_Submitting;
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
        (other.runtimeType == runtimeType && other is _$_Submitting);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PostUpdateTracker updateTracker, bool valid)
        editing,
    required TResult Function() submitting,
    required TResult Function(String? postId) submitted,
    required TResult Function(String message) error,
  }) {
    return submitting();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(PostUpdateTracker updateTracker, bool valid)? editing,
    TResult Function()? submitting,
    TResult Function(String? postId)? submitted,
    TResult Function(String message)? error,
  }) {
    return submitting?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PostUpdateTracker updateTracker, bool valid)? editing,
    TResult Function()? submitting,
    TResult Function(String? postId)? submitted,
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
    required TResult Function(_Editing value) editing,
    required TResult Function(_Submitting value) submitting,
    required TResult Function(_Success value) submitted,
    required TResult Function(_Error value) error,
  }) {
    return submitting(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Editing value)? editing,
    TResult Function(_Submitting value)? submitting,
    TResult Function(_Success value)? submitted,
    TResult Function(_Error value)? error,
  }) {
    return submitting?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Editing value)? editing,
    TResult Function(_Submitting value)? submitting,
    TResult Function(_Success value)? submitted,
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
abstract class _$$_SuccessCopyWith<$Res> {
  factory _$$_SuccessCopyWith(
          _$_Success value, $Res Function(_$_Success) then) =
      __$$_SuccessCopyWithImpl<$Res>;
  $Res call({String? postId});
}

/// @nodoc
class __$$_SuccessCopyWithImpl<$Res> extends _$PostEditorStateCopyWithImpl<$Res>
    implements _$$_SuccessCopyWith<$Res> {
  __$$_SuccessCopyWithImpl(_$_Success _value, $Res Function(_$_Success) _then)
      : super(_value, (v) => _then(v as _$_Success));

  @override
  _$_Success get _value => super._value as _$_Success;

  @override
  $Res call({
    Object? postId = freezed,
  }) {
    return _then(_$_Success(
      postId == freezed
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_Success implements _Success {
  const _$_Success(this.postId);

  @override
  final String? postId;

  @override
  String toString() {
    return 'PostEditorState.submitted(postId: $postId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Success &&
            const DeepCollectionEquality().equals(other.postId, postId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(postId));

  @JsonKey(ignore: true)
  @override
  _$$_SuccessCopyWith<_$_Success> get copyWith =>
      __$$_SuccessCopyWithImpl<_$_Success>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PostUpdateTracker updateTracker, bool valid)
        editing,
    required TResult Function() submitting,
    required TResult Function(String? postId) submitted,
    required TResult Function(String message) error,
  }) {
    return submitted(postId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(PostUpdateTracker updateTracker, bool valid)? editing,
    TResult Function()? submitting,
    TResult Function(String? postId)? submitted,
    TResult Function(String message)? error,
  }) {
    return submitted?.call(postId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PostUpdateTracker updateTracker, bool valid)? editing,
    TResult Function()? submitting,
    TResult Function(String? postId)? submitted,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (submitted != null) {
      return submitted(postId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Editing value) editing,
    required TResult Function(_Submitting value) submitting,
    required TResult Function(_Success value) submitted,
    required TResult Function(_Error value) error,
  }) {
    return submitted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Editing value)? editing,
    TResult Function(_Submitting value)? submitting,
    TResult Function(_Success value)? submitted,
    TResult Function(_Error value)? error,
  }) {
    return submitted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Editing value)? editing,
    TResult Function(_Submitting value)? submitting,
    TResult Function(_Success value)? submitted,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (submitted != null) {
      return submitted(this);
    }
    return orElse();
  }
}

abstract class _Success implements PostEditorState {
  const factory _Success(final String? postId) = _$_Success;

  String? get postId;
  @JsonKey(ignore: true)
  _$$_SuccessCopyWith<_$_Success> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ErrorCopyWith<$Res> {
  factory _$$_ErrorCopyWith(_$_Error value, $Res Function(_$_Error) then) =
      __$$_ErrorCopyWithImpl<$Res>;
  $Res call({String message});
}

/// @nodoc
class __$$_ErrorCopyWithImpl<$Res> extends _$PostEditorStateCopyWithImpl<$Res>
    implements _$$_ErrorCopyWith<$Res> {
  __$$_ErrorCopyWithImpl(_$_Error _value, $Res Function(_$_Error) _then)
      : super(_value, (v) => _then(v as _$_Error));

  @override
  _$_Error get _value => super._value as _$_Error;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$_Error(
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
            other is _$_Error &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  _$$_ErrorCopyWith<_$_Error> get copyWith =>
      __$$_ErrorCopyWithImpl<_$_Error>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PostUpdateTracker updateTracker, bool valid)
        editing,
    required TResult Function() submitting,
    required TResult Function(String? postId) submitted,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(PostUpdateTracker updateTracker, bool valid)? editing,
    TResult Function()? submitting,
    TResult Function(String? postId)? submitted,
    TResult Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PostUpdateTracker updateTracker, bool valid)? editing,
    TResult Function()? submitting,
    TResult Function(String? postId)? submitted,
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
    required TResult Function(_Editing value) editing,
    required TResult Function(_Submitting value) submitting,
    required TResult Function(_Success value) submitted,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Editing value)? editing,
    TResult Function(_Submitting value)? submitting,
    TResult Function(_Success value)? submitted,
    TResult Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Editing value)? editing,
    TResult Function(_Submitting value)? submitting,
    TResult Function(_Success value)? submitted,
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
  const factory _Error(final String message) = _$_Error;

  String get message;
  @JsonKey(ignore: true)
  _$$_ErrorCopyWith<_$_Error> get copyWith =>
      throw _privateConstructorUsedError;
}
