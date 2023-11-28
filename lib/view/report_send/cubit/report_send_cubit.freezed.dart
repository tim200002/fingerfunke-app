// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'report_send_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ReportSendState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserGeneratedDocument doc, ReportType type,
            List<ReportReason> reasons)
        editing,
    required TResult Function() sending,
    required TResult Function() sent,
    required TResult Function(dynamic e) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UserGeneratedDocument doc, ReportType type,
            List<ReportReason> reasons)?
        editing,
    TResult? Function()? sending,
    TResult? Function()? sent,
    TResult? Function(dynamic e)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserGeneratedDocument doc, ReportType type,
            List<ReportReason> reasons)?
        editing,
    TResult Function()? sending,
    TResult Function()? sent,
    TResult Function(dynamic e)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Editing value) editing,
    required TResult Function(_Sending value) sending,
    required TResult Function(_Sent value) sent,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Editing value)? editing,
    TResult? Function(_Sending value)? sending,
    TResult? Function(_Sent value)? sent,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Editing value)? editing,
    TResult Function(_Sending value)? sending,
    TResult Function(_Sent value)? sent,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportSendStateCopyWith<$Res> {
  factory $ReportSendStateCopyWith(
          ReportSendState value, $Res Function(ReportSendState) then) =
      _$ReportSendStateCopyWithImpl<$Res, ReportSendState>;
}

/// @nodoc
class _$ReportSendStateCopyWithImpl<$Res, $Val extends ReportSendState>
    implements $ReportSendStateCopyWith<$Res> {
  _$ReportSendStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_EditingCopyWith<$Res> {
  factory _$$_EditingCopyWith(
          _$_Editing value, $Res Function(_$_Editing) then) =
      __$$_EditingCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {UserGeneratedDocument doc, ReportType type, List<ReportReason> reasons});
}

/// @nodoc
class __$$_EditingCopyWithImpl<$Res>
    extends _$ReportSendStateCopyWithImpl<$Res, _$_Editing>
    implements _$$_EditingCopyWith<$Res> {
  __$$_EditingCopyWithImpl(_$_Editing _value, $Res Function(_$_Editing) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? doc = null,
    Object? type = null,
    Object? reasons = null,
  }) {
    return _then(_$_Editing(
      null == doc
          ? _value.doc
          : doc // ignore: cast_nullable_to_non_nullable
              as UserGeneratedDocument,
      null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ReportType,
      null == reasons
          ? _value._reasons
          : reasons // ignore: cast_nullable_to_non_nullable
              as List<ReportReason>,
    ));
  }
}

/// @nodoc

class _$_Editing implements _Editing {
  const _$_Editing(this.doc, this.type, final List<ReportReason> reasons)
      : _reasons = reasons;

  @override
  final UserGeneratedDocument doc;
  @override
  final ReportType type;
  final List<ReportReason> _reasons;
  @override
  List<ReportReason> get reasons {
    if (_reasons is EqualUnmodifiableListView) return _reasons;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_reasons);
  }

  @override
  String toString() {
    return 'ReportSendState.editing(doc: $doc, type: $type, reasons: $reasons)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Editing &&
            (identical(other.doc, doc) || other.doc == doc) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other._reasons, _reasons));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, doc, type, const DeepCollectionEquality().hash(_reasons));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EditingCopyWith<_$_Editing> get copyWith =>
      __$$_EditingCopyWithImpl<_$_Editing>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserGeneratedDocument doc, ReportType type,
            List<ReportReason> reasons)
        editing,
    required TResult Function() sending,
    required TResult Function() sent,
    required TResult Function(dynamic e) error,
  }) {
    return editing(doc, type, reasons);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UserGeneratedDocument doc, ReportType type,
            List<ReportReason> reasons)?
        editing,
    TResult? Function()? sending,
    TResult? Function()? sent,
    TResult? Function(dynamic e)? error,
  }) {
    return editing?.call(doc, type, reasons);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserGeneratedDocument doc, ReportType type,
            List<ReportReason> reasons)?
        editing,
    TResult Function()? sending,
    TResult Function()? sent,
    TResult Function(dynamic e)? error,
    required TResult orElse(),
  }) {
    if (editing != null) {
      return editing(doc, type, reasons);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Editing value) editing,
    required TResult Function(_Sending value) sending,
    required TResult Function(_Sent value) sent,
    required TResult Function(_Error value) error,
  }) {
    return editing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Editing value)? editing,
    TResult? Function(_Sending value)? sending,
    TResult? Function(_Sent value)? sent,
    TResult? Function(_Error value)? error,
  }) {
    return editing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Editing value)? editing,
    TResult Function(_Sending value)? sending,
    TResult Function(_Sent value)? sent,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (editing != null) {
      return editing(this);
    }
    return orElse();
  }
}

abstract class _Editing implements ReportSendState {
  const factory _Editing(final UserGeneratedDocument doc, final ReportType type,
      final List<ReportReason> reasons) = _$_Editing;

