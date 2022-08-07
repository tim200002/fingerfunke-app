// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'video_playback_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$VideoPlaybackState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializing,
    required TResult Function(
            VideoPlayerController videoPlayerController, bool isPlaying)
        playing,
    required TResult Function(Object error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initializing,
    TResult Function(
            VideoPlayerController videoPlayerController, bool isPlaying)?
        playing,
    TResult Function(Object error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializing,
    TResult Function(
            VideoPlayerController videoPlayerController, bool isPlaying)?
        playing,
    TResult Function(Object error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initializing value) initializing,
    required TResult Function(_Playing value) playing,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initializing value)? initializing,
    TResult Function(_Playing value)? playing,
    TResult Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initializing value)? initializing,
    TResult Function(_Playing value)? playing,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VideoPlaybackStateCopyWith<$Res> {
  factory $VideoPlaybackStateCopyWith(
          VideoPlaybackState value, $Res Function(VideoPlaybackState) then) =
      _$VideoPlaybackStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$VideoPlaybackStateCopyWithImpl<$Res>
    implements $VideoPlaybackStateCopyWith<$Res> {
  _$VideoPlaybackStateCopyWithImpl(this._value, this._then);

  final VideoPlaybackState _value;
  // ignore: unused_field
  final $Res Function(VideoPlaybackState) _then;
}

/// @nodoc
abstract class _$$_InitializingCopyWith<$Res> {
  factory _$$_InitializingCopyWith(
          _$_Initializing value, $Res Function(_$_Initializing) then) =
      __$$_InitializingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitializingCopyWithImpl<$Res>
    extends _$VideoPlaybackStateCopyWithImpl<$Res>
    implements _$$_InitializingCopyWith<$Res> {
  __$$_InitializingCopyWithImpl(
      _$_Initializing _value, $Res Function(_$_Initializing) _then)
      : super(_value, (v) => _then(v as _$_Initializing));

  @override
  _$_Initializing get _value => super._value as _$_Initializing;
}

/// @nodoc

class _$_Initializing implements _Initializing {
  const _$_Initializing();

  @override
  String toString() {
    return 'VideoPlaybackState.initializing()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Initializing);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializing,
    required TResult Function(
            VideoPlayerController videoPlayerController, bool isPlaying)
        playing,
    required TResult Function(Object error) error,
  }) {
    return initializing();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initializing,
    TResult Function(
            VideoPlayerController videoPlayerController, bool isPlaying)?
        playing,
    TResult Function(Object error)? error,
  }) {
    return initializing?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializing,
    TResult Function(
            VideoPlayerController videoPlayerController, bool isPlaying)?
        playing,
    TResult Function(Object error)? error,
    required TResult orElse(),
  }) {
    if (initializing != null) {
      return initializing();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initializing value) initializing,
    required TResult Function(_Playing value) playing,
    required TResult Function(_Error value) error,
  }) {
    return initializing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initializing value)? initializing,
    TResult Function(_Playing value)? playing,
    TResult Function(_Error value)? error,
  }) {
    return initializing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initializing value)? initializing,
    TResult Function(_Playing value)? playing,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initializing != null) {
      return initializing(this);
    }
    return orElse();
  }
}

abstract class _Initializing implements VideoPlaybackState {
  const factory _Initializing() = _$_Initializing;
}

/// @nodoc
abstract class _$$_PlayingCopyWith<$Res> {
  factory _$$_PlayingCopyWith(
          _$_Playing value, $Res Function(_$_Playing) then) =
      __$$_PlayingCopyWithImpl<$Res>;
  $Res call({VideoPlayerController videoPlayerController, bool isPlaying});
}

