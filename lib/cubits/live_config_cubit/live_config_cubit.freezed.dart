// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'live_config_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LiveConfigState {
  bool get hideFeedbackBtn => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LiveConfigStateCopyWith<LiveConfigState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LiveConfigStateCopyWith<$Res> {
  factory $LiveConfigStateCopyWith(
          LiveConfigState value, $Res Function(LiveConfigState) then) =
      _$LiveConfigStateCopyWithImpl<$Res, LiveConfigState>;
  @useResult
  $Res call({bool hideFeedbackBtn});
}

/// @nodoc
class _$LiveConfigStateCopyWithImpl<$Res, $Val extends LiveConfigState>
    implements $LiveConfigStateCopyWith<$Res> {
  _$LiveConfigStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hideFeedbackBtn = null,
  }) {
    return _then(_value.copyWith(
      hideFeedbackBtn: null == hideFeedbackBtn
          ? _value.hideFeedbackBtn
          : hideFeedbackBtn // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SCopyWith<$Res> implements $LiveConfigStateCopyWith<$Res> {
  factory _$$_SCopyWith(_$_S value, $Res Function(_$_S) then) =
      __$$_SCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool hideFeedbackBtn});
}

/// @nodoc
class __$$_SCopyWithImpl<$Res> extends _$LiveConfigStateCopyWithImpl<$Res, _$_S>
    implements _$$_SCopyWith<$Res> {
  __$$_SCopyWithImpl(_$_S _value, $Res Function(_$_S) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hideFeedbackBtn = null,
  }) {
    return _then(_$_S(
      null == hideFeedbackBtn
          ? _value.hideFeedbackBtn
          : hideFeedbackBtn // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_S implements _S {
  const _$_S(this.hideFeedbackBtn);

  @override
  final bool hideFeedbackBtn;

  @override
  String toString() {
    return 'LiveConfigState(hideFeedbackBtn: $hideFeedbackBtn)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_S &&
            (identical(other.hideFeedbackBtn, hideFeedbackBtn) ||
                other.hideFeedbackBtn == hideFeedbackBtn));
  }

  @override
  int get hashCode => Object.hash(runtimeType, hideFeedbackBtn);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SCopyWith<_$_S> get copyWith =>
      __$$_SCopyWithImpl<_$_S>(this, _$identity);
}

abstract class _S implements LiveConfigState {
  const factory _S(final bool hideFeedbackBtn) = _$_S;

  @override
  bool get hideFeedbackBtn;
  @override
  @JsonKey(ignore: true)
  _$$_SCopyWith<_$_S> get copyWith => throw _privateConstructorUsedError;
}
