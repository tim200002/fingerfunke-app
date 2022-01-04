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

  _Initial initial() {
    return const _Initial();
  }

  _Preparing preparing() {
    return const _Preparing();
  }

  _Recording recording(CameraController controller, int startTime) {
    return _Recording(
      controller,
      startTime,
    );
  }

  _Saving saving() {
    return const _Saving();
  }

  _Viewing viewing(String filepath) {
    return _Viewing(
      filepath,
    );
  }

  _Sending sending(String filepath) {
    return _Sending(
      filepath,
    );
  }

  _Error error(String msg) {
    return _Error(
      msg,
    );
  }
}

/// @nodoc
const $VideoRecorderState = _$VideoRecorderStateTearOff();

/// @nodoc
mixin _$VideoRecorderState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() preparing,
    required TResult Function(CameraController controller, int startTime)
        recording,
    required TResult Function() saving,
    required TResult Function(String filepath) viewing,
    required TResult Function(String filepath) sending,
    required TResult Function(String msg) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? preparing,
    TResult Function(CameraController controller, int startTime)? recording,
    TResult Function()? saving,
    TResult Function(String filepath)? viewing,
    TResult Function(String filepath)? sending,
    TResult Function(String msg)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? preparing,
    TResult Function(CameraController controller, int startTime)? recording,
    TResult Function()? saving,
    TResult Function(String filepath)? viewing,
    TResult Function(String filepath)? sending,
    TResult Function(String msg)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Preparing value) preparing,
    required TResult Function(_Recording value) recording,
    required TResult Function(_Saving value) saving,
    required TResult Function(_Viewing value) viewing,
    required TResult Function(_Sending value) sending,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Preparing value)? preparing,
    TResult Function(_Recording value)? recording,
    TResult Function(_Saving value)? saving,
    TResult Function(_Viewing value)? viewing,
    TResult Function(_Sending value)? sending,
    TResult Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Preparing value)? preparing,
    TResult Function(_Recording value)? recording,
    TResult Function(_Saving value)? saving,
    TResult Function(_Viewing value)? viewing,
    TResult Function(_Sending value)? sending,
    TResult Function(_Error value)? error,
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
abstract class _$InitialCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$InitialCopyWithImpl<$Res>
    extends _$VideoRecorderStateCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(_Initial _value, $Res Function(_Initial) _then)
      : super(_value, (v) => _then(v as _Initial));

  @override
  _Initial get _value => super._value as _Initial;
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'VideoRecorderState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() preparing,
    required TResult Function(CameraController controller, int startTime)
        recording,
    required TResult Function() saving,
    required TResult Function(String filepath) viewing,
    required TResult Function(String filepath) sending,
    required TResult Function(String msg) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? preparing,
    TResult Function(CameraController controller, int startTime)? recording,
    TResult Function()? saving,
    TResult Function(String filepath)? viewing,
    TResult Function(String filepath)? sending,
    TResult Function(String msg)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? preparing,
    TResult Function(CameraController controller, int startTime)? recording,
    TResult Function()? saving,
    TResult Function(String filepath)? viewing,
    TResult Function(String filepath)? sending,
    TResult Function(String msg)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Preparing value) preparing,
    required TResult Function(_Recording value) recording,
    required TResult Function(_Saving value) saving,
    required TResult Function(_Viewing value) viewing,
    required TResult Function(_Sending value) sending,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Preparing value)? preparing,
    TResult Function(_Recording value)? recording,
    TResult Function(_Saving value)? saving,
    TResult Function(_Viewing value)? viewing,
    TResult Function(_Sending value)? sending,
    TResult Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Preparing value)? preparing,
    TResult Function(_Recording value)? recording,
    TResult Function(_Saving value)? saving,
    TResult Function(_Viewing value)? viewing,
    TResult Function(_Sending value)? sending,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements VideoRecorderState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$PreparingCopyWith<$Res> {
  factory _$PreparingCopyWith(
          _Preparing value, $Res Function(_Preparing) then) =
      __$PreparingCopyWithImpl<$Res>;
}

/// @nodoc
class __$PreparingCopyWithImpl<$Res>
    extends _$VideoRecorderStateCopyWithImpl<$Res>
    implements _$PreparingCopyWith<$Res> {
  __$PreparingCopyWithImpl(_Preparing _value, $Res Function(_Preparing) _then)
      : super(_value, (v) => _then(v as _Preparing));

  @override
  _Preparing get _value => super._value as _Preparing;
}

/// @nodoc

class _$_Preparing implements _Preparing {
  const _$_Preparing();

