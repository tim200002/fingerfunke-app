// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'video_recorder_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$VideoRecorderStateTearOff {
  const _$VideoRecorderStateTearOff();

  _Loading loading() {
    return const _Loading();
  }

  _Error error(dynamic err) {
    return _Error(
      err,
    );
  }

  _Previewing camera(
      CameraController controller, CameraSettings cameraSettings) {
    return _Previewing(
      controller,
      cameraSettings,
    );
  }

  _Recording recording(CameraController controller, int startTime) {
    return _Recording(
      controller,
      startTime,
    );
  }

  _Viewing viewing(String filepath, VideoPlayerController videoController) {
    return _Viewing(
      filepath,
      videoController,
    );
  }
}

/// @nodoc
const $VideoRecorderState = _$VideoRecorderStateTearOff();

/// @nodoc
mixin _$VideoRecorderState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(dynamic err) error,
    required TResult Function(
            CameraController controller, CameraSettings cameraSettings)
        camera,
    required TResult Function(CameraController controller, int startTime)
        recording,
    required TResult Function(
            String filepath, VideoPlayerController videoController)
        viewing,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(dynamic err)? error,
    TResult Function(
            CameraController controller, CameraSettings cameraSettings)?
        camera,
    TResult Function(CameraController controller, int startTime)? recording,
    TResult Function(String filepath, VideoPlayerController videoController)?
        viewing,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(dynamic err)? error,
    TResult Function(
            CameraController controller, CameraSettings cameraSettings)?
        camera,
    TResult Function(CameraController controller, int startTime)? recording,
    TResult Function(String filepath, VideoPlayerController videoController)?
        viewing,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_Previewing value) camera,
    required TResult Function(_Recording value) recording,
    required TResult Function(_Viewing value) viewing,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_Previewing value)? camera,
    TResult Function(_Recording value)? recording,
    TResult Function(_Viewing value)? viewing,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_Previewing value)? camera,
    TResult Function(_Recording value)? recording,
    TResult Function(_Viewing value)? viewing,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VideoRecorderStateCopyWith<$Res> {
  factory $VideoRecorderStateCopyWith(
          VideoRecorderState value, $Res Function(VideoRecorderState) then) =
      _$VideoRecorderStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$VideoRecorderStateCopyWithImpl<$Res>
    implements $VideoRecorderStateCopyWith<$Res> {
  _$VideoRecorderStateCopyWithImpl(this._value, this._then);

  final VideoRecorderState _value;
  // ignore: unused_field
  final $Res Function(VideoRecorderState) _then;
}

/// @nodoc
abstract class _$LoadingCopyWith<$Res> {
  factory _$LoadingCopyWith(_Loading value, $Res Function(_Loading) then) =
      __$LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$LoadingCopyWithImpl<$Res>
    extends _$VideoRecorderStateCopyWithImpl<$Res>
    implements _$LoadingCopyWith<$Res> {
  __$LoadingCopyWithImpl(_Loading _value, $Res Function(_Loading) _then)
      : super(_value, (v) => _then(v as _Loading));

  @override
  _Loading get _value => super._value as _Loading;
}

/// @nodoc

class _$_Loading implements _Loading {
  const _$_Loading();

  @override
  String toString() {
    return 'VideoRecorderState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(dynamic err) error,
    required TResult Function(
            CameraController controller, CameraSettings cameraSettings)
        camera,
    required TResult Function(CameraController controller, int startTime)
        recording,
    required TResult Function(
            String filepath, VideoPlayerController videoController)
        viewing,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(dynamic err)? error,
    TResult Function(
            CameraController controller, CameraSettings cameraSettings)?
        camera,
    TResult Function(CameraController controller, int startTime)? recording,
    TResult Function(String filepath, VideoPlayerController videoController)?
        viewing,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(dynamic err)? error,
    TResult Function(
            CameraController controller, CameraSettings cameraSettings)?
        camera,
    TResult Function(CameraController controller, int startTime)? recording,
    TResult Function(String filepath, VideoPlayerController videoController)?
        viewing,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_Previewing value) camera,
    required TResult Function(_Recording value) recording,
    required TResult Function(_Viewing value) viewing,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_Previewing value)? camera,
    TResult Function(_Recording value)? recording,
    TResult Function(_Viewing value)? viewing,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_Previewing value)? camera,
    TResult Function(_Recording value)? recording,
    TResult Function(_Viewing value)? viewing,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements VideoRecorderState {
  const factory _Loading() = _$_Loading;
}

/// @nodoc
abstract class _$ErrorCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) then) =
      __$ErrorCopyWithImpl<$Res>;
  $Res call({dynamic err});
}

