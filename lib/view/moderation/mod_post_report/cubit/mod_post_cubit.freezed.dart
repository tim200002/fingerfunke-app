// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'mod_post_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ModPostStateTearOff {
  const _$ModPostStateTearOff();

  _Loading loading() {
    return const _Loading();
  }

  _Error error(dynamic e) {
    return _Error(
      e,
    );
  }

  _Empty empty() {
    return const _Empty();
  }

  _Neutral neutral(Report report, int count) {
    return _Neutral(
      report,
      count,
    );
  }
}

/// @nodoc
const $ModPostState = _$ModPostStateTearOff();

/// @nodoc
mixin _$ModPostState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(dynamic e) error,
    required TResult Function() empty,
    required TResult Function(Report report, int count) neutral,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(dynamic e)? error,
    TResult Function()? empty,
    TResult Function(Report report, int count)? neutral,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(dynamic e)? error,
    TResult Function()? empty,
    TResult Function(Report report, int count)? neutral,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_Empty value) empty,
    required TResult Function(_Neutral value) neutral,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_Empty value)? empty,
    TResult Function(_Neutral value)? neutral,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_Empty value)? empty,
    TResult Function(_Neutral value)? neutral,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ModPostStateCopyWith<$Res> {
  factory $ModPostStateCopyWith(
          ModPostState value, $Res Function(ModPostState) then) =
      _$ModPostStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$ModPostStateCopyWithImpl<$Res> implements $ModPostStateCopyWith<$Res> {
  _$ModPostStateCopyWithImpl(this._value, this._then);

  final ModPostState _value;
  // ignore: unused_field
  final $Res Function(ModPostState) _then;
}

/// @nodoc
abstract class _$LoadingCopyWith<$Res> {
  factory _$LoadingCopyWith(_Loading value, $Res Function(_Loading) then) =
      __$LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$LoadingCopyWithImpl<$Res> extends _$ModPostStateCopyWithImpl<$Res>
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
    return 'ModPostState.loading()';
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
    required TResult Function(dynamic e) error,
    required TResult Function() empty,
    required TResult Function(Report report, int count) neutral,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(dynamic e)? error,
    TResult Function()? empty,
    TResult Function(Report report, int count)? neutral,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(dynamic e)? error,
    TResult Function()? empty,
    TResult Function(Report report, int count)? neutral,
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
    required TResult Function(_Error value) error,
    required TResult Function(_Empty value) empty,
    required TResult Function(_Neutral value) neutral,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_Empty value)? empty,
    TResult Function(_Neutral value)? neutral,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_Empty value)? empty,
    TResult Function(_Neutral value)? neutral,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements ModPostState {
  const factory _Loading() = _$_Loading;
}

/// @nodoc
abstract class _$ErrorCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) then) =
      __$ErrorCopyWithImpl<$Res>;
  $Res call({dynamic e});
}

