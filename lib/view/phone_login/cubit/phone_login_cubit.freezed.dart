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

  _EnterPhoneNumber enterPhoneNumber({String? withErrorMessage}) {
    return _EnterPhoneNumber(
      withErrorMessage: withErrorMessage,
    );
  }

  _WaitForCodeSent waitForCodeSent() {
    return const _WaitForCodeSent();
  }

  _EnterCode enterCode(
      {required String verificationId, String? withErrorMessage}) {
    return _EnterCode(
      verificationId: verificationId,
      withErrorMessage: withErrorMessage,
    );
  }

  _WaitForLogin waitForLogIn() {
    return const _WaitForLogin();
  }
}

/// @nodoc
const $PhoneLoginState = _$PhoneLoginStateTearOff();

/// @nodoc
mixin _$PhoneLoginState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? withErrorMessage) enterPhoneNumber,
    required TResult Function() waitForCodeSent,
    required TResult Function(String verificationId, String? withErrorMessage)
        enterCode,
    required TResult Function() waitForLogIn,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String? withErrorMessage)? enterPhoneNumber,
    TResult Function()? waitForCodeSent,
    TResult Function(String verificationId, String? withErrorMessage)?
        enterCode,
    TResult Function()? waitForLogIn,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? withErrorMessage)? enterPhoneNumber,
    TResult Function()? waitForCodeSent,
    TResult Function(String verificationId, String? withErrorMessage)?
        enterCode,
    TResult Function()? waitForLogIn,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EnterPhoneNumber value) enterPhoneNumber,
    required TResult Function(_WaitForCodeSent value) waitForCodeSent,
    required TResult Function(_EnterCode value) enterCode,
    required TResult Function(_WaitForLogin value) waitForLogIn,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_EnterPhoneNumber value)? enterPhoneNumber,
    TResult Function(_WaitForCodeSent value)? waitForCodeSent,
    TResult Function(_EnterCode value)? enterCode,
    TResult Function(_WaitForLogin value)? waitForLogIn,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EnterPhoneNumber value)? enterPhoneNumber,
    TResult Function(_WaitForCodeSent value)? waitForCodeSent,
    TResult Function(_EnterCode value)? enterCode,
    TResult Function(_WaitForLogin value)? waitForLogIn,
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
  $Res call({String? withErrorMessage});
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
    Object? withErrorMessage = freezed,
  }) {
    return _then(_EnterPhoneNumber(
      withErrorMessage: withErrorMessage == freezed
          ? _value.withErrorMessage
          : withErrorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_EnterPhoneNumber implements _EnterPhoneNumber {
  const _$_EnterPhoneNumber({this.withErrorMessage});

  @override
  final String? withErrorMessage;

  @override
  String toString() {
    return 'PhoneLoginState.enterPhoneNumber(withErrorMessage: $withErrorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _EnterPhoneNumber &&
            (identical(other.withErrorMessage, withErrorMessage) ||
                other.withErrorMessage == withErrorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, withErrorMessage);

  @JsonKey(ignore: true)
  @override
  _$EnterPhoneNumberCopyWith<_EnterPhoneNumber> get copyWith =>
      __$EnterPhoneNumberCopyWithImpl<_EnterPhoneNumber>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? withErrorMessage) enterPhoneNumber,
    required TResult Function() waitForCodeSent,
    required TResult Function(String verificationId, String? withErrorMessage)
        enterCode,
    required TResult Function() waitForLogIn,
  }) {
    return enterPhoneNumber(withErrorMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String? withErrorMessage)? enterPhoneNumber,
    TResult Function()? waitForCodeSent,
    TResult Function(String verificationId, String? withErrorMessage)?
        enterCode,
    TResult Function()? waitForLogIn,
  }) {
    return enterPhoneNumber?.call(withErrorMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? withErrorMessage)? enterPhoneNumber,
    TResult Function()? waitForCodeSent,
    TResult Function(String verificationId, String? withErrorMessage)?
        enterCode,
    TResult Function()? waitForLogIn,
    required TResult orElse(),
  }) {
    if (enterPhoneNumber != null) {
      return enterPhoneNumber(withErrorMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EnterPhoneNumber value) enterPhoneNumber,
    required TResult Function(_WaitForCodeSent value) waitForCodeSent,
    required TResult Function(_EnterCode value) enterCode,
    required TResult Function(_WaitForLogin value) waitForLogIn,
  }) {
    return enterPhoneNumber(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_EnterPhoneNumber value)? enterPhoneNumber,
    TResult Function(_WaitForCodeSent value)? waitForCodeSent,
    TResult Function(_EnterCode value)? enterCode,
    TResult Function(_WaitForLogin value)? waitForLogIn,
  }) {
    return enterPhoneNumber?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EnterPhoneNumber value)? enterPhoneNumber,
    TResult Function(_WaitForCodeSent value)? waitForCodeSent,
    TResult Function(_EnterCode value)? enterCode,
    TResult Function(_WaitForLogin value)? waitForLogIn,
    required TResult orElse(),
  }) {
    if (enterPhoneNumber != null) {
      return enterPhoneNumber(this);
    }
    return orElse();
  }
}