/// @nodoc
class __$ErrorCopyWithImpl<$Res> extends _$VideoRecorderStateCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(_Error _value, $Res Function(_Error) _then)
      : super(_value, (v) => _then(v as _Error));

  @override
  _Error get _value => super._value as _Error;

  @override
  $Res call({
    Object? err = freezed,
  }) {
    return _then(_Error(
      err == freezed
          ? _value.err
          : err // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

class _$_Error implements _Error {
  const _$_Error(this.err);

  @override
  final dynamic err;

  @override
  String toString() {
    return 'VideoRecorderState.error(err: $err)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Error &&
            const DeepCollectionEquality().equals(other.err, err));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(err));

  @JsonKey(ignore: true)
  @override
  _$ErrorCopyWith<_Error> get copyWith =>
      __$ErrorCopyWithImpl<_Error>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(dynamic err) error,
    required TResult Function(
            CameraController controller, CameraSettings cameraSettings)
        camera,
    required TResult Function(CameraController controller, int startTime)
        recording,
    required TResult Function(
            String filepath, VideoPlayerController videoController)
        viewing,
  }) {
    return error(err);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(dynamic err)? error,
    TResult Function(
            CameraController controller, CameraSettings cameraSettings)?
        camera,
    TResult Function(CameraController controller, int startTime)? recording,
    TResult Function(String filepath, VideoPlayerController videoController)?
        viewing,
  }) {
    return error?.call(err);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(dynamic err)? error,
    TResult Function(
            CameraController controller, CameraSettings cameraSettings)?
        camera,
    TResult Function(CameraController controller, int startTime)? recording,
    TResult Function(String filepath, VideoPlayerController videoController)?
        viewing,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(err);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_Previewing value) camera,
    required TResult Function(_Recording value) recording,
    required TResult Function(_Viewing value) viewing,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_Previewing value)? camera,
    TResult Function(_Recording value)? recording,
    TResult Function(_Viewing value)? viewing,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_Previewing value)? camera,
    TResult Function(_Recording value)? recording,
    TResult Function(_Viewing value)? viewing,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements VideoRecorderState {
  const factory _Error(dynamic err) = _$_Error;

  dynamic get err;
  @JsonKey(ignore: true)
  _$ErrorCopyWith<_Error> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$PreviewingCopyWith<$Res> {
  factory _$PreviewingCopyWith(
          _Previewing value, $Res Function(_Previewing) then) =
      __$PreviewingCopyWithImpl<$Res>;
  $Res call({CameraController controller, CameraSettings cameraSettings});
}

/// @nodoc
class __$PreviewingCopyWithImpl<$Res>
    extends _$VideoRecorderStateCopyWithImpl<$Res>
    implements _$PreviewingCopyWith<$Res> {
  __$PreviewingCopyWithImpl(
      _Previewing _value, $Res Function(_Previewing) _then)
      : super(_value, (v) => _then(v as _Previewing));

  @override
  _Previewing get _value => super._value as _Previewing;

  @override
  $Res call({
    Object? controller = freezed,
    Object? cameraSettings = freezed,
  }) {
    return _then(_Previewing(
      controller == freezed
          ? _value.controller
          : controller // ignore: cast_nullable_to_non_nullable
              as CameraController,
      cameraSettings == freezed
          ? _value.cameraSettings
          : cameraSettings // ignore: cast_nullable_to_non_nullable
              as CameraSettings,
    ));
  }
}

/// @nodoc

class _$_Previewing implements _Previewing {
  const _$_Previewing(this.controller, this.cameraSettings);

  @override
  final CameraController controller;
  @override
  final CameraSettings cameraSettings;

  @override
  String toString() {
    return 'VideoRecorderState.camera(controller: $controller, cameraSettings: $cameraSettings)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Previewing &&
            (identical(other.controller, controller) ||
                other.controller == controller) &&
            (identical(other.cameraSettings, cameraSettings) ||
                other.cameraSettings == cameraSettings));
  }

  @override
  int get hashCode => Object.hash(runtimeType, controller, cameraSettings);

  @JsonKey(ignore: true)
  @override
  _$PreviewingCopyWith<_Previewing> get copyWith =>
      __$PreviewingCopyWithImpl<_Previewing>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(dynamic err) error,
    required TResult Function(
            CameraController controller, CameraSettings cameraSettings)
        camera,
    required TResult Function(CameraController controller, int startTime)
        recording,
    required TResult Function(
            String filepath, VideoPlayerController videoController)
        viewing,
  }) {
    return camera(controller, cameraSettings);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(dynamic err)? error,
    TResult Function(
            CameraController controller, CameraSettings cameraSettings)?
        camera,
    TResult Function(CameraController controller, int startTime)? recording,
    TResult Function(String filepath, VideoPlayerController videoController)?
        viewing,
  }) {
    return camera?.call(controller, cameraSettings);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(dynamic err)? error,
    TResult Function(
            CameraController controller, CameraSettings cameraSettings)?
        camera,
    TResult Function(CameraController controller, int startTime)? recording,
    TResult Function(String filepath, VideoPlayerController videoController)?
        viewing,
    required TResult orElse(),
  }) {
    if (camera != null) {
      return camera(controller, cameraSettings);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_Previewing value) camera,
    required TResult Function(_Recording value) recording,
    required TResult Function(_Viewing value) viewing,
  }) {
    return camera(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_Previewing value)? camera,
    TResult Function(_Recording value)? recording,
    TResult Function(_Viewing value)? viewing,
  }) {
    return camera?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_Previewing value)? camera,
    TResult Function(_Recording value)? recording,
    TResult Function(_Viewing value)? viewing,
    required TResult orElse(),
  }) {
    if (camera != null) {
      return camera(this);
    }
    return orElse();
  }
}

