// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'firebase_authentication_cubit_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$FirebaseAuthenticationCubitStateTearOff {
  const _$FirebaseAuthenticationCubitStateTearOff();

  _AuthenticatedWaitingForUserToBeFetched
      authenticatedWaitingForUserToBeFetched(String uid) {
    return _AuthenticatedWaitingForUserToBeFetched(
      uid,
    );
  }

  _AuthenticatedNoUserCreated autehnticationNoUserCreated(String uid) {
    return _AuthenticatedNoUserCreated(
      uid,
    );
  }

  _Authenticated authenticated(user_models.User user) {
    return _Authenticated(
      user,
    );
  }

  _Unauthenticated unauthenticated() {
    return const _Unauthenticated();
  }
}

/// @nodoc
const $FirebaseAuthenticationCubitState =
    _$FirebaseAuthenticationCubitStateTearOff();

/// @nodoc
mixin _$FirebaseAuthenticationCubitState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String uid)
        authenticatedWaitingForUserToBeFetched,
    required TResult Function(String uid) autehnticationNoUserCreated,
    required TResult Function(user_models.User user) authenticated,
    required TResult Function() unauthenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String uid)? authenticatedWaitingForUserToBeFetched,
    TResult Function(String uid)? autehnticationNoUserCreated,
    TResult Function(user_models.User user)? authenticated,
    TResult Function()? unauthenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String uid)? authenticatedWaitingForUserToBeFetched,
    TResult Function(String uid)? autehnticationNoUserCreated,
    TResult Function(user_models.User user)? authenticated,
    TResult Function()? unauthenticated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthenticatedWaitingForUserToBeFetched value)
        authenticatedWaitingForUserToBeFetched,
    required TResult Function(_AuthenticatedNoUserCreated value)
        autehnticationNoUserCreated,
    required TResult Function(_Authenticated value) authenticated,
    required TResult Function(_Unauthenticated value) unauthenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_AuthenticatedWaitingForUserToBeFetched value)?
        authenticatedWaitingForUserToBeFetched,
    TResult Function(_AuthenticatedNoUserCreated value)?
        autehnticationNoUserCreated,
    TResult Function(_Authenticated value)? authenticated,
    TResult Function(_Unauthenticated value)? unauthenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthenticatedWaitingForUserToBeFetched value)?
        authenticatedWaitingForUserToBeFetched,
    TResult Function(_AuthenticatedNoUserCreated value)?
        autehnticationNoUserCreated,
    TResult Function(_Authenticated value)? authenticated,
    TResult Function(_Unauthenticated value)? unauthenticated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FirebaseAuthenticationCubitStateCopyWith<$Res> {
  factory $FirebaseAuthenticationCubitStateCopyWith(
          FirebaseAuthenticationCubitState value,
          $Res Function(FirebaseAuthenticationCubitState) then) =
      _$FirebaseAuthenticationCubitStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$FirebaseAuthenticationCubitStateCopyWithImpl<$Res>
    implements $FirebaseAuthenticationCubitStateCopyWith<$Res> {
  _$FirebaseAuthenticationCubitStateCopyWithImpl(this._value, this._then);

  final FirebaseAuthenticationCubitState _value;
  // ignore: unused_field
  final $Res Function(FirebaseAuthenticationCubitState) _then;
}

/// @nodoc
abstract class _$AuthenticatedWaitingForUserToBeFetchedCopyWith<$Res> {
  factory _$AuthenticatedWaitingForUserToBeFetchedCopyWith(
          _AuthenticatedWaitingForUserToBeFetched value,
          $Res Function(_AuthenticatedWaitingForUserToBeFetched) then) =
      __$AuthenticatedWaitingForUserToBeFetchedCopyWithImpl<$Res>;
  $Res call({String uid});
}

/// @nodoc
class __$AuthenticatedWaitingForUserToBeFetchedCopyWithImpl<$Res>
    extends _$FirebaseAuthenticationCubitStateCopyWithImpl<$Res>
    implements _$AuthenticatedWaitingForUserToBeFetchedCopyWith<$Res> {
  __$AuthenticatedWaitingForUserToBeFetchedCopyWithImpl(
      _AuthenticatedWaitingForUserToBeFetched _value,
      $Res Function(_AuthenticatedWaitingForUserToBeFetched) _then)
      : super(
            _value, (v) => _then(v as _AuthenticatedWaitingForUserToBeFetched));

  @override
  _AuthenticatedWaitingForUserToBeFetched get _value =>
      super._value as _AuthenticatedWaitingForUserToBeFetched;

  @override
  $Res call({
    Object? uid = freezed,
  }) {
    return _then(_AuthenticatedWaitingForUserToBeFetched(
      uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_AuthenticatedWaitingForUserToBeFetched
    implements _AuthenticatedWaitingForUserToBeFetched {
  const _$_AuthenticatedWaitingForUserToBeFetched(this.uid);

  @override
  final String uid;

  @override
  String toString() {
    return 'FirebaseAuthenticationCubitState.authenticatedWaitingForUserToBeFetched(uid: $uid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AuthenticatedWaitingForUserToBeFetched &&
            (identical(other.uid, uid) || other.uid == uid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, uid);

  @JsonKey(ignore: true)
  @override
  _$AuthenticatedWaitingForUserToBeFetchedCopyWith<
          _AuthenticatedWaitingForUserToBeFetched>
      get copyWith => __$AuthenticatedWaitingForUserToBeFetchedCopyWithImpl<
          _AuthenticatedWaitingForUserToBeFetched>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String uid)
        authenticatedWaitingForUserToBeFetched,
    required TResult Function(String uid) autehnticationNoUserCreated,
    required TResult Function(user_models.User user) authenticated,
    required TResult Function() unauthenticated,
  }) {
    return authenticatedWaitingForUserToBeFetched(uid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String uid)? authenticatedWaitingForUserToBeFetched,
    TResult Function(String uid)? autehnticationNoUserCreated,
    TResult Function(user_models.User user)? authenticated,
    TResult Function()? unauthenticated,
  }) {
    return authenticatedWaitingForUserToBeFetched?.call(uid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String uid)? authenticatedWaitingForUserToBeFetched,
    TResult Function(String uid)? autehnticationNoUserCreated,
    TResult Function(user_models.User user)? authenticated,
    TResult Function()? unauthenticated,
    required TResult orElse(),
  }) {
    if (authenticatedWaitingForUserToBeFetched != null) {
      return authenticatedWaitingForUserToBeFetched(uid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthenticatedWaitingForUserToBeFetched value)
        authenticatedWaitingForUserToBeFetched,
    required TResult Function(_AuthenticatedNoUserCreated value)
        autehnticationNoUserCreated,
    required TResult Function(_Authenticated value) authenticated,
    required TResult Function(_Unauthenticated value) unauthenticated,
  }) {
    return authenticatedWaitingForUserToBeFetched(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_AuthenticatedWaitingForUserToBeFetched value)?
        authenticatedWaitingForUserToBeFetched,
    TResult Function(_AuthenticatedNoUserCreated value)?
        autehnticationNoUserCreated,
    TResult Function(_Authenticated value)? authenticated,
    TResult Function(_Unauthenticated value)? unauthenticated,
  }) {
    return authenticatedWaitingForUserToBeFetched?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthenticatedWaitingForUserToBeFetched value)?
        authenticatedWaitingForUserToBeFetched,
    TResult Function(_AuthenticatedNoUserCreated value)?
        autehnticationNoUserCreated,
    TResult Function(_Authenticated value)? authenticated,
    TResult Function(_Unauthenticated value)? unauthenticated,
    required TResult orElse(),
  }) {
    if (authenticatedWaitingForUserToBeFetched != null) {
      return authenticatedWaitingForUserToBeFetched(this);
    }
    return orElse();
  }
}