abstract class _EnterPhoneNumber implements PhoneLoginState {
  const factory _EnterPhoneNumber({String? withErrorMessage}) =
      _$_EnterPhoneNumber;

  String? get withErrorMessage;
  @JsonKey(ignore: true)
  _$EnterPhoneNumberCopyWith<_EnterPhoneNumber> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$WaitForCodeSentCopyWith<$Res> {
  factory _$WaitForCodeSentCopyWith(
          _WaitForCodeSent value, $Res Function(_WaitForCodeSent) then) =
      __$WaitForCodeSentCopyWithImpl<$Res>;
}

/// @nodoc
class __$WaitForCodeSentCopyWithImpl<$Res>
    extends _$PhoneLoginStateCopyWithImpl<$Res>
    implements _$WaitForCodeSentCopyWith<$Res> {
  __$WaitForCodeSentCopyWithImpl(
      _WaitForCodeSent _value, $Res Function(_WaitForCodeSent) _then)
      : super(_value, (v) => _then(v as _WaitForCodeSent));

  @override
  _WaitForCodeSent get _value => super._value as _WaitForCodeSent;
}

/// @nodoc

class _$_WaitForCodeSent implements _WaitForCodeSent {
  const _$_WaitForCodeSent();

  @override
  String toString() {
    return 'PhoneLoginState.waitForCodeSent()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _WaitForCodeSent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? withErrorMessage) enterPhoneNumber,
    required TResult Function() waitForCodeSent,
    required TResult Function(String verificationId, String? withErrorMessage)
        enterCode,
    required TResult Function() waitForLogIn,
  }) {
    return waitForCodeSent();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String? withErrorMessage)? enterPhoneNumber,
    TResult Function()? waitForCodeSent,
    TResult Function(String verificationId, String? withErrorMessage)?
        enterCode,
    TResult Function()? waitForLogIn,
  }) {
    return waitForCodeSent?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? withErrorMessage)? enterPhoneNumber,
    TResult Function()? waitForCodeSent,
    TResult Function(String verificationId, String? withErrorMessage)?
        enterCode,
    TResult Function()? waitForLogIn,
    required TResult orElse(),
  }) {
    if (waitForCodeSent != null) {
      return waitForCodeSent();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EnterPhoneNumber value) enterPhoneNumber,
    required TResult Function(_WaitForCodeSent value) waitForCodeSent,
    required TResult Function(_EnterCode value) enterCode,
    required TResult Function(_WaitForLogin value) waitForLogIn,
  }) {
    return waitForCodeSent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_EnterPhoneNumber value)? enterPhoneNumber,
    TResult Function(_WaitForCodeSent value)? waitForCodeSent,
    TResult Function(_EnterCode value)? enterCode,
    TResult Function(_WaitForLogin value)? waitForLogIn,
  }) {
    return waitForCodeSent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EnterPhoneNumber value)? enterPhoneNumber,
    TResult Function(_WaitForCodeSent value)? waitForCodeSent,
    TResult Function(_EnterCode value)? enterCode,
    TResult Function(_WaitForLogin value)? waitForLogIn,
    required TResult orElse(),
  }) {
    if (waitForCodeSent != null) {
      return waitForCodeSent(this);
    }
    return orElse();
  }
}

abstract class _WaitForCodeSent implements PhoneLoginState {
  const factory _WaitForCodeSent() = _$_WaitForCodeSent;
}