  @override
  String toString() {
    return 'VideoRecorderState.preparing()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Preparing);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() preparing,
    required TResult Function(CameraController controller, int startTime)
        recording,
    required TResult Function() saving,
    required TResult Function(String filepath) viewing,
    required TResult Function(String filepath) sending,
    required TResult Function(String msg) error,
  }) {
    return preparing();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? preparing,
    TResult Function(CameraController controller, int startTime)? recording,
    TResult Function()? saving,
    TResult Function(String filepath)? viewing,
    TResult Function(String filepath)? sending,
    TResult Function(String msg)? error,
  }) {
    return preparing?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? preparing,
    TResult Function(CameraController controller, int startTime)? recording,
    TResult Function()? saving,
    TResult Function(String filepath)? viewing,
    TResult Function(String filepath)? sending,
    TResult Function(String msg)? error,
    required TResult orElse(),
  }) {
    if (preparing != null) {
      return preparing();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Preparing value) preparing,
    required TResult Function(_Recording value) recording,
    required TResult Function(_Saving value) saving,
    required TResult Function(_Viewing value) viewing,
    required TResult Function(_Sending value) sending,
    required TResult Function(_Error value) error,
  }) {
    return preparing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Preparing value)? preparing,
    TResult Function(_Recording value)? recording,
    TResult Function(_Saving value)? saving,
    TResult Function(_Viewing value)? viewing,
    TResult Function(_Sending value)? sending,
    TResult Function(_Error value)? error,
  }) {
    return preparing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Preparing value)? preparing,
    TResult Function(_Recording value)? recording,
    TResult Function(_Saving value)? saving,
    TResult Function(_Viewing value)? viewing,
    TResult Function(_Sending value)? sending,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (preparing != null) {
      return preparing(this);
    }
    return orElse();
  }
}

abstract class _Preparing implements VideoRecorderState {
  const factory _Preparing() = _$_Preparing;
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
    required TResult Function() initial,
    required TResult Function() preparing,
    required TResult Function(CameraController controller, int startTime)
        recording,
    required TResult Function() saving,
    required TResult Function(String filepath) viewing,
    required TResult Function(String filepath) sending,
    required TResult Function(String msg) error,
  }) {
    return recording(controller, startTime);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? preparing,
    TResult Function(CameraController controller, int startTime)? recording,
    TResult Function()? saving,
    TResult Function(String filepath)? viewing,
    TResult Function(String filepath)? sending,
    TResult Function(String msg)? error,
  }) {
    return recording?.call(controller, startTime);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? preparing,
    TResult Function(CameraController controller, int startTime)? recording,
    TResult Function()? saving,
    TResult Function(String filepath)? viewing,
    TResult Function(String filepath)? sending,
    TResult Function(String msg)? error,
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
    required TResult Function(_Initial value) initial,
    required TResult Function(_Preparing value) preparing,
    required TResult Function(_Recording value) recording,
    required TResult Function(_Saving value) saving,
    required TResult Function(_Viewing value) viewing,
    required TResult Function(_Sending value) sending,
    required TResult Function(_Error value) error,
  }) {
    return recording(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Preparing value)? preparing,
    TResult Function(_Recording value)? recording,
    TResult Function(_Saving value)? saving,
    TResult Function(_Viewing value)? viewing,
    TResult Function(_Sending value)? sending,
    TResult Function(_Error value)? error,
  }) {
    return recording?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Preparing value)? preparing,
    TResult Function(_Recording value)? recording,
    TResult Function(_Saving value)? saving,
    TResult Function(_Viewing value)? viewing,
    TResult Function(_Sending value)? sending,
    TResult Function(_Error value)? error,
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
abstract class _$SavingCopyWith<$Res> {
  factory _$SavingCopyWith(_Saving value, $Res Function(_Saving) then) =
      __$SavingCopyWithImpl<$Res>;
}

/// @nodoc
class __$SavingCopyWithImpl<$Res> extends _$VideoRecorderStateCopyWithImpl<$Res>
    implements _$SavingCopyWith<$Res> {
  __$SavingCopyWithImpl(_Saving _value, $Res Function(_Saving) _then)
      : super(_value, (v) => _then(v as _Saving));

  @override
  _Saving get _value => super._value as _Saving;
}

/// @nodoc

class _$_Saving implements _Saving {
  const _$_Saving();

