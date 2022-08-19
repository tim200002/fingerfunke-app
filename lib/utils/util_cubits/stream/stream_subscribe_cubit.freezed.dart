// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'stream_subscribe_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$StreamSubscribeState<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(T value) neutral,
    required TResult Function(dynamic e) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(T value)? neutral,
    TResult Function(dynamic e)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(T value)? neutral,
    TResult Function(dynamic e)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading<T> value) loading,
    required TResult Function(_Neutral<T> value) neutral,
    required TResult Function(_Error<T> value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Loading<T> value)? loading,
    TResult Function(_Neutral<T> value)? neutral,
    TResult Function(_Error<T> value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading<T> value)? loading,
    TResult Function(_Neutral<T> value)? neutral,
    TResult Function(_Error<T> value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StreamSubscribeStateCopyWith<T, $Res> {
  factory $StreamSubscribeStateCopyWith(StreamSubscribeState<T> value,
          $Res Function(StreamSubscribeState<T>) then) =
      _$StreamSubscribeStateCopyWithImpl<T, $Res>;
}

/// @nodoc
class _$StreamSubscribeStateCopyWithImpl<T, $Res>
    implements $StreamSubscribeStateCopyWith<T, $Res> {
  _$StreamSubscribeStateCopyWithImpl(this._value, this._then);

  final StreamSubscribeState<T> _value;
  // ignore: unused_field
  final $Res Function(StreamSubscribeState<T>) _then;
}

/// @nodoc
abstract class _$$_LoadingCopyWith<T, $Res> {
  factory _$$_LoadingCopyWith(
          _$_Loading<T> value, $Res Function(_$_Loading<T>) then) =
      __$$_LoadingCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$_LoadingCopyWithImpl<T, $Res>
    extends _$StreamSubscribeStateCopyWithImpl<T, $Res>
    implements _$$_LoadingCopyWith<T, $Res> {
  __$$_LoadingCopyWithImpl(
      _$_Loading<T> _value, $Res Function(_$_Loading<T>) _then)
      : super(_value, (v) => _then(v as _$_Loading<T>));

  @override
  _$_Loading<T> get _value => super._value as _$_Loading<T>;
}

/// @nodoc

class _$_Loading<T> implements _Loading<T> {
  const _$_Loading();

  @override
  String toString() {
    return 'StreamSubscribeState<$T>.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Loading<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(T value) neutral,
    required TResult Function(dynamic e) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(T value)? neutral,
    TResult Function(dynamic e)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(T value)? neutral,
    TResult Function(dynamic e)? error,
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
    required TResult Function(_Loading<T> value) loading,
    required TResult Function(_Neutral<T> value) neutral,
    required TResult Function(_Error<T> value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Loading<T> value)? loading,
    TResult Function(_Neutral<T> value)? neutral,
    TResult Function(_Error<T> value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading<T> value)? loading,
    TResult Function(_Neutral<T> value)? neutral,
    TResult Function(_Error<T> value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading<T> implements StreamSubscribeState<T> {
  const factory _Loading() = _$_Loading<T>;
}

/// @nodoc
abstract class _$$_NeutralCopyWith<T, $Res> {
  factory _$$_NeutralCopyWith(
          _$_Neutral<T> value, $Res Function(_$_Neutral<T>) then) =
      __$$_NeutralCopyWithImpl<T, $Res>;
  $Res call({T value});
}

/// @nodoc
class __$$_NeutralCopyWithImpl<T, $Res>
    extends _$StreamSubscribeStateCopyWithImpl<T, $Res>
    implements _$$_NeutralCopyWith<T, $Res> {
  __$$_NeutralCopyWithImpl(
      _$_Neutral<T> _value, $Res Function(_$_Neutral<T>) _then)
      : super(_value, (v) => _then(v as _$_Neutral<T>));

  @override
  _$_Neutral<T> get _value => super._value as _$_Neutral<T>;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_$_Neutral<T>(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$_Neutral<T> implements _Neutral<T> {
  const _$_Neutral(this.value);

  @override
  final T value;

  @override
  String toString() {
    return 'StreamSubscribeState<$T>.neutral(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Neutral<T> &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(value));

  @JsonKey(ignore: true)
  @override
  _$$_NeutralCopyWith<T, _$_Neutral<T>> get copyWith =>
      __$$_NeutralCopyWithImpl<T, _$_Neutral<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(T value) neutral,
    required TResult Function(dynamic e) error,
  }) {
    return neutral(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(T value)? neutral,
    TResult Function(dynamic e)? error,
  }) {
    return neutral?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(T value)? neutral,
    TResult Function(dynamic e)? error,
    required TResult orElse(),
  }) {
    if (neutral != null) {
      return neutral(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading<T> value) loading,
    required TResult Function(_Neutral<T> value) neutral,
    required TResult Function(_Error<T> value) error,
  }) {
    return neutral(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Loading<T> value)? loading,
    TResult Function(_Neutral<T> value)? neutral,
    TResult Function(_Error<T> value)? error,
  }) {
    return neutral?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading<T> value)? loading,
    TResult Function(_Neutral<T> value)? neutral,
    TResult Function(_Error<T> value)? error,
    required TResult orElse(),
  }) {
    if (neutral != null) {
      return neutral(this);
    }
    return orElse();
  }
}

abstract class _Neutral<T> implements StreamSubscribeState<T> {
  const factory _Neutral(final T value) = _$_Neutral<T>;

  T get value;
  @JsonKey(ignore: true)
  _$$_NeutralCopyWith<T, _$_Neutral<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ErrorCopyWith<T, $Res> {
  factory _$$_ErrorCopyWith(
          _$_Error<T> value, $Res Function(_$_Error<T>) then) =
      __$$_ErrorCopyWithImpl<T, $Res>;
  $Res call({dynamic e});
}

/// @nodoc
class __$$_ErrorCopyWithImpl<T, $Res>
    extends _$StreamSubscribeStateCopyWithImpl<T, $Res>
    implements _$$_ErrorCopyWith<T, $Res> {
  __$$_ErrorCopyWithImpl(_$_Error<T> _value, $Res Function(_$_Error<T>) _then)
      : super(_value, (v) => _then(v as _$_Error<T>));

  @override
  _$_Error<T> get _value => super._value as _$_Error<T>;

  @override
  $Res call({
    Object? e = freezed,
  }) {
    return _then(_$_Error<T>(
      e == freezed
          ? _value.e
          : e // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

class _$_Error<T> implements _Error<T> {
  const _$_Error(this.e);

  @override
  final dynamic e;

  @override
  String toString() {
    return 'StreamSubscribeState<$T>.error(e: $e)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Error<T> &&
            const DeepCollectionEquality().equals(other.e, e));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(e));

  @JsonKey(ignore: true)
  @override
  _$$_ErrorCopyWith<T, _$_Error<T>> get copyWith =>
      __$$_ErrorCopyWithImpl<T, _$_Error<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(T value) neutral,
    required TResult Function(dynamic e) error,
  }) {
    return error(e);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(T value)? neutral,
    TResult Function(dynamic e)? error,
  }) {
    return error?.call(e);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(T value)? neutral,
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
    required TResult Function(_Loading<T> value) loading,
    required TResult Function(_Neutral<T> value) neutral,
    required TResult Function(_Error<T> value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Loading<T> value)? loading,
    TResult Function(_Neutral<T> value)? neutral,
    TResult Function(_Error<T> value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading<T> value)? loading,
    TResult Function(_Neutral<T> value)? neutral,
    TResult Function(_Error<T> value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error<T> implements StreamSubscribeState<T> {
  const factory _Error(final dynamic e) = _$_Error<T>;

  dynamic get e;
  @JsonKey(ignore: true)
  _$$_ErrorCopyWith<T, _$_Error<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
