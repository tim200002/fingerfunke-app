// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'phone_login_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PhoneLoginState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? withErrorMessage) enterPhoneNumber,
    required TResult Function() waitForCodeSent,
    required TResult Function(
            String verificationId, bool autoDetecting, String? withErrorMessage)
        enterCode,
    required TResult Function() waitForLogIn,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String? withErrorMessage)? enterPhoneNumber,
    TResult Function()? waitForCodeSent,
    TResult Function(String verificationId, bool autoDetecting,
            String? withErrorMessage)?
        enterCode,
    TResult Function()? waitForLogIn,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? withErrorMessage)? enterPhoneNumber,
    TResult Function()? waitForCodeSent,
    TResult Function(String verificationId, bool autoDetecting,
            String? withErrorMessage)?
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
abstract class _$$_EnterPhoneNumberCopyWith<$Res> {
  factory _$$_EnterPhoneNumberCopyWith(
          _$_EnterPhoneNumber value, $Res Function(_$_EnterPhoneNumber) then) =
      __$$_EnterPhoneNumberCopyWithImpl<$Res>;
  $Res call({String? withErrorMessage});
}

/// @nodoc
class __$$_EnterPhoneNumberCopyWithImpl<$Res>
    extends _$PhoneLoginStateCopyWithImpl<$Res>
    implements _$$_EnterPhoneNumberCopyWith<$Res> {
  __$$_EnterPhoneNumberCopyWithImpl(
      _$_EnterPhoneNumber _value, $Res Function(_$_EnterPhoneNumber) _then)
      : super(_value, (v) => _then(v as _$_EnterPhoneNumber));

  @override
  _$_EnterPhoneNumber get _value => super._value as _$_EnterPhoneNumber;

  @override
  $Res call({
    Object? withErrorMessage = freezed,
  }) {
    return _then(_$_EnterPhoneNumber(
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
            other is _$_EnterPhoneNumber &&
            const DeepCollectionEquality()
                .equals(other.withErrorMessage, withErrorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(withErrorMessage));

  @JsonKey(ignore: true)
  @override
  _$$_EnterPhoneNumberCopyWith<_$_EnterPhoneNumber> get copyWith =>
      __$$_EnterPhoneNumberCopyWithImpl<_$_EnterPhoneNumber>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? withErrorMessage) enterPhoneNumber,
    required TResult Function() waitForCodeSent,
    required TResult Function(
            String verificationId, bool autoDetecting, String? withErrorMessage)
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
    TResult Function(String verificationId, bool autoDetecting,
            String? withErrorMessage)?
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
    TResult Function(String verificationId, bool autoDetecting,
            String? withErrorMessage)?
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
  const factory _EnterPhoneNumber({final String? withErrorMessage}) =
      _$_EnterPhoneNumber;

  String? get withErrorMessage;
  @JsonKey(ignore: true)
  _$$_EnterPhoneNumberCopyWith<_$_EnterPhoneNumber> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_WaitForCodeSentCopyWith<$Res> {
  factory _$$_WaitForCodeSentCopyWith(
          _$_WaitForCodeSent value, $Res Function(_$_WaitForCodeSent) then) =
      __$$_WaitForCodeSentCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_WaitForCodeSentCopyWithImpl<$Res>
    extends _$PhoneLoginStateCopyWithImpl<$Res>
    implements _$$_WaitForCodeSentCopyWith<$Res> {
  __$$_WaitForCodeSentCopyWithImpl(
      _$_WaitForCodeSent _value, $Res Function(_$_WaitForCodeSent) _then)
      : super(_value, (v) => _then(v as _$_WaitForCodeSent));

  @override
  _$_WaitForCodeSent get _value => super._value as _$_WaitForCodeSent;
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
        (other.runtimeType == runtimeType && other is _$_WaitForCodeSent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? withErrorMessage) enterPhoneNumber,
    required TResult Function() waitForCodeSent,
    required TResult Function(
            String verificationId, bool autoDetecting, String? withErrorMessage)
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
    TResult Function(String verificationId, bool autoDetecting,
            String? withErrorMessage)?
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
    TResult Function(String verificationId, bool autoDetecting,
            String? withErrorMessage)?
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
abstract class _$$_EnterCodeCopyWith<$Res> {
  factory _$$_EnterCodeCopyWith(
          _$_EnterCode value, $Res Function(_$_EnterCode) then) =
      __$$_EnterCodeCopyWithImpl<$Res>;
  $Res call(
      {String verificationId, bool autoDetecting, String? withErrorMessage});
}

/// @nodoc
class __$$_EnterCodeCopyWithImpl<$Res>
    extends _$PhoneLoginStateCopyWithImpl<$Res>
    implements _$$_EnterCodeCopyWith<$Res> {
  __$$_EnterCodeCopyWithImpl(
      _$_EnterCode _value, $Res Function(_$_EnterCode) _then)
      : super(_value, (v) => _then(v as _$_EnterCode));

  @override
  _$_EnterCode get _value => super._value as _$_EnterCode;

  @override
  $Res call({
    Object? verificationId = freezed,
    Object? autoDetecting = freezed,
    Object? withErrorMessage = freezed,
  }) {
    return _then(_$_EnterCode(
      verificationId: verificationId == freezed
          ? _value.verificationId
          : verificationId // ignore: cast_nullable_to_non_nullable
              as String,
      autoDetecting: autoDetecting == freezed
          ? _value.autoDetecting
          : autoDetecting // ignore: cast_nullable_to_non_nullable
              as bool,
      withErrorMessage: withErrorMessage == freezed
          ? _value.withErrorMessage
          : withErrorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_EnterCode implements _EnterCode {
  const _$_EnterCode(
      {required this.verificationId,
      required this.autoDetecting,
      this.withErrorMessage});

  @override
  final String verificationId;
  @override
  final bool autoDetecting;
  @override
  final String? withErrorMessage;

  @override
  String toString() {
    return 'PhoneLoginState.enterCode(verificationId: $verificationId, autoDetecting: $autoDetecting, withErrorMessage: $withErrorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EnterCode &&
            const DeepCollectionEquality()
                .equals(other.verificationId, verificationId) &&
            const DeepCollectionEquality()
                .equals(other.autoDetecting, autoDetecting) &&
            const DeepCollectionEquality()
                .equals(other.withErrorMessage, withErrorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(verificationId),
      const DeepCollectionEquality().hash(autoDetecting),
      const DeepCollectionEquality().hash(withErrorMessage));

  @JsonKey(ignore: true)
  @override
  _$$_EnterCodeCopyWith<_$_EnterCode> get copyWith =>
      __$$_EnterCodeCopyWithImpl<_$_EnterCode>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? withErrorMessage) enterPhoneNumber,
    required TResult Function() waitForCodeSent,
    required TResult Function(
            String verificationId, bool autoDetecting, String? withErrorMessage)
        enterCode,
    required TResult Function() waitForLogIn,
  }) {
    return enterCode(verificationId, autoDetecting, withErrorMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String? withErrorMessage)? enterPhoneNumber,
    TResult Function()? waitForCodeSent,
    TResult Function(String verificationId, bool autoDetecting,
            String? withErrorMessage)?
        enterCode,
    TResult Function()? waitForLogIn,
  }) {
    return enterCode?.call(verificationId, autoDetecting, withErrorMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? withErrorMessage)? enterPhoneNumber,
    TResult Function()? waitForCodeSent,
    TResult Function(String verificationId, bool autoDetecting,
            String? withErrorMessage)?
        enterCode,
    TResult Function()? waitForLogIn,
    required TResult orElse(),
  }) {
    if (enterCode != null) {
      return enterCode(verificationId, autoDetecting, withErrorMessage);
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
      {required final String verificationId,
      required final bool autoDetecting,
      final String? withErrorMessage}) = _$_EnterCode;

  String get verificationId;
  bool get autoDetecting;
  String? get withErrorMessage;
  @JsonKey(ignore: true)
  _$$_EnterCodeCopyWith<_$_EnterCode> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_WaitForLoginCopyWith<$Res> {
  factory _$$_WaitForLoginCopyWith(
          _$_WaitForLogin value, $Res Function(_$_WaitForLogin) then) =
      __$$_WaitForLoginCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_WaitForLoginCopyWithImpl<$Res>
    extends _$PhoneLoginStateCopyWithImpl<$Res>
    implements _$$_WaitForLoginCopyWith<$Res> {
  __$$_WaitForLoginCopyWithImpl(
      _$_WaitForLogin _value, $Res Function(_$_WaitForLogin) _then)
      : super(_value, (v) => _then(v as _$_WaitForLogin));

  @override
  _$_WaitForLogin get _value => super._value as _$_WaitForLogin;
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
        (other.runtimeType == runtimeType && other is _$_WaitForLogin);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? withErrorMessage) enterPhoneNumber,
    required TResult Function() waitForCodeSent,
    required TResult Function(
            String verificationId, bool autoDetecting, String? withErrorMessage)
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
    TResult Function(String verificationId, bool autoDetecting,
            String? withErrorMessage)?
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
    TResult Function(String verificationId, bool autoDetecting,
            String? withErrorMessage)?
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
