// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'feed_filter_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FeedFilterState {
  double get distance => throw _privateConstructorUsedError;
  bool get hideCompleted => throw _privateConstructorUsedError;
  bool get hideFarFuture => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            double distance, bool hideCompleted, bool hideFarFuture)
        neutral,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(double distance, bool hideCompleted, bool hideFarFuture)?
        neutral,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double distance, bool hideCompleted, bool hideFarFuture)?
        neutral,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) neutral,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? neutral,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? neutral,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FeedFilterStateCopyWith<FeedFilterState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeedFilterStateCopyWith<$Res> {
  factory $FeedFilterStateCopyWith(
          FeedFilterState value, $Res Function(FeedFilterState) then) =
      _$FeedFilterStateCopyWithImpl<$Res>;
  $Res call({double distance, bool hideCompleted, bool hideFarFuture});
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
    Object? distance = freezed,
    Object? hideCompleted = freezed,
    Object? hideFarFuture = freezed,
  }) {
    return _then(_value.copyWith(
      distance: distance == freezed
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double,
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
abstract class _$$_InitialCopyWith<$Res>
    implements $FeedFilterStateCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
  @override
  $Res call({double distance, bool hideCompleted, bool hideFarFuture});
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res> extends _$FeedFilterStateCopyWithImpl<$Res>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, (v) => _then(v as _$_Initial));

  @override
  _$_Initial get _value => super._value as _$_Initial;

  @override
  $Res call({
    Object? distance = freezed,
    Object? hideCompleted = freezed,
    Object? hideFarFuture = freezed,
  }) {
    return _then(_$_Initial(
      distance == freezed
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double,
      hideCompleted == freezed
          ? _value.hideCompleted
          : hideCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      hideFarFuture == freezed
          ? _value.hideFarFuture
          : hideFarFuture // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial(this.distance, this.hideCompleted, this.hideFarFuture);

  @override
  final double distance;
  @override
  final bool hideCompleted;
  @override
  final bool hideFarFuture;

  @override
  String toString() {
    return 'FeedFilterState.neutral(distance: $distance, hideCompleted: $hideCompleted, hideFarFuture: $hideFarFuture)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Initial &&
            const DeepCollectionEquality().equals(other.distance, distance) &&
            const DeepCollectionEquality()
                .equals(other.hideCompleted, hideCompleted) &&
            const DeepCollectionEquality()
                .equals(other.hideFarFuture, hideFarFuture));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(distance),
      const DeepCollectionEquality().hash(hideCompleted),
      const DeepCollectionEquality().hash(hideFarFuture));

  @JsonKey(ignore: true)
  @override
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      __$$_InitialCopyWithImpl<_$_Initial>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            double distance, bool hideCompleted, bool hideFarFuture)
        neutral,
  }) {
    return neutral(distance, hideCompleted, hideFarFuture);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(double distance, bool hideCompleted, bool hideFarFuture)?
        neutral,
  }) {
    return neutral?.call(distance, hideCompleted, hideFarFuture);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double distance, bool hideCompleted, bool hideFarFuture)?
        neutral,
    required TResult orElse(),
  }) {
    if (neutral != null) {
      return neutral(distance, hideCompleted, hideFarFuture);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) neutral,
  }) {
    return neutral(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? neutral,
  }) {
    return neutral?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? neutral,
    required TResult orElse(),
  }) {
    if (neutral != null) {
      return neutral(this);
    }
    return orElse();
  }
}

abstract class _Initial implements FeedFilterState {
  const factory _Initial(final double distance, final bool hideCompleted,
      final bool hideFarFuture) = _$_Initial;

  @override
  double get distance;
  @override
  bool get hideCompleted;
  @override
  bool get hideFarFuture;
  @override
  @JsonKey(ignore: true)
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      throw _privateConstructorUsedError;
}