/// @nodoc
class __$$_PlayingCopyWithImpl<$Res>
    extends _$VideoPlaybackStateCopyWithImpl<$Res>
    implements _$$_PlayingCopyWith<$Res> {
  __$$_PlayingCopyWithImpl(_$_Playing _value, $Res Function(_$_Playing) _then)
      : super(_value, (v) => _then(v as _$_Playing));

  @override
  _$_Playing get _value => super._value as _$_Playing;

  @override
  $Res call({
    Object? videoPlayerController = freezed,
    Object? isPlaying = freezed,
  }) {
    return _then(_$_Playing(
      videoPlayerController == freezed
          ? _value.videoPlayerController
          : videoPlayerController // ignore: cast_nullable_to_non_nullable
              as VideoPlayerController,
      isPlaying == freezed
          ? _value.isPlaying
          : isPlaying // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_Playing implements _Playing {
  const _$_Playing(this.videoPlayerController, this.isPlaying);

  @override
  final VideoPlayerController videoPlayerController;
  @override
  final bool isPlaying;

  @override
  String toString() {
    return 'VideoPlaybackState.playing(videoPlayerController: $videoPlayerController, isPlaying: $isPlaying)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Playing &&
            const DeepCollectionEquality()
                .equals(other.videoPlayerController, videoPlayerController) &&
            const DeepCollectionEquality().equals(other.isPlaying, isPlaying));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(videoPlayerController),
      const DeepCollectionEquality().hash(isPlaying));

  @JsonKey(ignore: true)
  @override
  _$$_PlayingCopyWith<_$_Playing> get copyWith =>
      __$$_PlayingCopyWithImpl<_$_Playing>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializing,
    required TResult Function(
            VideoPlayerController videoPlayerController, bool isPlaying)
        playing,
    required TResult Function(Object error) error,
  }) {
    return playing(videoPlayerController, isPlaying);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initializing,
    TResult Function(
            VideoPlayerController videoPlayerController, bool isPlaying)?
        playing,
    TResult Function(Object error)? error,
  }) {
    return playing?.call(videoPlayerController, isPlaying);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializing,
    TResult Function(
            VideoPlayerController videoPlayerController, bool isPlaying)?
        playing,
    TResult Function(Object error)? error,
    required TResult orElse(),
  }) {
    if (playing != null) {
      return playing(videoPlayerController, isPlaying);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initializing value) initializing,
    required TResult Function(_Playing value) playing,
    required TResult Function(_Error value) error,
  }) {
    return playing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initializing value)? initializing,
    TResult Function(_Playing value)? playing,
    TResult Function(_Error value)? error,
  }) {
    return playing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initializing value)? initializing,
    TResult Function(_Playing value)? playing,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (playing != null) {
      return playing(this);
    }
    return orElse();
  }
}

abstract class _Playing implements VideoPlaybackState {
  const factory _Playing(final VideoPlayerController videoPlayerController,
      final bool isPlaying) = _$_Playing;

  VideoPlayerController get videoPlayerController;
  bool get isPlaying;
  @JsonKey(ignore: true)
  _$$_PlayingCopyWith<_$_Playing> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ErrorCopyWith<$Res> {
  factory _$$_ErrorCopyWith(_$_Error value, $Res Function(_$_Error) then) =
      __$$_ErrorCopyWithImpl<$Res>;
  $Res call({Object error});
}

/// @nodoc
class __$$_ErrorCopyWithImpl<$Res>
    extends _$VideoPlaybackStateCopyWithImpl<$Res>
    implements _$$_ErrorCopyWith<$Res> {
  __$$_ErrorCopyWithImpl(_$_Error _value, $Res Function(_$_Error) _then)
      : super(_value, (v) => _then(v as _$_Error));

  @override
  _$_Error get _value => super._value as _$_Error;

  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$_Error(
      error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Object,
    ));
  }
}

/// @nodoc

class _$_Error implements _Error {
  const _$_Error(this.error);

  @override
  final Object error;

  @override
  String toString() {
    return 'VideoPlaybackState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Error &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  _$$_ErrorCopyWith<_$_Error> get copyWith =>
      __$$_ErrorCopyWithImpl<_$_Error>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializing,
    required TResult Function(
            VideoPlayerController videoPlayerController, bool isPlaying)
        playing,
    required TResult Function(Object error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initializing,
    TResult Function(
            VideoPlayerController videoPlayerController, bool isPlaying)?
        playing,
    TResult Function(Object error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializing,
    TResult Function(
            VideoPlayerController videoPlayerController, bool isPlaying)?
        playing,
    TResult Function(Object error)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initializing value) initializing,
    required TResult Function(_Playing value) playing,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initializing value)? initializing,
    TResult Function(_Playing value)? playing,
    TResult Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initializing value)? initializing,
    TResult Function(_Playing value)? playing,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements VideoPlaybackState {
  const factory _Error(final Object error) = _$_Error;

  Object get error;
  @JsonKey(ignore: true)
  _$$_ErrorCopyWith<_$_Error> get copyWith =>
      throw _privateConstructorUsedError;
}
