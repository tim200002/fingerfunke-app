// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'phone_login_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PhoneLoginStateTearOff {
  const _$PhoneLoginStateTearOff();

  _EnterPhoneNumber enterPhoneNumber({required bool isLoading}) {
    return _EnterPhoneNumber(
      isLoading: isLoading,
    );
  }

  _EnterCode enterCode({required String verificationId, int? resendToken}) {
    return _EnterCode(
      verificationId: verificationId,
      resendToken: resendToken,
    );
  }

  _Authenticated authenticated() {
    return const _Authenticated();
  }
}

/// @nodoc
const $PhoneLoginState = _$PhoneLoginStateTearOff();

/// @nodoc
mixin _$PhoneLoginState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isLoading) enterPhoneNumber,
    required TResult Function(String verificationId, int? resendToken)
        enterCode,
    required TResult Function() authenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool isLoading)? enterPhoneNumber,
    TResult Function(String verificationId, int? resendToken)? enterCode,
    TResult Function()? authenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isLoading)? enterPhoneNumber,
    TResult Function(String verificationId, int? resendToken)? enterCode,
    TResult Function()? authenticated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EnterPhoneNumber value) enterPhoneNumber,
    required TResult Function(_EnterCode value) enterCode,
    required TResult Function(_Authenticated value) authenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_EnterPhoneNumber value)? enterPhoneNumber,
    TResult Function(_EnterCode value)? enterCode,
    TResult Function(_Authenticated value)? authenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EnterPhoneNumber value)? enterPhoneNumber,
    TResult Function(_EnterCode value)? enterCode,
    TResult Function(_Authenticated value)? authenticated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhoneLoginStateCopyWith<$Res> {
  factory $PhoneLoginStateCopyWith(
          PhoneLoginState value, $Res Function(PhoneLoginState) then) =
      _$PhoneLoginStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$PhoneLoginStateCopyWithImpl<$Res>
    implements $PhoneLoginStateCopyWith<$Res> {
  _$PhoneLoginStateCopyWithImpl(this._value, this._then);

  final PhoneLoginState _value;
  // ignore: unused_field
  final $Res Function(PhoneLoginState) _then;
}

/// @nodoc
abstract class _$EnterPhoneNumberCopyWith<$Res> {
  factory _$EnterPhoneNumberCopyWith(
          _EnterPhoneNumber value, $Res Function(_EnterPhoneNumber) then) =
      __$EnterPhoneNumberCopyWithImpl<$Res>;
  $Res call({bool isLoading});
}

/// @nodoc
class __$EnterPhoneNumberCopyWithImpl<$Res>
    extends _$PhoneLoginStateCopyWithImpl<$Res>
    implements _$EnterPhoneNumberCopyWith<$Res> {
  __$EnterPhoneNumberCopyWithImpl(
      _EnterPhoneNumber _value, $Res Function(_EnterPhoneNumber) _then)
      : super(_value, (v) => _then(v as _EnterPhoneNumber));

  @override
  _EnterPhoneNumber get _value => super._value as _EnterPhoneNumber;

  @override
  $Res call({
    Object? isLoading = freezed,
  }) {
    return _then(_EnterPhoneNumber(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_EnterPhoneNumber implements _EnterPhoneNumber {
  const _$_EnterPhoneNumber({required this.isLoading});

  @override
  final bool isLoading;

  @override
  String toString() {
    return 'PhoneLoginState.enterPhoneNumber(isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _EnterPhoneNumber &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading);

  @JsonKey(ignore: true)
  @override
  _$EnterPhoneNumberCopyWith<_EnterPhoneNumber> get copyWith =>
      __$EnterPhoneNumberCopyWithImpl<_EnterPhoneNumber>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isLoading) enterPhoneNumber,
    required TResult Function(String verificationId, int? resendToken)
        enterCode,
    required TResult Function() authenticated,
  }) {
    return enterPhoneNumber(isLoading);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool isLoading)? enterPhoneNumber,
    TResult Function(String verificationId, int? resendToken)? enterCode,
    TResult Function()? authenticated,
  }) {
    return enterPhoneNumber?.call(isLoading);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isLoading)? enterPhoneNumber,
    TResult Function(String verificationId, int? resendToken)? enterCode,
    TResult Function()? authenticated,
    required TResult orElse(),
  }) {
    if (enterPhoneNumber != null) {
      return enterPhoneNumber(isLoading);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EnterPhoneNumber value) enterPhoneNumber,
    required TResult Function(_EnterCode value) enterCode,
    required TResult Function(_Authenticated value) authenticated,
  }) {
    return enterPhoneNumber(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_EnterPhoneNumber value)? enterPhoneNumber,
    TResult Function(_EnterCode value)? enterCode,
    TResult Function(_Authenticated value)? authenticated,
  }) {
    return enterPhoneNumber?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EnterPhoneNumber value)? enterPhoneNumber,
    TResult Function(_EnterCode value)? enterCode,
    TResult Function(_Authenticated value)? authenticated,
    required TResult orElse(),
  }) {
    if (enterPhoneNumber != null) {
      return enterPhoneNumber(this);
    }
    return orElse();
  }
}

abstract class _EnterPhoneNumber implements PhoneLoginState {
  const factory _EnterPhoneNumber({required bool isLoading}) =
      _$_EnterPhoneNumber;

