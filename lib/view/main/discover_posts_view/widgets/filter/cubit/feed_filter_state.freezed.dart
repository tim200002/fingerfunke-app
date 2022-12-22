// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'feed_filter_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FeedFilterState _$FeedFilterStateFromJson(Map<String, dynamic> json) {
  return _FeedFilterState.fromJson(json);
}

/// @nodoc
mixin _$FeedFilterState {
  int get radius => throw _privateConstructorUsedError;
  bool get hideCompleted => throw _privateConstructorUsedError;
  bool get hideFarFuture => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FeedFilterStateCopyWith<FeedFilterState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeedFilterStateCopyWith<$Res> {
  factory $FeedFilterStateCopyWith(
          FeedFilterState value, $Res Function(FeedFilterState) then) =
      _$FeedFilterStateCopyWithImpl<$Res>;
  $Res call({int radius, bool hideCompleted, bool hideFarFuture});
}

/// @nodoc
class _$FeedFilterStateCopyWithImpl<$Res>
    implements $FeedFilterStateCopyWith<$Res> {
  _$FeedFilterStateCopyWithImpl(this._value, this._then);

  final FeedFilterState _value;
  // ignore: unused_field
  final $Res Function(FeedFilterState) _then;

  @override
  $Res call({
    Object? radius = freezed,
    Object? hideCompleted = freezed,
    Object? hideFarFuture = freezed,
  }) {
    return _then(_value.copyWith(
      radius: radius == freezed
          ? _value.radius
          : radius // ignore: cast_nullable_to_non_nullable
              as int,
      hideCompleted: hideCompleted == freezed
          ? _value.hideCompleted
          : hideCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      hideFarFuture: hideFarFuture == freezed
          ? _value.hideFarFuture
          : hideFarFuture // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_FeedFilterStateCopyWith<$Res>
    implements $FeedFilterStateCopyWith<$Res> {
  factory _$$_FeedFilterStateCopyWith(
          _$_FeedFilterState value, $Res Function(_$_FeedFilterState) then) =
      __$$_FeedFilterStateCopyWithImpl<$Res>;
  @override
  $Res call({int radius, bool hideCompleted, bool hideFarFuture});
}

/// @nodoc
class __$$_FeedFilterStateCopyWithImpl<$Res>
    extends _$FeedFilterStateCopyWithImpl<$Res>
    implements _$$_FeedFilterStateCopyWith<$Res> {
  __$$_FeedFilterStateCopyWithImpl(
      _$_FeedFilterState _value, $Res Function(_$_FeedFilterState) _then)
      : super(_value, (v) => _then(v as _$_FeedFilterState));

  @override
  _$_FeedFilterState get _value => super._value as _$_FeedFilterState;

  @override
  $Res call({
    Object? radius = freezed,
    Object? hideCompleted = freezed,
    Object? hideFarFuture = freezed,
  }) {
    return _then(_$_FeedFilterState(
      radius: radius == freezed
          ? _value.radius
          : radius // ignore: cast_nullable_to_non_nullable
              as int,
      hideCompleted: hideCompleted == freezed
          ? _value.hideCompleted
          : hideCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      hideFarFuture: hideFarFuture == freezed
          ? _value.hideFarFuture
          : hideFarFuture // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FeedFilterState implements _FeedFilterState {
  const _$_FeedFilterState(
      {required this.radius,
      required this.hideCompleted,
      required this.hideFarFuture});

  factory _$_FeedFilterState.fromJson(Map<String, dynamic> json) =>
      _$$_FeedFilterStateFromJson(json);

  @override
  final int radius;
  @override
  final bool hideCompleted;
  @override
  final bool hideFarFuture;

  @JsonKey(ignore: true)
  @override
  _$$_FeedFilterStateCopyWith<_$_FeedFilterState> get copyWith =>
      __$$_FeedFilterStateCopyWithImpl<_$_FeedFilterState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FeedFilterStateToJson(
      this,
    );
  }
}

abstract class _FeedFilterState implements FeedFilterState {
  const factory _FeedFilterState(
      {required final int radius,
      required final bool hideCompleted,
      required final bool hideFarFuture}) = _$_FeedFilterState;

  factory _FeedFilterState.fromJson(Map<String, dynamic> json) =
      _$_FeedFilterState.fromJson;

  @override
  int get radius;
  @override
  bool get hideCompleted;
  @override
  bool get hideFarFuture;
  @override
  @JsonKey(ignore: true)
  _$$_FeedFilterStateCopyWith<_$_FeedFilterState> get copyWith =>
      throw _privateConstructorUsedError;
}