abstract class _AuthenticatedWaitingForUserToBeFetched
    implements FirebaseAuthenticationCubitState {
  const factory _AuthenticatedWaitingForUserToBeFetched(String uid) =
      _$_AuthenticatedWaitingForUserToBeFetched;

  String get uid;
  @JsonKey(ignore: true)
  _$AuthenticatedWaitingForUserToBeFetchedCopyWith<
          _AuthenticatedWaitingForUserToBeFetched>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$AuthenticatedNoUserCreatedCopyWith<$Res> {
  factory _$AuthenticatedNoUserCreatedCopyWith(
          _AuthenticatedNoUserCreated value,
          $Res Function(_AuthenticatedNoUserCreated) then) =
      __$AuthenticatedNoUserCreatedCopyWithImpl<$Res>;
  $Res call({String uid});
}

/// @nodoc
class __$AuthenticatedNoUserCreatedCopyWithImpl<$Res>
    extends _$FirebaseAuthenticationCubitStateCopyWithImpl<$Res>
    implements _$AuthenticatedNoUserCreatedCopyWith<$Res> {
  __$AuthenticatedNoUserCreatedCopyWithImpl(_AuthenticatedNoUserCreated _value,
      $Res Function(_AuthenticatedNoUserCreated) _then)
      : super(_value, (v) => _then(v as _AuthenticatedNoUserCreated));

  @override
  _AuthenticatedNoUserCreated get _value =>
      super._value as _AuthenticatedNoUserCreated;

  @override
  $Res call({
    Object? uid = freezed,
  }) {
    return _then(_AuthenticatedNoUserCreated(
      uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_AuthenticatedNoUserCreated implements _AuthenticatedNoUserCreated {
  const _$_AuthenticatedNoUserCreated(this.uid);

  @override
  final String uid;

  @override
  String toString() {
    return 'FirebaseAuthenticationCubitState.autehnticationNoUserCreated(uid: $uid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AuthenticatedNoUserCreated &&
            (identical(other.uid, uid) || other.uid == uid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, uid);

  @JsonKey(ignore: true)
  @override
  _$AuthenticatedNoUserCreatedCopyWith<_AuthenticatedNoUserCreated>
      get copyWith => __$AuthenticatedNoUserCreatedCopyWithImpl<
          _AuthenticatedNoUserCreated>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String uid)
        authenticatedWaitingForUserToBeFetched,
    required TResult Function(String uid) autehnticationNoUserCreated,
    required TResult Function(user_models.User user) authenticated,
    required TResult Function() unauthenticated,
  }) {
    return autehnticationNoUserCreated(uid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String uid)? authenticatedWaitingForUserToBeFetched,
    TResult Function(String uid)? autehnticationNoUserCreated,
    TResult Function(user_models.User user)? authenticated,
    TResult Function()? unauthenticated,
  }) {
    return autehnticationNoUserCreated?.call(uid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String uid)? authenticatedWaitingForUserToBeFetched,
    TResult Function(String uid)? autehnticationNoUserCreated,
    TResult Function(user_models.User user)? authenticated,
    TResult Function()? unauthenticated,
    required TResult orElse(),
  }) {
    if (autehnticationNoUserCreated != null) {
      return autehnticationNoUserCreated(uid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthenticatedWaitingForUserToBeFetched value)
        authenticatedWaitingForUserToBeFetched,
    required TResult Function(_AuthenticatedNoUserCreated value)
        autehnticationNoUserCreated,
    required TResult Function(_Authenticated value) authenticated,
    required TResult Function(_Unauthenticated value) unauthenticated,
  }) {
    return autehnticationNoUserCreated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_AuthenticatedWaitingForUserToBeFetched value)?
        authenticatedWaitingForUserToBeFetched,
    TResult Function(_AuthenticatedNoUserCreated value)?
        autehnticationNoUserCreated,
    TResult Function(_Authenticated value)? authenticated,
    TResult Function(_Unauthenticated value)? unauthenticated,
  }) {
    return autehnticationNoUserCreated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthenticatedWaitingForUserToBeFetched value)?
        authenticatedWaitingForUserToBeFetched,
    TResult Function(_AuthenticatedNoUserCreated value)?
        autehnticationNoUserCreated,
    TResult Function(_Authenticated value)? authenticated,
    TResult Function(_Unauthenticated value)? unauthenticated,
    required TResult orElse(),
  }) {
    if (autehnticationNoUserCreated != null) {
      return autehnticationNoUserCreated(this);
    }
    return orElse();
  }
}

