// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_account_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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
      _$CreateAccountStateCopyWithImpl<$Res, CreateAccountState>;
  @useResult
  $Res call({String name, bool inputValid});
}

/// @nodoc
class _$CreateAccountStateCopyWithImpl<$Res, $Val extends CreateAccountState>
    implements $CreateAccountStateCopyWith<$Res> {
  _$CreateAccountStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? inputValid = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      inputValid: null == inputValid
          ? _value.inputValid
          : inputValid // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CreateAccountStateCopyWith<$Res>
    implements $CreateAccountStateCopyWith<$Res> {
  factory _$$_CreateAccountStateCopyWith(_$_CreateAccountState value,
          $Res Function(_$_CreateAccountState) then) =
      __$$_CreateAccountStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, bool inputValid});
}

/// @nodoc
class __$$_CreateAccountStateCopyWithImpl<$Res>
    extends _$CreateAccountStateCopyWithImpl<$Res, _$_CreateAccountState>
    implements _$$_CreateAccountStateCopyWith<$Res> {
  __$$_CreateAccountStateCopyWithImpl(
      _$_CreateAccountState _value, $Res Function(_$_CreateAccountState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? inputValid = null,
  }) {
    return _then(_$_CreateAccountState(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      inputValid: null == inputValid
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
  @override
  @JsonKey()
  final bool inputValid;

  @override
  String toString() {
    return 'CreateAccountState(name: $name, inputValid: $inputValid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CreateAccountState &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.inputValid, inputValid) ||
                other.inputValid == inputValid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, inputValid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CreateAccountStateCopyWith<_$_CreateAccountState> get copyWith =>
      __$$_CreateAccountStateCopyWithImpl<_$_CreateAccountState>(
          this, _$identity);
}

abstract class _CreateAccountState implements CreateAccountState {
  const factory _CreateAccountState(
      {required final String name,
      final bool inputValid}) = _$_CreateAccountState;

  @override
  String get name;
  @override
  bool get inputValid;
  @override
  @JsonKey(ignore: true)
  _$$_CreateAccountStateCopyWith<_$_CreateAccountState> get copyWith =>
      throw _privateConstructorUsedError;
}
