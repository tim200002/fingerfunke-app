// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'live_config_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LiveConfigState {
  bool get newFeedItems => throw _privateConstructorUsedError;
  bool get pagedFeed => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool newFeedItems, bool pagedFeed) neutral,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool newFeedItems, bool pagedFeed)? neutral,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool newFeedItems, bool pagedFeed)? neutral,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Neutral value) neutral,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Neutral value)? neutral,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Neutral value)? neutral,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LiveConfigStateCopyWith<LiveConfigState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LiveConfigStateCopyWith<$Res> {
  factory $LiveConfigStateCopyWith(
          LiveConfigState value, $Res Function(LiveConfigState) then) =
      _$LiveConfigStateCopyWithImpl<$Res>;
  $Res call({bool newFeedItems, bool pagedFeed});
}

/// @nodoc
class _$LiveConfigStateCopyWithImpl<$Res>
    implements $LiveConfigStateCopyWith<$Res> {
  _$LiveConfigStateCopyWithImpl(this._value, this._then);

  final LiveConfigState _value;
  // ignore: unused_field
  final $Res Function(LiveConfigState) _then;

  @override
  $Res call({
    Object? newFeedItems = freezed,
    Object? pagedFeed = freezed,
  }) {
    return _then(_value.copyWith(
      newFeedItems: newFeedItems == freezed
          ? _value.newFeedItems
          : newFeedItems // ignore: cast_nullable_to_non_nullable
              as bool,
      pagedFeed: pagedFeed == freezed
          ? _value.pagedFeed
          : pagedFeed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_NeutralCopyWith<$Res>
    implements $LiveConfigStateCopyWith<$Res> {
  factory _$$_NeutralCopyWith(
          _$_Neutral value, $Res Function(_$_Neutral) then) =
      __$$_NeutralCopyWithImpl<$Res>;
  @override
  $Res call({bool newFeedItems, bool pagedFeed});
}

/// @nodoc
class __$$_NeutralCopyWithImpl<$Res> extends _$LiveConfigStateCopyWithImpl<$Res>
    implements _$$_NeutralCopyWith<$Res> {
  __$$_NeutralCopyWithImpl(_$_Neutral _value, $Res Function(_$_Neutral) _then)
      : super(_value, (v) => _then(v as _$_Neutral));

  @override
  _$_Neutral get _value => super._value as _$_Neutral;

  @override
  $Res call({
    Object? newFeedItems = freezed,
    Object? pagedFeed = freezed,
  }) {
    return _then(_$_Neutral(
      newFeedItems == freezed
          ? _value.newFeedItems
          : newFeedItems // ignore: cast_nullable_to_non_nullable
              as bool,
      pagedFeed == freezed
          ? _value.pagedFeed
          : pagedFeed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_Neutral implements _Neutral {
  const _$_Neutral(this.newFeedItems, this.pagedFeed);

  @override
  final bool newFeedItems;
  @override
  final bool pagedFeed;

  @override
  String toString() {
    return 'LiveConfigState.neutral(newFeedItems: $newFeedItems, pagedFeed: $pagedFeed)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Neutral &&
            const DeepCollectionEquality()
                .equals(other.newFeedItems, newFeedItems) &&
            const DeepCollectionEquality().equals(other.pagedFeed, pagedFeed));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(newFeedItems),
      const DeepCollectionEquality().hash(pagedFeed));

  @JsonKey(ignore: true)
  @override
  _$$_NeutralCopyWith<_$_Neutral> get copyWith =>
      __$$_NeutralCopyWithImpl<_$_Neutral>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool newFeedItems, bool pagedFeed) neutral,
  }) {
    return neutral(newFeedItems, pagedFeed);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool newFeedItems, bool pagedFeed)? neutral,
  }) {
    return neutral?.call(newFeedItems, pagedFeed);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool newFeedItems, bool pagedFeed)? neutral,
    required TResult orElse(),
  }) {
    if (neutral != null) {
      return neutral(newFeedItems, pagedFeed);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Neutral value) neutral,
  }) {
    return neutral(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Neutral value)? neutral,
  }) {
    return neutral?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Neutral value)? neutral,
    required TResult orElse(),
  }) {
    if (neutral != null) {
      return neutral(this);
    }
    return orElse();
  }
}

abstract class _Neutral implements LiveConfigState {
  const factory _Neutral(final bool newFeedItems, final bool pagedFeed) =
      _$_Neutral;

  @override
  bool get newFeedItems;
  @override
  bool get pagedFeed;
  @override
  @JsonKey(ignore: true)
  _$$_NeutralCopyWith<_$_Neutral> get copyWith =>
      throw _privateConstructorUsedError;
}