abstract class _Previewing implements VideoRecorderState {
  const factory _Previewing(
          CameraController controller, CameraSettings cameraSettings) =
      _$_Previewing;

  CameraController get controller;
  CameraSettings get cameraSettings;
  @JsonKey(ignore: true)
  _$PreviewingCopyWith<_Previewing> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$RecordingCopyWith<$Res> {
  factory _$RecordingCopyWith(
          _Recording value, $Res Function(_Recording) then) =
      __$RecordingCopyWithImpl<$Res>;
  $Res call({CameraController controller, int startTime});
}

/// @nodoc
class __$RecordingCopyWithImpl<$Res>
    extends _$VideoRecorderStateCopyWithImpl<$Res>
    implements _$RecordingCopyWith<$Res> {
  __$RecordingCopyWithImpl(_Recording _value, $Res Function(_Recording) _then)
      : super(_value, (v) => _then(v as _Recording));

  @override
  _Recording get _value => super._value as _Recording;

  @override
  $Res call({
    Object? controller = freezed,
    Object? startTime = freezed,
  }) {
    return _then(_Recording(
      controller == freezed
          ? _value.controller
          : controller // ignore: cast_nullable_to_non_nullable
              as CameraController,
      startTime == freezed
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_Recording implements _Recording {
  const _$_Recording(this.controller, this.startTime);

  @override
  final CameraController controller;
  @override
  final int startTime;

  @override
  String toString() {
    return 'VideoRecorderState.recording(controller: $controller, startTime: $startTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Recording &&
            (identical(other.controller, controller) ||
                other.controller == controller) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime));
  }

  @override
  int get hashCode => Object.hash(runtimeType, controller, startTime);

  @JsonKey(ignore: true)
  @override
  _$RecordingCopyWith<_Recording> get copyWith =>
      __$RecordingCopyWithImpl<_Recording>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(dynamic err) error,
    required TResult Function(
            CameraController controller, CameraSettings cameraSettings)
        camera,
    required TResult Function(CameraController controller, int startTime)
        recording,
    required TResult Function(
            String filepath, VideoPlayerController videoController)
        viewing,
  }) {
    return recording(controller, startTime);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(dynamic err)? error,
    TResult Function(
            CameraController controller, CameraSettings cameraSettings)?
        camera,
    TResult Function(CameraController controller, int startTime)? recording,
    TResult Function(String filepath, VideoPlayerController videoController)?
        viewing,
  }) {
    return recording?.call(controller, startTime);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(dynamic err)? error,
    TResult Function(
            CameraController controller, CameraSettings cameraSettings)?
        camera,
    TResult Function(CameraController controller, int startTime)? recording,
    TResult Function(String filepath, VideoPlayerController videoController)?
        viewing,
    required TResult orElse(),
  }) {
    if (recording != null) {
      return recording(controller, startTime);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_Previewing value) camera,
    required TResult Function(_Recording value) recording,
    required TResult Function(_Viewing value) viewing,
  }) {
    return recording(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_Previewing value)? camera,
    TResult Function(_Recording value)? recording,
    TResult Function(_Viewing value)? viewing,
  }) {
    return recording?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_Previewing value)? camera,
    TResult Function(_Recording value)? recording,
    TResult Function(_Viewing value)? viewing,
    required TResult orElse(),
  }) {
    if (recording != null) {
      return recording(this);
    }
    return orElse();
  }
}