/// @nodoc
abstract class _$EnterCodeCopyWith<$Res> {
  factory _$EnterCodeCopyWith(
          _EnterCode value, $Res Function(_EnterCode) then) =
      __$EnterCodeCopyWithImpl<$Res>;
  $Res call({String verificationId, String? withErrorMessage});
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
    Object? withErrorMessage = freezed,
  }) {
    return _then(_EnterCode(
      verificationId: verificationId == freezed
          ? _value.verificationId
          : verificationId // ignore: cast_nullable_to_non_nullable
              as String,
      withErrorMessage: withErrorMessage == freezed
          ? _value.withErrorMessage
          : withErrorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_EnterCode implements _EnterCode {
  const _$_EnterCode({required this.verificationId, this.withErrorMessage});

  @override
  final String verificationId;
  @override
  final String? withErrorMessage;

  @override
  String toString() {
    return 'PhoneLoginState.enterCode(verificationId: $verificationId, withErrorMessage: $withErrorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _EnterCode &&
            (identical(other.verificationId, verificationId) ||
                other.verificationId == verificationId) &&
            (identical(other.withErrorMessage, withErrorMessage) ||
                other.withErrorMessage == withErrorMessage));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, verificationId, withErrorMessage);

  @JsonKey(ignore: true)
  @override
  _$EnterCodeCopyWith<_EnterCode> get copyWith =>
      __$EnterCodeCopyWithImpl<_EnterCode>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? withErrorMessage) enterPhoneNumber,
    required TResult Function() waitForCodeSent,
    required TResult Function(String verificationId, String? withErrorMessage)
        enterCode,
    required TResult Function() waitForLogIn,
  }) {
    return enterCode(verificationId, withErrorMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String? withErrorMessage)? enterPhoneNumber,
    TResult Function()? waitForCodeSent,
    TResult Function(String verificationId, String? withErrorMessage)?
        enterCode,
    TResult Function()? waitForLogIn,
  }) {
    return enterCode?.call(verificationId, withErrorMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? withErrorMessage)? enterPhoneNumber,
    TResult Function()? waitForCodeSent,
    TResult Function(String verificationId, String? withErrorMessage)?
        enterCode,
    TResult Function()? waitForLogIn,
    required TResult orElse(),
  }) {
    if (enterCode != null) {
      return enterCode(verificationId, withErrorMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EnterPhoneNumber value) enterPhoneNumber,
    required TResult Function(_WaitForCodeSent value) waitForCodeSent,
    required TResult Function(_EnterCode value) enterCode,
    required TResult Function(_WaitForLogin value) waitForLogIn,
  }) {
    return enterCode(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_EnterPhoneNumber value)? enterPhoneNumber,
    TResult Function(_WaitForCodeSent value)? waitForCodeSent,
    TResult Function(_EnterCode value)? enterCode,
    TResult Function(_WaitForLogin value)? waitForLogIn,
  }) {
    return enterCode?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EnterPhoneNumber value)? enterPhoneNumber,
    TResult Function(_WaitForCodeSent value)? waitForCodeSent,
    TResult Function(_EnterCode value)? enterCode,
    TResult Function(_WaitForLogin value)? waitForLogIn,
    required TResult orElse(),
  }) {
    if (enterCode != null) {
      return enterCode(this);
    }
    return orElse();
  }
}

abstract class _EnterCode implements PhoneLoginState {
  const factory _EnterCode(
      {required String verificationId,
      String? withErrorMessage}) = _$_EnterCode;

  String get verificationId;
  String? get withErrorMessage;
  @JsonKey(ignore: true)
  _$EnterCodeCopyWith<_EnterCode> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$WaitForLoginCopyWith<$Res> {
  factory _$WaitForLoginCopyWith(
          _WaitForLogin value, $Res Function(_WaitForLogin) then) =
      __$WaitForLoginCopyWithImpl<$Res>;
}

/// @nodoc
class __$WaitForLoginCopyWithImpl<$Res>
    extends _$PhoneLoginStateCopyWithImpl<$Res>
    implements _$WaitForLoginCopyWith<$Res> {
  __$WaitForLoginCopyWithImpl(
      _WaitForLogin _value, $Res Function(_WaitForLogin) _then)
      : super(_value, (v) => _then(v as _WaitForLogin));

  @override
  _WaitForLogin get _value => super._value as _WaitForLogin;
}

/// @nodoc

class _$_WaitForLogin implements _WaitForLogin {
  const _$_WaitForLogin();

  @override
  String toString() {
    return 'PhoneLoginState.waitForLogIn()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _WaitForLogin);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? withErrorMessage) enterPhoneNumber,
    required TResult Function() waitForCodeSent,
    required TResult Function(String verificationId, String? withErrorMessage)
        enterCode,
    required TResult Function() waitForLogIn,
  }) {
    return waitForLogIn();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String? withErrorMessage)? enterPhoneNumber,
    TResult Function()? waitForCodeSent,
    TResult Function(String verificationId, String? withErrorMessage)?
        enterCode,
    TResult Function()? waitForLogIn,
  }) {
    return waitForLogIn?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? withErrorMessage)? enterPhoneNumber,
    TResult Function()? waitForCodeSent,
    TResult Function(String verificationId, String? withErrorMessage)?
        enterCode,
    TResult Function()? waitForLogIn,
    required TResult orElse(),
  }) {
    if (waitForLogIn != null) {
      return waitForLogIn();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EnterPhoneNumber value) enterPhoneNumber,
    required TResult Function(_WaitForCodeSent value) waitForCodeSent,
    required TResult Function(_EnterCode value) enterCode,
    required TResult Function(_WaitForLogin value) waitForLogIn,
  }) {
    return waitForLogIn(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_EnterPhoneNumber value)? enterPhoneNumber,
    TResult Function(_WaitForCodeSent value)? waitForCodeSent,
    TResult Function(_EnterCode value)? enterCode,
    TResult Function(_WaitForLogin value)? waitForLogIn,
  }) {
    return waitForLogIn?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EnterPhoneNumber value)? enterPhoneNumber,
    TResult Function(_WaitForCodeSent value)? waitForCodeSent,
    TResult Function(_EnterCode value)? enterCode,
    TResult Function(_WaitForLogin value)? waitForLogIn,
    required TResult orElse(),
  }) {
    if (waitForLogIn != null) {
      return waitForLogIn(this);
    }
    return orElse();
  }
}

abstract class _WaitForLogin implements PhoneLoginState {
  const factory _WaitForLogin() = _$_WaitForLogin;
}