/// @nodoc
class __$ErrorCopyWithImpl<$Res> extends _$ModPostStateCopyWithImpl<$Res>
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
    return 'ModPostState.error(e: $e)';
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
    required TResult Function() loading,
    required TResult Function(dynamic e) error,
    required TResult Function() empty,
    required TResult Function(Report report, int count) neutral,
  }) {
    return error(e);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(dynamic e)? error,
    TResult Function()? empty,
    TResult Function(Report report, int count)? neutral,
  }) {
    return error?.call(e);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(dynamic e)? error,
    TResult Function()? empty,
    TResult Function(Report report, int count)? neutral,
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
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_Empty value) empty,
    required TResult Function(_Neutral value) neutral,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_Empty value)? empty,
    TResult Function(_Neutral value)? neutral,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_Empty value)? empty,
    TResult Function(_Neutral value)? neutral,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements ModPostState {
  const factory _Error(dynamic e) = _$_Error;

  dynamic get e;
  @JsonKey(ignore: true)
  _$ErrorCopyWith<_Error> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$EmptyCopyWith<$Res> {
  factory _$EmptyCopyWith(_Empty value, $Res Function(_Empty) then) =
      __$EmptyCopyWithImpl<$Res>;
}

/// @nodoc
class __$EmptyCopyWithImpl<$Res> extends _$ModPostStateCopyWithImpl<$Res>
    implements _$EmptyCopyWith<$Res> {
  __$EmptyCopyWithImpl(_Empty _value, $Res Function(_Empty) _then)
      : super(_value, (v) => _then(v as _Empty));

  @override
  _Empty get _value => super._value as _Empty;
}

/// @nodoc

class _$_Empty implements _Empty {
  const _$_Empty();

  @override
  String toString() {
    return 'ModPostState.empty()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Empty);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(dynamic e) error,
    required TResult Function() empty,
    required TResult Function(Report report, int count) neutral,
  }) {
    return empty();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(dynamic e)? error,
    TResult Function()? empty,
    TResult Function(Report report, int count)? neutral,
  }) {
    return empty?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(dynamic e)? error,
    TResult Function()? empty,
    TResult Function(Report report, int count)? neutral,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_Empty value) empty,
    required TResult Function(_Neutral value) neutral,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_Empty value)? empty,
    TResult Function(_Neutral value)? neutral,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_Empty value)? empty,
    TResult Function(_Neutral value)? neutral,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class _Empty implements ModPostState {
  const factory _Empty() = _$_Empty;
}

/// @nodoc
abstract class _$NeutralCopyWith<$Res> {
  factory _$NeutralCopyWith(_Neutral value, $Res Function(_Neutral) then) =
      __$NeutralCopyWithImpl<$Res>;
  $Res call({Report report, int count});
}

/// @nodoc
class __$NeutralCopyWithImpl<$Res> extends _$ModPostStateCopyWithImpl<$Res>
    implements _$NeutralCopyWith<$Res> {
  __$NeutralCopyWithImpl(_Neutral _value, $Res Function(_Neutral) _then)
      : super(_value, (v) => _then(v as _Neutral));

  @override
  _Neutral get _value => super._value as _Neutral;

  @override
  $Res call({
    Object? report = freezed,
    Object? count = freezed,
  }) {
    return _then(_Neutral(
      report == freezed
          ? _value.report
          : report // ignore: cast_nullable_to_non_nullable
              as Report,
      count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_Neutral implements _Neutral {
  const _$_Neutral(this.report, this.count);

  @override
  final Report report;
  @override
  final int count;

  @override
  String toString() {
    return 'ModPostState.neutral(report: $report, count: $count)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Neutral &&
            (identical(other.report, report) || other.report == report) &&
            (identical(other.count, count) || other.count == count));
  }

  @override
  int get hashCode => Object.hash(runtimeType, report, count);

  @JsonKey(ignore: true)
  @override
  _$NeutralCopyWith<_Neutral> get copyWith =>
      __$NeutralCopyWithImpl<_Neutral>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(dynamic e) error,
    required TResult Function() empty,
    required TResult Function(Report report, int count) neutral,
  }) {
    return neutral(report, count);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(dynamic e)? error,
    TResult Function()? empty,
    TResult Function(Report report, int count)? neutral,
  }) {
    return neutral?.call(report, count);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(dynamic e)? error,
    TResult Function()? empty,
    TResult Function(Report report, int count)? neutral,
    required TResult orElse(),
  }) {
    if (neutral != null) {
      return neutral(report, count);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_Empty value) empty,
    required TResult Function(_Neutral value) neutral,
  }) {
    return neutral(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_Empty value)? empty,
    TResult Function(_Neutral value)? neutral,
  }) {
    return neutral?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_Empty value)? empty,
    TResult Function(_Neutral value)? neutral,
    required TResult orElse(),
  }) {
    if (neutral != null) {
      return neutral(this);
    }
    return orElse();
  }
}

abstract class _Neutral implements ModPostState {
  const factory _Neutral(Report report, int count) = _$_Neutral;

  Report get report;
  int get count;
  @JsonKey(ignore: true)
  _$NeutralCopyWith<_Neutral> get copyWith =>
      throw _privateConstructorUsedError;
}