  bool get isLoading;
  @JsonKey(ignore: true)
  _$EnterPhoneNumberCopyWith<_EnterPhoneNumber> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$EnterCodeCopyWith<$Res> {
  factory _$EnterCodeCopyWith(
          _EnterCode value, $Res Function(_EnterCode) then) =
      __$EnterCodeCopyWithImpl<$Res>;
  $Res call({String verificationId, int? resendToken});
}

/// @nodoc
class __$EnterCodeCopyWithImpl<$Res> extends _$PhoneLoginStateCopyWithImpl<$Res>
    implements _$EnterCodeCopyWith<$Res> {
  __$EnterCodeCopyWithImpl(_EnterCode _value, $Res Function(_EnterCode) _then)
      : super(_value, (v) => _then(v as _EnterCode));

  @override
  _EnterCode get _value => super._value as _EnterCode;

  @override
  $Res call({
    Object? verificationId = freezed,
    Object? resendToken = freezed,
  }) {
    return _then(_EnterCode(
      verificationId: verificationId == freezed
          ? _value.verificationId
          : verificationId // ignore: cast_nullable_to_non_nullable
              as String,
      resendToken: resendToken == freezed
          ? _value.resendToken
          : resendToken // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$_EnterCode implements _EnterCode {
  const _$_EnterCode({required this.verificationId, this.resendToken});

  @override
  final String verificationId;
  @override
  final int? resendToken;

  @override
  String toString() {
    return 'PhoneLoginState.enterCode(verificationId: $verificationId, resendToken: $resendToken)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _EnterCode &&
            (identical(other.verificationId, verificationId) ||
                other.verificationId == verificationId) &&
            (identical(other.resendToken, resendToken) ||
                other.resendToken == resendToken));
  }

  @override
  int get hashCode => Object.hash(runtimeType, verificationId, resendToken);

  @JsonKey(ignore: true)
  @override
  _$EnterCodeCopyWith<_EnterCode> get copyWith =>
      __$EnterCodeCopyWithImpl<_EnterCode>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isLoading) enterPhoneNumber,
    required TResult Function(String verificationId, int? resendToken)
        enterCode,
    required TResult Function() authenticated,
  }) {
    return enterCode(verificationId, resendToken);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool isLoading)? enterPhoneNumber,
    TResult Function(String verificationId, int? resendToken)? enterCode,
    TResult Function()? authenticated,
  }) {
    return enterCode?.call(verificationId, resendToken);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isLoading)? enterPhoneNumber,
    TResult Function(String verificationId, int? resendToken)? enterCode,
    TResult Function()? authenticated,
    required TResult orElse(),
  }) {
    if (enterCode != null) {
      return enterCode(verificationId, resendToken);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EnterPhoneNumber value) enterPhoneNumber,
    required TResult Function(_EnterCode value) enterCode,
    required TResult Function(_Authenticated value) authenticated,
  }) {
    return enterCode(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_EnterPhoneNumber value)? enterPhoneNumber,
    TResult Function(_EnterCode value)? enterCode,
    TResult Function(_Authenticated value)? authenticated,
  }) {
    return enterCode?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EnterPhoneNumber value)? enterPhoneNumber,
    TResult Function(_EnterCode value)? enterCode,
    TResult Function(_Authenticated value)? authenticated,
    required TResult orElse(),
  }) {
    if (enterCode != null) {
      return enterCode(this);
    }
    return orElse();
  }
}

abstract class _EnterCode implements PhoneLoginState {
  const factory _EnterCode({required String verificationId, int? resendToken}) =
      _$_EnterCode;

  String get verificationId;
  int? get resendToken;
  @JsonKey(ignore: true)
  _$EnterCodeCopyWith<_EnterCode> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$AuthenticatedCopyWith<$Res> {
  factory _$AuthenticatedCopyWith(
          _Authenticated value, $Res Function(_Authenticated) then) =
      __$AuthenticatedCopyWithImpl<$Res>;
}

/// @nodoc
class __$AuthenticatedCopyWithImpl<$Res>
    extends _$PhoneLoginStateCopyWithImpl<$Res>
    implements _$AuthenticatedCopyWith<$Res> {
  __$AuthenticatedCopyWithImpl(
      _Authenticated _value, $Res Function(_Authenticated) _then)
      : super(_value, (v) => _then(v as _Authenticated));

  @override
  _Authenticated get _value => super._value as _Authenticated;
}

/// @nodoc

class _$_Authenticated implements _Authenticated {
  const _$_Authenticated();

  @override
  String toString() {
    return 'PhoneLoginState.authenticated()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Authenticated);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isLoading) enterPhoneNumber,
    required TResult Function(String verificationId, int? resendToken)
        enterCode,
    required TResult Function() authenticated,
  }) {
    return authenticated();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool isLoading)? enterPhoneNumber,
    TResult Function(String verificationId, int? resendToken)? enterCode,
    TResult Function()? authenticated,
  }) {
    return authenticated?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isLoading)? enterPhoneNumber,
    TResult Function(String verificationId, int? resendToken)? enterCode,
    TResult Function()? authenticated,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EnterPhoneNumber value) enterPhoneNumber,
    required TResult Function(_EnterCode value) enterCode,
    required TResult Function(_Authenticated value) authenticated,
  }) {
    return authenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_EnterPhoneNumber value)? enterPhoneNumber,
    TResult Function(_EnterCode value)? enterCode,
    TResult Function(_Authenticated value)? authenticated,
  }) {
    return authenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EnterPhoneNumber value)? enterPhoneNumber,
    TResult Function(_EnterCode value)? enterCode,
    TResult Function(_Authenticated value)? authenticated,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(this);
    }
    return orElse();
  }
}

abstract class _Authenticated implements PhoneLoginState {
  const factory _Authenticated() = _$_Authenticated;
}