abstract class _AuthenticatedNoUserCreated
    implements FirebaseAuthenticationCubitState {
  const factory _AuthenticatedNoUserCreated(String uid) =
      _$_AuthenticatedNoUserCreated;

  String get uid;
  @JsonKey(ignore: true)
  _$AuthenticatedNoUserCreatedCopyWith<_AuthenticatedNoUserCreated>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$AuthenticatedCopyWith<$Res> {
  factory _$AuthenticatedCopyWith(
          _Authenticated value, $Res Function(_Authenticated) then) =
      __$AuthenticatedCopyWithImpl<$Res>;
  $Res call({user_models.User user});
}

/// @nodoc
class __$AuthenticatedCopyWithImpl<$Res>
    extends _$FirebaseAuthenticationCubitStateCopyWithImpl<$Res>
    implements _$AuthenticatedCopyWith<$Res> {
  __$AuthenticatedCopyWithImpl(
      _Authenticated _value, $Res Function(_Authenticated) _then)
      : super(_value, (v) => _then(v as _Authenticated));

  @override
  _Authenticated get _value => super._value as _Authenticated;

  @override
  $Res call({
    Object? user = freezed,
  }) {
    return _then(_Authenticated(
      user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as user_models.User,
    ));
  }
}

/// @nodoc

class _$_Authenticated implements _Authenticated {
  const _$_Authenticated(this.user);

  @override
  final user_models.User user;

  @override
  String toString() {
    return 'FirebaseAuthenticationCubitState.authenticated(user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Authenticated &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  @JsonKey(ignore: true)
  @override
  _$AuthenticatedCopyWith<_Authenticated> get copyWith =>
      __$AuthenticatedCopyWithImpl<_Authenticated>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String uid)
        authenticatedWaitingForUserToBeFetched,
    required TResult Function(String uid) autehnticationNoUserCreated,
    required TResult Function(user_models.User user) authenticated,
    required TResult Function() unauthenticated,
  }) {
    return authenticated(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String uid)? authenticatedWaitingForUserToBeFetched,
    TResult Function(String uid)? autehnticationNoUserCreated,
    TResult Function(user_models.User user)? authenticated,
    TResult Function()? unauthenticated,
  }) {
    return authenticated?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String uid)? authenticatedWaitingForUserToBeFetched,
    TResult Function(String uid)? autehnticationNoUserCreated,
    TResult Function(user_models.User user)? authenticated,
    TResult Function()? unauthenticated,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthenticatedWaitingForUserToBeFetched value)
        authenticatedWaitingForUserToBeFetched,
    required TResult Function(_AuthenticatedNoUserCreated value)
        autehnticationNoUserCreated,
    required TResult Function(_Authenticated value) authenticated,
    required TResult Function(_Unauthenticated value) unauthenticated,
  }) {
    return authenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_AuthenticatedWaitingForUserToBeFetched value)?
        authenticatedWaitingForUserToBeFetched,
    TResult Function(_AuthenticatedNoUserCreated value)?
        autehnticationNoUserCreated,
    TResult Function(_Authenticated value)? authenticated,
    TResult Function(_Unauthenticated value)? unauthenticated,
  }) {
    return authenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthenticatedWaitingForUserToBeFetched value)?
        authenticatedWaitingForUserToBeFetched,
    TResult Function(_AuthenticatedNoUserCreated value)?
        autehnticationNoUserCreated,
    TResult Function(_Authenticated value)? authenticated,
    TResult Function(_Unauthenticated value)? unauthenticated,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(this);
    }
    return orElse();
  }
}