  @override
  String toString() {
    return 'VideoRecorderState.saving()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Saving);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() preparing,
    required TResult Function(CameraController controller, int startTime)
        recording,
    required TResult Function() saving,
    required TResult Function(String filepath) viewing,
    required TResult Function(String filepath) sending,
    required TResult Function(String msg) error,
  }) {
    return saving();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? preparing,
    TResult Function(CameraController controller, int startTime)? recording,
    TResult Function()? saving,
    TResult Function(String filepath)? viewing,
    TResult Function(String filepath)? sending,
    TResult Function(String msg)? error,
  }) {
    return saving?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? preparing,
    TResult Function(CameraController controller, int startTime)? recording,
    TResult Function()? saving,
    TResult Function(String filepath)? viewing,
    TResult Function(String filepath)? sending,
    TResult Function(String msg)? error,
    required TResult orElse(),
  }) {
    if (saving != null) {
      return saving();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Preparing value) preparing,
    required TResult Function(_Recording value) recording,
    required TResult Function(_Saving value) saving,
    required TResult Function(_Viewing value) viewing,
    required TResult Function(_Sending value) sending,
    required TResult Function(_Error value) error,
  }) {
    return saving(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Preparing value)? preparing,
    TResult Function(_Recording value)? recording,
    TResult Function(_Saving value)? saving,
    TResult Function(_Viewing value)? viewing,
    TResult Function(_Sending value)? sending,
    TResult Function(_Error value)? error,
  }) {
    return saving?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Preparing value)? preparing,
    TResult Function(_Recording value)? recording,
    TResult Function(_Saving value)? saving,
    TResult Function(_Viewing value)? viewing,
    TResult Function(_Sending value)? sending,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (saving != null) {
      return saving(this);
    }
    return orElse();
  }
}

abstract class _Saving implements VideoRecorderState {
  const factory _Saving() = _$_Saving;
}

/// @nodoc
abstract class _$ViewingCopyWith<$Res> {
  factory _$ViewingCopyWith(_Viewing value, $Res Function(_Viewing) then) =
      __$ViewingCopyWithImpl<$Res>;
  $Res call({String filepath});
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
  }) {
    return _then(_Viewing(
      filepath == freezed
          ? _value.filepath
          : filepath // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Viewing implements _Viewing {
  const _$_Viewing(this.filepath);

  @override
  final String filepath;

  @override
  String toString() {
    return 'VideoRecorderState.viewing(filepath: $filepath)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Viewing &&
            (identical(other.filepath, filepath) ||
                other.filepath == filepath));
  }

  @override
  int get hashCode => Object.hash(runtimeType, filepath);

  @JsonKey(ignore: true)
  @override
  _$ViewingCopyWith<_Viewing> get copyWith =>
      __$ViewingCopyWithImpl<_Viewing>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() preparing,
    required TResult Function(CameraController controller, int startTime)
        recording,
    required TResult Function() saving,
    required TResult Function(String filepath) viewing,
    required TResult Function(String filepath) sending,
    required TResult Function(String msg) error,
  }) {
    return viewing(filepath);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? preparing,
    TResult Function(CameraController controller, int startTime)? recording,
    TResult Function()? saving,
    TResult Function(String filepath)? viewing,
    TResult Function(String filepath)? sending,
    TResult Function(String msg)? error,
  }) {
    return viewing?.call(filepath);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? preparing,
    TResult Function(CameraController controller, int startTime)? recording,
    TResult Function()? saving,
    TResult Function(String filepath)? viewing,
    TResult Function(String filepath)? sending,
    TResult Function(String msg)? error,
    required TResult orElse(),
  }) {
    if (viewing != null) {
      return viewing(filepath);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Preparing value) preparing,
    required TResult Function(_Recording value) recording,
    required TResult Function(_Saving value) saving,
    required TResult Function(_Viewing value) viewing,
    required TResult Function(_Sending value) sending,
    required TResult Function(_Error value) error,
  }) {
    return viewing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Preparing value)? preparing,
    TResult Function(_Recording value)? recording,
    TResult Function(_Saving value)? saving,
    TResult Function(_Viewing value)? viewing,
    TResult Function(_Sending value)? sending,
    TResult Function(_Error value)? error,
  }) {
    return viewing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Preparing value)? preparing,
    TResult Function(_Recording value)? recording,
    TResult Function(_Saving value)? saving,
    TResult Function(_Viewing value)? viewing,
    TResult Function(_Sending value)? sending,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (viewing != null) {
      return viewing(this);
    }
    return orElse();
  }
}

abstract class _Viewing implements VideoRecorderState {
  const factory _Viewing(String filepath) = _$_Viewing;

