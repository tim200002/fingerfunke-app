// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'create_account_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$CreateAccountStateTearOff {
  const _$CreateAccountStateTearOff();

  _CreateAccountState call({required String name, bool inputValid = false}) {
    return _CreateAccountState(
      name: name,
      inputValid: inputValid,
    );
  }
}

/// @nodoc
const $CreateAccountState = _$CreateAccountStateTearOff();

/// @nodoc
mixin _$CreateAccountState {
  String get name => throw _privateConstructorUsedError;
  bool get inputValid => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CreateAccountStateCopyWith<CreateAccountState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateAccountStateCopyWith<$Res> {
  factory $CreateAccountStateCopyWith(
          CreateAccountState value, $Res Function(CreateAccountState) then) =
      _$CreateAccountStateCopyWithImpl<$Res>;
  $Res call({String name, bool inputValid});
}

/// @nodoc
class _$CreateAccountStateCopyWithImpl<$Res>
    implements $CreateAccountStateCopyWith<$Res> {
  _$CreateAccountStateCopyWithImpl(this._value, this._then);

  final CreateAccountState _value;
  // ignore: unused_field
  final $Res Function(CreateAccountState) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? inputValid = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      inputValid: inputValid == freezed
          ? _value.inputValid
          : inputValid // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$CreateAccountStateCopyWith<$Res>
    implements $CreateAccountStateCopyWith<$Res> {
  factory _$CreateAccountStateCopyWith(
          _CreateAccountState value, $Res Function(_CreateAccountState) then) =
      __$CreateAccountStateCopyWithImpl<$Res>;
  @override
  $Res call({String name, bool inputValid});
}

/// @nodoc
class __$CreateAccountStateCopyWithImpl<$Res>
    extends _$CreateAccountStateCopyWithImpl<$Res>
    implements _$CreateAccountStateCopyWith<$Res> {
  __$CreateAccountStateCopyWithImpl(
      _CreateAccountState _value, $Res Function(_CreateAccountState) _then)
      : super(_value, (v) => _then(v as _CreateAccountState));

  @override
  _CreateAccountState get _value => super._value as _CreateAccountState;

  @override
  $Res call({
    Object? name = freezed,
    Object? inputValid = freezed,
  }) {
    return _then(_CreateAccountState(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      inputValid: inputValid == freezed
          ? _value.inputValid
          : inputValid // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_CreateAccountState implements _CreateAccountState {
  const _$_CreateAccountState({required this.name, this.inputValid = false});

  @override
  final String name;
  @JsonKey(defaultValue: false)
  @override
  final bool inputValid;

  @override
  String toString() {
    return 'CreateAccountState(name: $name, inputValid: $inputValid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CreateAccountState &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.inputValid, inputValid) ||
                other.inputValid == inputValid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, inputValid);

  @JsonKey(ignore: true)
  @override
  _$CreateAccountStateCopyWith<_CreateAccountState> get copyWith =>
      __$CreateAccountStateCopyWithImpl<_CreateAccountState>(this, _$identity);
}

abstract class _CreateAccountState implements CreateAccountState {
  const factory _CreateAccountState({required String name, bool inputValid}) =
      _$_CreateAccountState;

  @override
  String get name;
  @override
  bool get inputValid;
  @override
  @JsonKey(ignore: true)
  _$CreateAccountStateCopyWith<_CreateAccountState> get copyWith =>
      throw _privateConstructorUsedError;
}
