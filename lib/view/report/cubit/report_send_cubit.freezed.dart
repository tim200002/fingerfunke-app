// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'report_send_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ReportSendStateTearOff {
  const _$ReportSendStateTearOff();

  _Editing editing(
      UserGeneratedDocument doc, ReportType type, List<ReportReason> reasons) {
    return _Editing(
      doc,
      type,
      reasons,
    );
  }

  _Sending sending() {
    return const _Sending();
  }

  _Sent sent() {
    return const _Sent();
  }

  _Error error(dynamic e) {
    return _Error(
      e,
    );
  }
}

/// @nodoc
const $ReportSendState = _$ReportSendStateTearOff();

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
    TResult Function(UserGeneratedDocument doc, ReportType type,
            List<ReportReason> reasons)?
        editing,
    TResult Function()? sending,
    TResult Function()? sent,
    TResult Function(dynamic e)? error,
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
    TResult Function(_Editing value)? editing,
    TResult Function(_Sending value)? sending,
    TResult Function(_Sent value)? sent,
    TResult Function(_Error value)? error,
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
      _$ReportSendStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$ReportSendStateCopyWithImpl<$Res>
    implements $ReportSendStateCopyWith<$Res> {
  _$ReportSendStateCopyWithImpl(this._value, this._then);

  final ReportSendState _value;
  // ignore: unused_field
  final $Res Function(ReportSendState) _then;
}

/// @nodoc
abstract class _$EditingCopyWith<$Res> {
  factory _$EditingCopyWith(_Editing value, $Res Function(_Editing) then) =
      __$EditingCopyWithImpl<$Res>;
  $Res call(
      {UserGeneratedDocument doc, ReportType type, List<ReportReason> reasons});
}

/// @nodoc
class __$EditingCopyWithImpl<$Res> extends _$ReportSendStateCopyWithImpl<$Res>
    implements _$EditingCopyWith<$Res> {
  __$EditingCopyWithImpl(_Editing _value, $Res Function(_Editing) _then)
      : super(_value, (v) => _then(v as _Editing));

  @override
  _Editing get _value => super._value as _Editing;

  @override
  $Res call({
    Object? doc = freezed,
    Object? type = freezed,
    Object? reasons = freezed,
  }) {
    return _then(_Editing(
      doc == freezed
          ? _value.doc
          : doc // ignore: cast_nullable_to_non_nullable
              as UserGeneratedDocument,
      type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ReportType,
      reasons == freezed
          ? _value.reasons
          : reasons // ignore: cast_nullable_to_non_nullable
              as List<ReportReason>,
    ));
  }
}

/// @nodoc

class _$_Editing implements _Editing {
  const _$_Editing(this.doc, this.type, this.reasons);

  @override
  final UserGeneratedDocument doc;
  @override
  final ReportType type;
  @override
  final List<ReportReason> reasons;

  @override
  String toString() {
    return 'ReportSendState.editing(doc: $doc, type: $type, reasons: $reasons)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Editing &&
            (identical(other.doc, doc) || other.doc == doc) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other.reasons, reasons));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, doc, type, const DeepCollectionEquality().hash(reasons));

  @JsonKey(ignore: true)
  @override
  _$EditingCopyWith<_Editing> get copyWith =>
      __$EditingCopyWithImpl<_Editing>(this, _$identity);

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
    TResult Function(UserGeneratedDocument doc, ReportType type,
            List<ReportReason> reasons)?
        editing,
    TResult Function()? sending,
    TResult Function()? sent,
    TResult Function(dynamic e)? error,
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
    TResult Function(_Editing value)? editing,
    TResult Function(_Sending value)? sending,
    TResult Function(_Sent value)? sent,
    TResult Function(_Error value)? error,
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
  const factory _Editing(UserGeneratedDocument doc, ReportType type,
      List<ReportReason> reasons) = _$_Editing;

  UserGeneratedDocument get doc;
  ReportType get type;
  List<ReportReason> get reasons;
  @JsonKey(ignore: true)
  _$EditingCopyWith<_Editing> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$SendingCopyWith<$Res> {
  factory _$SendingCopyWith(_Sending value, $Res Function(_Sending) then) =
      __$SendingCopyWithImpl<$Res>;
}

/// @nodoc
class __$SendingCopyWithImpl<$Res> extends _$ReportSendStateCopyWithImpl<$Res>
    implements _$SendingCopyWith<$Res> {
  __$SendingCopyWithImpl(_Sending _value, $Res Function(_Sending) _then)
      : super(_value, (v) => _then(v as _Sending));

  @override
  _Sending get _value => super._value as _Sending;
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
        (other.runtimeType == runtimeType && other is _Sending);
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
    TResult Function(UserGeneratedDocument doc, ReportType type,
            List<ReportReason> reasons)?
        editing,
    TResult Function()? sending,
    TResult Function()? sent,
    TResult Function(dynamic e)? error,
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
    TResult Function(_Editing value)? editing,
    TResult Function(_Sending value)? sending,
    TResult Function(_Sent value)? sent,
    TResult Function(_Error value)? error,
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
abstract class _$SentCopyWith<$Res> {
  factory _$SentCopyWith(_Sent value, $Res Function(_Sent) then) =
      __$SentCopyWithImpl<$Res>;
}

/// @nodoc
class __$SentCopyWithImpl<$Res> extends _$ReportSendStateCopyWithImpl<$Res>
    implements _$SentCopyWith<$Res> {
  __$SentCopyWithImpl(_Sent _value, $Res Function(_Sent) _then)
      : super(_value, (v) => _then(v as _Sent));

  @override
  _Sent get _value => super._value as _Sent;
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
        (other.runtimeType == runtimeType && other is _Sent);
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
    TResult Function(UserGeneratedDocument doc, ReportType type,
            List<ReportReason> reasons)?
        editing,
    TResult Function()? sending,
    TResult Function()? sent,
    TResult Function(dynamic e)? error,
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
    TResult Function(_Editing value)? editing,
    TResult Function(_Sending value)? sending,
    TResult Function(_Sent value)? sent,
    TResult Function(_Error value)? error,
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
abstract class _$ErrorCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) then) =
      __$ErrorCopyWithImpl<$Res>;
  $Res call({dynamic e});
}

/// @nodoc
class __$ErrorCopyWithImpl<$Res> extends _$ReportSendStateCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(_Error _value, $Res Function(_Error) _then)
      : super(_value, (v) => _then(v as _Error));

  @override
  _Error get _value => super._value as _Error;

  @override
  $Res call({
    Object? e = freezed,
  }) {
    return _then(_Error(
      e == freezed
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
            other is _Error &&
            const DeepCollectionEquality().equals(other.e, e));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(e));

  @JsonKey(ignore: true)
  @override
  _$ErrorCopyWith<_Error> get copyWith =>
      __$ErrorCopyWithImpl<_Error>(this, _$identity);

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
    TResult Function(UserGeneratedDocument doc, ReportType type,
            List<ReportReason> reasons)?
        editing,
    TResult Function()? sending,
    TResult Function()? sent,
    TResult Function(dynamic e)? error,
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
    TResult Function(_Editing value)? editing,
    TResult Function(_Sending value)? sending,
    TResult Function(_Sent value)? sent,
    TResult Function(_Error value)? error,
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
  const factory _Error(dynamic e) = _$_Error;

  dynamic get e;
  @JsonKey(ignore: true)
  _$ErrorCopyWith<_Error> get copyWith => throw _privateConstructorUsedError;
}