  String get filepath;
  @JsonKey(ignore: true)
  _$ViewingCopyWith<_Viewing> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$SendingCopyWith<$Res> {
  factory _$SendingCopyWith(_Sending value, $Res Function(_Sending) then) =
      __$SendingCopyWithImpl<$Res>;
  $Res call({String filepath});
}

/// @nodoc
class __$SendingCopyWithImpl<$Res>
    extends _$VideoRecorderStateCopyWithImpl<$Res>
    implements _$SendingCopyWith<$Res> {
  __$SendingCopyWithImpl(_Sending _value, $Res Function(_Sending) _then)
      : super(_value, (v) => _then(v as _Sending));

  @override
  _Sending get _value => super._value as _Sending;

  @override
  $Res call({
    Object? filepath = freezed,
  }) {
    return _then(_Sending(
      filepath == freezed
          ? _value.filepath
          : filepath // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Sending implements _Sending {
  const _$_Sending(this.filepath);

  @override
  final String filepath;

  @override
  String toString() {
    return 'VideoRecorderState.sending(filepath: $filepath)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Sending &&
            (identical(other.filepath, filepath) ||
                other.filepath == filepath));
  }

  @override
  int get hashCode => Object.hash(runtimeType, filepath);

  @JsonKey(ignore: true)
  @override
  _$SendingCopyWith<_Sending> get copyWith =>
      __$SendingCopyWithImpl<_Sending>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() preparing,
    required TResult Function(CameraController controller, int startTime)
        recording,
    required TResult Function() saving,
    required TResult Function(String filepath) viewing,
    required TResult Function(String filepath) sending,
    required TResult Function(String msg) error,
  }) {
    return sending(filepath);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? preparing,
    TResult Function(CameraController controller, int startTime)? recording,
    TResult Function()? saving,
    TResult Function(String filepath)? viewing,
    TResult Function(String filepath)? sending,
    TResult Function(String msg)? error,
  }) {
    return sending?.call(filepath);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? preparing,
    TResult Function(CameraController controller, int startTime)? recording,
    TResult Function()? saving,
    TResult Function(String filepath)? viewing,
    TResult Function(String filepath)? sending,
    TResult Function(String msg)? error,
    required TResult orElse(),
  }) {
    if (sending != null) {
      return sending(filepath);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Preparing value) preparing,
    required TResult Function(_Recording value) recording,
    required TResult Function(_Saving value) saving,
    required TResult Function(_Viewing value) viewing,
    required TResult Function(_Sending value) sending,
    required TResult Function(_Error value) error,
  }) {
    return sending(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Preparing value)? preparing,
    TResult Function(_Recording value)? recording,
    TResult Function(_Saving value)? saving,
    TResult Function(_Viewing value)? viewing,
    TResult Function(_Sending value)? sending,
    TResult Function(_Error value)? error,
  }) {
    return sending?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Preparing value)? preparing,
    TResult Function(_Recording value)? recording,
    TResult Function(_Saving value)? saving,
    TResult Function(_Viewing value)? viewing,
    TResult Function(_Sending value)? sending,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (sending != null) {
      return sending(this);
    }
    return orElse();
  }
}

abstract class _Sending implements VideoRecorderState {
  const factory _Sending(String filepath) = _$_Sending;

  String get filepath;
  @JsonKey(ignore: true)
  _$SendingCopyWith<_Sending> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$ErrorCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) then) =
      __$ErrorCopyWithImpl<$Res>;
  $Res call({String msg});
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
    Object? msg = freezed,
  }) {
    return _then(_Error(
      msg == freezed
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Error implements _Error {
  const _$_Error(this.msg);

  @override
  final String msg;

  @override
  String toString() {
    return 'VideoRecorderState.error(msg: $msg)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Error &&
            (identical(other.msg, msg) || other.msg == msg));
  }

  @override
  int get hashCode => Object.hash(runtimeType, msg);

  @JsonKey(ignore: true)
  @override
  _$ErrorCopyWith<_Error> get copyWith =>
      __$ErrorCopyWithImpl<_Error>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() preparing,
    required TResult Function(CameraController controller, int startTime)
        recording,
    required TResult Function() saving,
    required TResult Function(String filepath) viewing,
    required TResult Function(String filepath) sending,
    required TResult Function(String msg) error,
  }) {
    return error(msg);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? preparing,
    TResult Function(CameraController controller, int startTime)? recording,
    TResult Function()? saving,
    TResult Function(String filepath)? viewing,
    TResult Function(String filepath)? sending,
    TResult Function(String msg)? error,
  }) {
    return error?.call(msg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? preparing,
    TResult Function(CameraController controller, int startTime)? recording,
    TResult Function()? saving,
    TResult Function(String filepath)? viewing,
    TResult Function(String filepath)? sending,
    TResult Function(String msg)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(msg);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Preparing value) preparing,
    required TResult Function(_Recording value) recording,
    required TResult Function(_Saving value) saving,
    required TResult Function(_Viewing value) viewing,
    required TResult Function(_Sending value) sending,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Preparing value)? preparing,
    TResult Function(_Recording value)? recording,
    TResult Function(_Saving value)? saving,
    TResult Function(_Viewing value)? viewing,
    TResult Function(_Sending value)? sending,
    TResult Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Preparing value)? preparing,
    TResult Function(_Recording value)? recording,
    TResult Function(_Saving value)? saving,
    TResult Function(_Viewing value)? viewing,
    TResult Function(_Sending value)? sending,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements VideoRecorderState {
  const factory _Error(String msg) = _$_Error;

  String get msg;
  @JsonKey(ignore: true)
  _$ErrorCopyWith<_Error> get copyWith => throw _privateConstructorUsedError;
}