  UserGeneratedDocument get doc;
  ReportType get type;
  List<ReportReason> get reasons;
  @JsonKey(ignore: true)
  _$$_EditingCopyWith<_$_Editing> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SendingCopyWith<$Res> {
  factory _$$_SendingCopyWith(
          _$_Sending value, $Res Function(_$_Sending) then) =
      __$$_SendingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_SendingCopyWithImpl<$Res>
    extends _$ReportSendStateCopyWithImpl<$Res, _$_Sending>
    implements _$$_SendingCopyWith<$Res> {
  __$$_SendingCopyWithImpl(_$_Sending _value, $Res Function(_$_Sending) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Sending implements _Sending {
  const _$_Sending();

  @override
  String toString() {
    return 'ReportSendState.sending()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Sending);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserGeneratedDocument doc, ReportType type,
            List<ReportReason> reasons)
        editing,
    required TResult Function() sending,
    required TResult Function() sent,
    required TResult Function(dynamic e) error,
  }) {
    return sending();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UserGeneratedDocument doc, ReportType type,
            List<ReportReason> reasons)?
        editing,
    TResult? Function()? sending,
    TResult? Function()? sent,
    TResult? Function(dynamic e)? error,
  }) {
    return sending?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserGeneratedDocument doc, ReportType type,
            List<ReportReason> reasons)?
        editing,
    TResult Function()? sending,
    TResult Function()? sent,
    TResult Function(dynamic e)? error,
    required TResult orElse(),
  }) {
    if (sending != null) {
      return sending();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Editing value) editing,
    required TResult Function(_Sending value) sending,
    required TResult Function(_Sent value) sent,
    required TResult Function(_Error value) error,
  }) {
    return sending(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Editing value)? editing,
    TResult? Function(_Sending value)? sending,
    TResult? Function(_Sent value)? sent,
    TResult? Function(_Error value)? error,
  }) {
    return sending?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Editing value)? editing,
    TResult Function(_Sending value)? sending,
    TResult Function(_Sent value)? sent,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (sending != null) {
      return sending(this);
    }
    return orElse();
  }
}

abstract class _Sending implements ReportSendState {
  const factory _Sending() = _$_Sending;
}

/// @nodoc
abstract class _$$_SentCopyWith<$Res> {
  factory _$$_SentCopyWith(_$_Sent value, $Res Function(_$_Sent) then) =
      __$$_SentCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_SentCopyWithImpl<$Res>
    extends _$ReportSendStateCopyWithImpl<$Res, _$_Sent>
    implements _$$_SentCopyWith<$Res> {
  __$$_SentCopyWithImpl(_$_Sent _value, $Res Function(_$_Sent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Sent implements _Sent {
  const _$_Sent();

  @override
  String toString() {
    return 'ReportSendState.sent()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Sent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserGeneratedDocument doc, ReportType type,
            List<ReportReason> reasons)
        editing,
    required TResult Function() sending,
    required TResult Function() sent,
    required TResult Function(dynamic e) error,
  }) {
    return sent();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UserGeneratedDocument doc, ReportType type,
            List<ReportReason> reasons)?
        editing,
    TResult? Function()? sending,
    TResult? Function()? sent,
    TResult? Function(dynamic e)? error,
  }) {
    return sent?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserGeneratedDocument doc, ReportType type,
            List<ReportReason> reasons)?
        editing,
    TResult Function()? sending,
    TResult Function()? sent,
    TResult Function(dynamic e)? error,
    required TResult orElse(),
  }) {
    if (sent != null) {
      return sent();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Editing value) editing,
    required TResult Function(_Sending value) sending,
    required TResult Function(_Sent value) sent,
    required TResult Function(_Error value) error,
  }) {
    return sent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Editing value)? editing,
    TResult? Function(_Sending value)? sending,
    TResult? Function(_Sent value)? sent,
    TResult? Function(_Error value)? error,
  }) {
    return sent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Editing value)? editing,
    TResult Function(_Sending value)? sending,
    TResult Function(_Sent value)? sent,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (sent != null) {
      return sent(this);
    }
    return orElse();
  }
}

abstract class _Sent implements ReportSendState {
  const factory _Sent() = _$_Sent;
}

/// @nodoc
abstract class _$$_ErrorCopyWith<$Res> {
  factory _$$_ErrorCopyWith(_$_Error value, $Res Function(_$_Error) then) =
      __$$_ErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({dynamic e});
}

/// @nodoc
class __$$_ErrorCopyWithImpl<$Res>
    extends _$ReportSendStateCopyWithImpl<$Res, _$_Error>
    implements _$$_ErrorCopyWith<$Res> {
  __$$_ErrorCopyWithImpl(_$_Error _value, $Res Function(_$_Error) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? e = freezed,
  }) {
    return _then(_$_Error(
      freezed == e
          ? _value.e
          : e // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

class _$_Error implements _Error {
  const _$_Error(this.e);

  @override
  final dynamic e;

  @override
  String toString() {
    return 'ReportSendState.error(e: $e)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Error &&
            const DeepCollectionEquality().equals(other.e, e));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(e));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ErrorCopyWith<_$_Error> get copyWith =>
      __$$_ErrorCopyWithImpl<_$_Error>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserGeneratedDocument doc, ReportType type,
            List<ReportReason> reasons)
        editing,
    required TResult Function() sending,
    required TResult Function() sent,
    required TResult Function(dynamic e) error,
  }) {
    return error(e);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UserGeneratedDocument doc, ReportType type,
            List<ReportReason> reasons)?
        editing,
    TResult? Function()? sending,
    TResult? Function()? sent,
    TResult? Function(dynamic e)? error,
  }) {
    return error?.call(e);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserGeneratedDocument doc, ReportType type,
            List<ReportReason> reasons)?
        editing,
    TResult Function()? sending,
    TResult Function()? sent,
    TResult Function(dynamic e)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(e);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Editing value) editing,
    required TResult Function(_Sending value) sending,
    required TResult Function(_Sent value) sent,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Editing value)? editing,
    TResult? Function(_Sending value)? sending,
    TResult? Function(_Sent value)? sent,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Editing value)? editing,
    TResult Function(_Sending value)? sending,
    TResult Function(_Sent value)? sent,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements ReportSendState {
  const factory _Error(final dynamic e) = _$_Error;

  dynamic get e;
  @JsonKey(ignore: true)
  _$$_ErrorCopyWith<_$_Error> get copyWith =>
      throw _privateConstructorUsedError;
}
