// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'post_editor_cubit.dart';

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
    required TResult Function() loading,
    required TResult Function(
            EventEditorFields eventEditorFields, bool inputValid)
        editEvent,
    required TResult Function(
            GroupEditorFields groupEditorFields, bool inputValid)
        editGroup,
    required TResult Function() submitting,
    required TResult Function(String? postId) submitted,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(EventEditorFields eventEditorFields, bool inputValid)?
        editEvent,
    TResult Function(GroupEditorFields groupEditorFields, bool inputValid)?
        editGroup,
    TResult Function()? submitting,
    TResult Function(String? postId)? submitted,
    TResult Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(EventEditorFields eventEditorFields, bool inputValid)?
        editEvent,
    TResult Function(GroupEditorFields groupEditorFields, bool inputValid)?
        editGroup,
    TResult Function()? submitting,
    TResult Function(String? postId)? submitted,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_EditEvent value) editEvent,
    required TResult Function(_EditGroup value) editGroup,
    required TResult Function(_Submitting value) submitting,
    required TResult Function(_Success value) submitted,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_EditEvent value)? editEvent,
    TResult Function(_EditGroup value)? editGroup,
    TResult Function(_Submitting value)? submitting,
    TResult Function(_Success value)? submitted,
    TResult Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_EditEvent value)? editEvent,
    TResult Function(_EditGroup value)? editGroup,
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
abstract class _$$_LoadingCopyWith<$Res> {
  factory _$$_LoadingCopyWith(
          _$_Loading value, $Res Function(_$_Loading) then) =
      __$$_LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_LoadingCopyWithImpl<$Res> extends _$PostEditorStateCopyWithImpl<$Res>
    implements _$$_LoadingCopyWith<$Res> {
  __$$_LoadingCopyWithImpl(_$_Loading _value, $Res Function(_$_Loading) _then)
      : super(_value, (v) => _then(v as _$_Loading));

  @override
  _$_Loading get _value => super._value as _$_Loading;
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
        (other.runtimeType == runtimeType && other is _$_Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(
            EventEditorFields eventEditorFields, bool inputValid)
        editEvent,
    required TResult Function(
            GroupEditorFields groupEditorFields, bool inputValid)
        editGroup,
    required TResult Function() submitting,
    required TResult Function(String? postId) submitted,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(EventEditorFields eventEditorFields, bool inputValid)?
        editEvent,
    TResult Function(GroupEditorFields groupEditorFields, bool inputValid)?
        editGroup,
    TResult Function()? submitting,
    TResult Function(String? postId)? submitted,
    TResult Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(EventEditorFields eventEditorFields, bool inputValid)?
        editEvent,
    TResult Function(GroupEditorFields groupEditorFields, bool inputValid)?
        editGroup,
    TResult Function()? submitting,
    TResult Function(String? postId)? submitted,
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
    required TResult Function(_EditEvent value) editEvent,
    required TResult Function(_EditGroup value) editGroup,
    required TResult Function(_Submitting value) submitting,
    required TResult Function(_Success value) submitted,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_EditEvent value)? editEvent,
    TResult Function(_EditGroup value)? editGroup,
    TResult Function(_Submitting value)? submitting,
    TResult Function(_Success value)? submitted,
    TResult Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_EditEvent value)? editEvent,
    TResult Function(_EditGroup value)? editGroup,
    TResult Function(_Submitting value)? submitting,
    TResult Function(_Success value)? submitted,
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
abstract class _$$_EditEventCopyWith<$Res> {
  factory _$$_EditEventCopyWith(
          _$_EditEvent value, $Res Function(_$_EditEvent) then) =
      __$$_EditEventCopyWithImpl<$Res>;
  $Res call({EventEditorFields eventEditorFields, bool inputValid});
}

/// @nodoc
class __$$_EditEventCopyWithImpl<$Res>
    extends _$PostEditorStateCopyWithImpl<$Res>
    implements _$$_EditEventCopyWith<$Res> {
  __$$_EditEventCopyWithImpl(
      _$_EditEvent _value, $Res Function(_$_EditEvent) _then)
      : super(_value, (v) => _then(v as _$_EditEvent));

  @override
  _$_EditEvent get _value => super._value as _$_EditEvent;

  @override
  $Res call({
    Object? eventEditorFields = freezed,
    Object? inputValid = freezed,
  }) {
    return _then(_$_EditEvent(
      eventEditorFields: eventEditorFields == freezed
          ? _value.eventEditorFields
          : eventEditorFields // ignore: cast_nullable_to_non_nullable
              as EventEditorFields,
      inputValid: inputValid == freezed
          ? _value.inputValid
          : inputValid // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_EditEvent implements _EditEvent {
  const _$_EditEvent(
      {required this.eventEditorFields, this.inputValid = false});

  @override
  final EventEditorFields eventEditorFields;
  @override
  @JsonKey()
  final bool inputValid;

  @override
  String toString() {
    return 'PostEditorState.editEvent(eventEditorFields: $eventEditorFields, inputValid: $inputValid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EditEvent &&
            const DeepCollectionEquality()
                .equals(other.eventEditorFields, eventEditorFields) &&
            const DeepCollectionEquality()
                .equals(other.inputValid, inputValid));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(eventEditorFields),
      const DeepCollectionEquality().hash(inputValid));

  @JsonKey(ignore: true)
  @override
  _$$_EditEventCopyWith<_$_EditEvent> get copyWith =>
      __$$_EditEventCopyWithImpl<_$_EditEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(
            EventEditorFields eventEditorFields, bool inputValid)
        editEvent,
    required TResult Function(
            GroupEditorFields groupEditorFields, bool inputValid)
        editGroup,
    required TResult Function() submitting,
    required TResult Function(String? postId) submitted,
    required TResult Function(String message) error,
  }) {
    return editEvent(eventEditorFields, inputValid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(EventEditorFields eventEditorFields, bool inputValid)?
        editEvent,
    TResult Function(GroupEditorFields groupEditorFields, bool inputValid)?
        editGroup,
    TResult Function()? submitting,
    TResult Function(String? postId)? submitted,
    TResult Function(String message)? error,
  }) {
    return editEvent?.call(eventEditorFields, inputValid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(EventEditorFields eventEditorFields, bool inputValid)?
        editEvent,
    TResult Function(GroupEditorFields groupEditorFields, bool inputValid)?
        editGroup,
    TResult Function()? submitting,
    TResult Function(String? postId)? submitted,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (editEvent != null) {
      return editEvent(eventEditorFields, inputValid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_EditEvent value) editEvent,
    required TResult Function(_EditGroup value) editGroup,
    required TResult Function(_Submitting value) submitting,
    required TResult Function(_Success value) submitted,
    required TResult Function(_Error value) error,
  }) {
    return editEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_EditEvent value)? editEvent,
    TResult Function(_EditGroup value)? editGroup,
    TResult Function(_Submitting value)? submitting,
    TResult Function(_Success value)? submitted,
    TResult Function(_Error value)? error,
  }) {
    return editEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_EditEvent value)? editEvent,
    TResult Function(_EditGroup value)? editGroup,
    TResult Function(_Submitting value)? submitting,
    TResult Function(_Success value)? submitted,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (editEvent != null) {
      return editEvent(this);
    }
    return orElse();
  }
}