abstract class _Recording implements VideoRecorderState {
  const factory _Recording(CameraController controller, int startTime) =
      _$_Recording;

  CameraController get controller;
  int get startTime;
  @JsonKey(ignore: true)
  _$RecordingCopyWith<_Recording> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$ViewingCopyWith<$Res> {
  factory _$ViewingCopyWith(_Viewing value, $Res Function(_Viewing) then) =
      __$ViewingCopyWithImpl<$Res>;
  $Res call({String filepath, VideoPlayerController videoController});
}

/// @nodoc
class __$ViewingCopyWithImpl<$Res>
    extends _$VideoRecorderStateCopyWithImpl<$Res>
    implements _$ViewingCopyWith<$Res> {
  __$ViewingCopyWithImpl(_Viewing _value, $Res Function(_Viewing) _then)
      : super(_value, (v) => _then(v as _Viewing));

  @override
  _Viewing get _value => super._value as _Viewing;

  @override
  $Res call({
    Object? filepath = freezed,
    Object? videoController = freezed,
  }) {
    return _then(_Viewing(
      filepath == freezed
          ? _value.filepath
          : filepath // ignore: cast_nullable_to_non_nullable
              as String,
      videoController == freezed
          ? _value.videoController
          : videoController // ignore: cast_nullable_to_non_nullable
              as VideoPlayerController,
    ));
  }
}

/// @nodoc

class _$_Viewing implements _Viewing {
  const _$_Viewing(this.filepath, this.videoController);

  @override
  final String filepath;
  @override
  final VideoPlayerController videoController;

  @override
  String toString() {
    return 'VideoRecorderState.viewing(filepath: $filepath, videoController: $videoController)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Viewing &&
            (identical(other.filepath, filepath) ||
                other.filepath == filepath) &&
            (identical(other.videoController, videoController) ||
                other.videoController == videoController));
  }

  @override
  int get hashCode => Object.hash(runtimeType, filepath, videoController);

  @JsonKey(ignore: true)
  @override
  _$ViewingCopyWith<_Viewing> get copyWith =>
      __$ViewingCopyWithImpl<_Viewing>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(dynamic err) error,
    required TResult Function(
            CameraController controller, CameraSettings cameraSettings)
        camera,
    required TResult Function(CameraController controller, int startTime)
        recording,
    required TResult Function(
            String filepath, VideoPlayerController videoController)
        viewing,
  }) {
    return viewing(filepath, videoController);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(dynamic err)? error,
    TResult Function(
            CameraController controller, CameraSettings cameraSettings)?
        camera,
    TResult Function(CameraController controller, int startTime)? recording,
    TResult Function(String filepath, VideoPlayerController videoController)?
        viewing,
  }) {
    return viewing?.call(filepath, videoController);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(dynamic err)? error,
    TResult Function(
            CameraController controller, CameraSettings cameraSettings)?
        camera,
    TResult Function(CameraController controller, int startTime)? recording,
    TResult Function(String filepath, VideoPlayerController videoController)?
        viewing,
    required TResult orElse(),
  }) {
    if (viewing != null) {
      return viewing(filepath, videoController);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_Previewing value) camera,
    required TResult Function(_Recording value) recording,
    required TResult Function(_Viewing value) viewing,
  }) {
    return viewing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_Previewing value)? camera,
    TResult Function(_Recording value)? recording,
    TResult Function(_Viewing value)? viewing,
  }) {
    return viewing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_Previewing value)? camera,
    TResult Function(_Recording value)? recording,
    TResult Function(_Viewing value)? viewing,
    required TResult orElse(),
  }) {
    if (viewing != null) {
      return viewing(this);
    }
    return orElse();
  }
}

abstract class _Viewing implements VideoRecorderState {
  const factory _Viewing(
      String filepath, VideoPlayerController videoController) = _$_Viewing;

  String get filepath;
  VideoPlayerController get videoController;
  @JsonKey(ignore: true)
  _$ViewingCopyWith<_Viewing> get copyWith =>
      throw _privateConstructorUsedError;
}
