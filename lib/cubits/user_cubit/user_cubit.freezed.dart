// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UserState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(dynamic e) error,
    required TResult Function(User user) neutral,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(dynamic e)? error,
    TResult Function(User user)? neutral,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(dynamic e)? error,
    TResult Function(User user)? neutral,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_L value) loading,
    required TResult Function(_E value) error,
    required TResult Function(_N value) neutral,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_L value)? loading,
    TResult Function(_E value)? error,
    TResult Function(_N value)? neutral,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_L value)? loading,
    TResult Function(_E value)? error,
    TResult Function(_N value)? neutral,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserStateCopyWith<$Res> {
  factory $UserStateCopyWith(UserState value, $Res Function(UserState) then) =
      _$UserStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$UserStateCopyWithImpl<$Res> implements $UserStateCopyWith<$Res> {
  _$UserStateCopyWithImpl(this._value, this._then);

  final UserState _value;
  // ignore: unused_field
  final $Res Function(UserState) _then;
}

/// @nodoc
abstract class _$$_LCopyWith<$Res> {
  factory _$$_LCopyWith(_$_L value, $Res Function(_$_L) then) =
      __$$_LCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_LCopyWithImpl<$Res> extends _$UserStateCopyWithImpl<$Res>
    implements _$$_LCopyWith<$Res> {
  __$$_LCopyWithImpl(_$_L _value, $Res Function(_$_L) _then)
      : super(_value, (v) => _then(v as _$_L));

  @override
  _$_L get _value => super._value as _$_L;
}

/// @nodoc

class _$_L implements _L {
  const _$_L();

  @override
  String toString() {
    return 'UserState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_L);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(dynamic e) error,
    required TResult Function(User user) neutral,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(dynamic e)? error,
    TResult Function(User user)? neutral,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(dynamic e)? error,
    TResult Function(User user)? neutral,
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
    required TResult Function(_L value) loading,
    required TResult Function(_E value) error,
    required TResult Function(_N value) neutral,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_L value)? loading,
    TResult Function(_E value)? error,
    TResult Function(_N value)? neutral,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_L value)? loading,
    TResult Function(_E value)? error,
    TResult Function(_N value)? neutral,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _L implements UserState {
  const factory _L() = _$_L;
}

/// @nodoc
abstract class _$$_ECopyWith<$Res> {
  factory _$$_ECopyWith(_$_E value, $Res Function(_$_E) then) =
      __$$_ECopyWithImpl<$Res>;
  $Res call({dynamic e});
}

/// @nodoc
class __$$_ECopyWithImpl<$Res> extends _$UserStateCopyWithImpl<$Res>
    implements _$$_ECopyWith<$Res> {
  __$$_ECopyWithImpl(_$_E _value, $Res Function(_$_E) _then)
      : super(_value, (v) => _then(v as _$_E));

  @override
  _$_E get _value => super._value as _$_E;

  @override
  $Res call({
    Object? e = freezed,
  }) {
    return _then(_$_E(
      e == freezed
          ? _value.e
          : e // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

class _$_E implements _E {
  const _$_E(this.e);

  @override
  final dynamic e;

  @override
  String toString() {
    return 'UserState.error(e: $e)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_E &&
            const DeepCollectionEquality().equals(other.e, e));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(e));

  @JsonKey(ignore: true)
  @override
  _$$_ECopyWith<_$_E> get copyWith =>
      __$$_ECopyWithImpl<_$_E>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(dynamic e) error,
    required TResult Function(User user) neutral,
  }) {
    return error(e);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(dynamic e)? error,
    TResult Function(User user)? neutral,
  }) {
    return error?.call(e);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(dynamic e)? error,
    TResult Function(User user)? neutral,
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
    required TResult Function(_L value) loading,
    required TResult Function(_E value) error,
    required TResult Function(_N value) neutral,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_L value)? loading,
    TResult Function(_E value)? error,
    TResult Function(_N value)? neutral,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_L value)? loading,
    TResult Function(_E value)? error,
    TResult Function(_N value)? neutral,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _E implements UserState {
  const factory _E(final dynamic e) = _$_E;

  dynamic get e;
  @JsonKey(ignore: true)
  _$$_ECopyWith<_$_E> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_NCopyWith<$Res> {
  factory _$$_NCopyWith(_$_N value, $Res Function(_$_N) then) =
      __$$_NCopyWithImpl<$Res>;
  $Res call({User user});
}

/// @nodoc
class __$$_NCopyWithImpl<$Res> extends _$UserStateCopyWithImpl<$Res>
    implements _$$_NCopyWith<$Res> {
  __$$_NCopyWithImpl(_$_N _value, $Res Function(_$_N) _then)
      : super(_value, (v) => _then(v as _$_N));

  @override
  _$_N get _value => super._value as _$_N;

  @override
  $Res call({
    Object? user = freezed,
  }) {
    return _then(_$_N(
      user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }
}

/// @nodoc

class _$_N implements _N {
  const _$_N(this.user);

  @override
  final User user;

  @override
  String toString() {
    return 'UserState.neutral(user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_N &&
            const DeepCollectionEquality().equals(other.user, user));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(user));

  @JsonKey(ignore: true)
  @override
  _$$_NCopyWith<_$_N> get copyWith =>
      __$$_NCopyWithImpl<_$_N>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(dynamic e) error,
    required TResult Function(User user) neutral,
  }) {
    return neutral(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(dynamic e)? error,
    TResult Function(User user)? neutral,
  }) {
    return neutral?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(dynamic e)? error,
    TResult Function(User user)? neutral,
    required TResult orElse(),
  }) {
    if (neutral != null) {
      return neutral(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_L value) loading,
    required TResult Function(_E value) error,
    required TResult Function(_N value) neutral,
  }) {
    return neutral(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_L value)? loading,
    TResult Function(_E value)? error,
    TResult Function(_N value)? neutral,
  }) {
    return neutral?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_L value)? loading,
    TResult Function(_E value)? error,
    TResult Function(_N value)? neutral,
    required TResult orElse(),
  }) {
    if (neutral != null) {
      return neutral(this);
    }
    return orElse();
  }
}

abstract class _N implements UserState {
  const factory _N(final User user) = _$_N;

  User get user;
  @JsonKey(ignore: true)
  _$$_NCopyWith<_$_N> get copyWith => throw _privateConstructorUsedError;
}