abstract class _Authenticated implements FirebaseAuthenticationCubitState {
  const factory _Authenticated(user_models.User user) = _$_Authenticated;

  user_models.User get user;
  @JsonKey(ignore: true)
  _$AuthenticatedCopyWith<_Authenticated> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$UnauthenticatedCopyWith<$Res> {
  factory _$UnauthenticatedCopyWith(
          _Unauthenticated value, $Res Function(_Unauthenticated) then) =
      __$UnauthenticatedCopyWithImpl<$Res>;
}

/// @nodoc
class __$UnauthenticatedCopyWithImpl<$Res>
    extends _$FirebaseAuthenticationCubitStateCopyWithImpl<$Res>
    implements _$UnauthenticatedCopyWith<$Res> {
  __$UnauthenticatedCopyWithImpl(
      _Unauthenticated _value, $Res Function(_Unauthenticated) _then)
      : super(_value, (v) => _then(v as _Unauthenticated));

  @override
  _Unauthenticated get _value => super._value as _Unauthenticated;
}

/// @nodoc

class _$_Unauthenticated implements _Unauthenticated {
  const _$_Unauthenticated();

  @override
  String toString() {
    return 'FirebaseAuthenticationCubitState.unauthenticated()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Unauthenticated);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String uid)
        authenticatedWaitingForUserToBeFetched,
    required TResult Function(String uid) autehnticationNoUserCreated,
    required TResult Function(user_models.User user) authenticated,
    required TResult Function() unauthenticated,
  }) {
    return unauthenticated();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String uid)? authenticatedWaitingForUserToBeFetched,
    TResult Function(String uid)? autehnticationNoUserCreated,
    TResult Function(user_models.User user)? authenticated,
    TResult Function()? unauthenticated,
  }) {
    return unauthenticated?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String uid)? authenticatedWaitingForUserToBeFetched,
    TResult Function(String uid)? autehnticationNoUserCreated,
    TResult Function(user_models.User user)? authenticated,
    TResult Function()? unauthenticated,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthenticatedWaitingForUserToBeFetched value)
        authenticatedWaitingForUserToBeFetched,
    required TResult Function(_AuthenticatedNoUserCreated value)
        autehnticationNoUserCreated,
    required TResult Function(_Authenticated value) authenticated,
    required TResult Function(_Unauthenticated value) unauthenticated,
  }) {
    return unauthenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_AuthenticatedWaitingForUserToBeFetched value)?
        authenticatedWaitingForUserToBeFetched,
    TResult Function(_AuthenticatedNoUserCreated value)?
        autehnticationNoUserCreated,
    TResult Function(_Authenticated value)? authenticated,
    TResult Function(_Unauthenticated value)? unauthenticated,
  }) {
    return unauthenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthenticatedWaitingForUserToBeFetched value)?
        authenticatedWaitingForUserToBeFetched,
    TResult Function(_AuthenticatedNoUserCreated value)?
        autehnticationNoUserCreated,
    TResult Function(_Authenticated value)? authenticated,
    TResult Function(_Unauthenticated value)? unauthenticated,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated(this);
    }
    return orElse();
  }
}

abstract class _Unauthenticated implements FirebaseAuthenticationCubitState {
  const factory _Unauthenticated() = _$_Unauthenticated;
}