abstract class _EditEvent implements PostEditorState {
  const factory _EditEvent(
      {required final EventEditorFields eventEditorFields,
      final bool inputValid}) = _$_EditEvent;

  EventEditorFields get eventEditorFields;
  bool get inputValid;
  @JsonKey(ignore: true)
  _$$_EditEventCopyWith<_$_EditEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_EditGroupCopyWith<$Res> {
  factory _$$_EditGroupCopyWith(
          _$_EditGroup value, $Res Function(_$_EditGroup) then) =
      __$$_EditGroupCopyWithImpl<$Res>;
  $Res call({GroupEditorFields groupEditorFields, bool inputValid});
}

/// @nodoc
class __$$_EditGroupCopyWithImpl<$Res>
    extends _$PostEditorStateCopyWithImpl<$Res>
    implements _$$_EditGroupCopyWith<$Res> {
  __$$_EditGroupCopyWithImpl(
      _$_EditGroup _value, $Res Function(_$_EditGroup) _then)
      : super(_value, (v) => _then(v as _$_EditGroup));

  @override
  _$_EditGroup get _value => super._value as _$_EditGroup;

  @override
  $Res call({
    Object? groupEditorFields = freezed,
    Object? inputValid = freezed,
  }) {
    return _then(_$_EditGroup(
      groupEditorFields: groupEditorFields == freezed
          ? _value.groupEditorFields
          : groupEditorFields // ignore: cast_nullable_to_non_nullable
              as GroupEditorFields,
      inputValid: inputValid == freezed
          ? _value.inputValid
          : inputValid // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_EditGroup implements _EditGroup {
  const _$_EditGroup(
      {required this.groupEditorFields, this.inputValid = false});

  @override
  final GroupEditorFields groupEditorFields;
  @override
  @JsonKey()
  final bool inputValid;

  @override
  String toString() {
    return 'PostEditorState.editGroup(groupEditorFields: $groupEditorFields, inputValid: $inputValid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EditGroup &&
            const DeepCollectionEquality()
                .equals(other.groupEditorFields, groupEditorFields) &&
            const DeepCollectionEquality()
                .equals(other.inputValid, inputValid));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(groupEditorFields),
      const DeepCollectionEquality().hash(inputValid));

  @JsonKey(ignore: true)
  @override
  _$$_EditGroupCopyWith<_$_EditGroup> get copyWith =>
      __$$_EditGroupCopyWithImpl<_$_EditGroup>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(
            EventEditorFields eventEditorFields, bool inputValid)
        editEvent,
    required TResult Function(
            GroupEditorFields groupEditorFields, bool inputValid)
        editGroup,
    required TResult Function() submitting,
    required TResult Function(String? postId) submitted,
    required TResult Function(String message) error,
  }) {
    return editGroup(groupEditorFields, inputValid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(EventEditorFields eventEditorFields, bool inputValid)?
        editEvent,
    TResult Function(GroupEditorFields groupEditorFields, bool inputValid)?
        editGroup,
    TResult Function()? submitting,
    TResult Function(String? postId)? submitted,
    TResult Function(String message)? error,
  }) {
    return editGroup?.call(groupEditorFields, inputValid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(EventEditorFields eventEditorFields, bool inputValid)?
        editEvent,
    TResult Function(GroupEditorFields groupEditorFields, bool inputValid)?
        editGroup,
    TResult Function()? submitting,
    TResult Function(String? postId)? submitted,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (editGroup != null) {
      return editGroup(groupEditorFields, inputValid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_EditEvent value) editEvent,
    required TResult Function(_EditGroup value) editGroup,
    required TResult Function(_Submitting value) submitting,
    required TResult Function(_Success value) submitted,
    required TResult Function(_Error value) error,
  }) {
    return editGroup(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_EditEvent value)? editEvent,
    TResult Function(_EditGroup value)? editGroup,
    TResult Function(_Submitting value)? submitting,
    TResult Function(_Success value)? submitted,
    TResult Function(_Error value)? error,
  }) {
    return editGroup?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_EditEvent value)? editEvent,
    TResult Function(_EditGroup value)? editGroup,
    TResult Function(_Submitting value)? submitting,
    TResult Function(_Success value)? submitted,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (editGroup != null) {
      return editGroup(this);
    }
    return orElse();
  }
}

abstract class _EditGroup implements PostEditorState {
  const factory _EditGroup(
      {required final GroupEditorFields groupEditorFields,
      final bool inputValid}) = _$_EditGroup;

  GroupEditorFields get groupEditorFields;
  bool get inputValid;
  @JsonKey(ignore: true)
  _$$_EditGroupCopyWith<_$_EditGroup> get copyWith =>
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
    required TResult Function() loading,
    required TResult Function(
            EventEditorFields eventEditorFields, bool inputValid)
        editEvent,
    required TResult Function(
            GroupEditorFields groupEditorFields, bool inputValid)
        editGroup,
    required TResult Function() submitting,
    required TResult Function(String? postId) submitted,
    required TResult Function(String message) error,
  }) {
    return submitting();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(EventEditorFields eventEditorFields, bool inputValid)?
        editEvent,
    TResult Function(GroupEditorFields groupEditorFields, bool inputValid)?
        editGroup,
    TResult Function()? submitting,
    TResult Function(String? postId)? submitted,
    TResult Function(String message)? error,
  }) {
    return submitting?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(EventEditorFields eventEditorFields, bool inputValid)?
        editEvent,
    TResult Function(GroupEditorFields groupEditorFields, bool inputValid)?
        editGroup,
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
    required TResult Function(_Loading value) loading,
    required TResult Function(_EditEvent value) editEvent,
    required TResult Function(_EditGroup value) editGroup,
    required TResult Function(_Submitting value) submitting,
    required TResult Function(_Success value) submitted,
    required TResult Function(_Error value) error,
  }) {
    return submitting(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_EditEvent value)? editEvent,
    TResult Function(_EditGroup value)? editGroup,
    TResult Function(_Submitting value)? submitting,
    TResult Function(_Success value)? submitted,
    TResult Function(_Error value)? error,
  }) {
    return submitting?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_EditEvent value)? editEvent,
    TResult Function(_EditGroup value)? editGroup,
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
    required TResult Function() loading,
    required TResult Function(
            EventEditorFields eventEditorFields, bool inputValid)
        editEvent,
    required TResult Function(
            GroupEditorFields groupEditorFields, bool inputValid)
        editGroup,
    required TResult Function() submitting,
    required TResult Function(String? postId) submitted,
    required TResult Function(String message) error,
  }) {
    return submitted(postId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(EventEditorFields eventEditorFields, bool inputValid)?
        editEvent,
    TResult Function(GroupEditorFields groupEditorFields, bool inputValid)?
        editGroup,
    TResult Function()? submitting,
    TResult Function(String? postId)? submitted,
    TResult Function(String message)? error,
  }) {
    return submitted?.call(postId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(EventEditorFields eventEditorFields, bool inputValid)?
        editEvent,
    TResult Function(GroupEditorFields groupEditorFields, bool inputValid)?
        editGroup,
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
    required TResult Function(_Loading value) loading,
    required TResult Function(_EditEvent value) editEvent,
    required TResult Function(_EditGroup value) editGroup,
    required TResult Function(_Submitting value) submitting,
    required TResult Function(_Success value) submitted,
    required TResult Function(_Error value) error,
  }) {
    return submitted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_EditEvent value)? editEvent,
    TResult Function(_EditGroup value)? editGroup,
    TResult Function(_Submitting value)? submitting,
    TResult Function(_Success value)? submitted,
    TResult Function(_Error value)? error,
  }) {
    return submitted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_EditEvent value)? editEvent,
    TResult Function(_EditGroup value)? editGroup,
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
    required TResult Function() loading,
    required TResult Function(
            EventEditorFields eventEditorFields, bool inputValid)
        editEvent,
    required TResult Function(
            GroupEditorFields groupEditorFields, bool inputValid)
        editGroup,
    required TResult Function() submitting,
    required TResult Function(String? postId) submitted,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(EventEditorFields eventEditorFields, bool inputValid)?
        editEvent,
    TResult Function(GroupEditorFields groupEditorFields, bool inputValid)?
        editGroup,
    TResult Function()? submitting,
    TResult Function(String? postId)? submitted,
    TResult Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(EventEditorFields eventEditorFields, bool inputValid)?
        editEvent,
    TResult Function(GroupEditorFields groupEditorFields, bool inputValid)?
        editGroup,
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
    required TResult Function(_Loading value) loading,
    required TResult Function(_EditEvent value) editEvent,
    required TResult Function(_EditGroup value) editGroup,
    required TResult Function(_Submitting value) submitting,
    required TResult Function(_Success value) submitted,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_EditEvent value)? editEvent,
    TResult Function(_EditGroup value)? editGroup,
    TResult Function(_Submitting value)? submitting,
    TResult Function(_Success value)? submitted,
    TResult Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_EditEvent value)? editEvent,
    TResult Function(_EditGroup value)? editGroup,
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
