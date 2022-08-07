// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'video_recorder_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$VideoRecorderState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(dynamic err) error,
    required TResult Function() camera,
    required TResult Function(File file) viewing,
    required TResult Function() missingPermission,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(dynamic err)? error,
    TResult Function()? camera,
    TResult Function(File file)? viewing,
    TResult Function()? missingPermission,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(dynamic err)? error,
    TResult Function()? camera,
    TResult Function(File file)? viewing,
    TResult Function()? missingPermission,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Error value) error,
    required TResult Function(_Camera value) camera,
    required TResult Function(_Viewing value) viewing,
    required TResult Function(_MissingPermission value) missingPermission,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Error value)? error,
    TResult Function(_Camera value)? camera,
    TResult Function(_Viewing value)? viewing,
    TResult Function(_MissingPermission value)? missingPermission,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Error value)? error,
    TResult Function(_Camera value)? camera,
    TResult Function(_Viewing value)? viewing,
    TResult Function(_MissingPermission value)? missingPermission,
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
abstract class _$$_ErrorCopyWith<$Res> {
  factory _$$_ErrorCopyWith(_$_Error value, $Res Function(_$_Error) then) =
      __$$_ErrorCopyWithImpl<$Res>;
  $Res call({dynamic err});
}

/// @nodoc
class __$$_ErrorCopyWithImpl<$Res>
    extends _$VideoRecorderStateCopyWithImpl<$Res>
    implements _$$_ErrorCopyWith<$Res> {
  __$$_ErrorCopyWithImpl(_$_Error _value, $Res Function(_$_Error) _then)
      : super(_value, (v) => _then(v as _$_Error));

  @override
  _$_Error get _value => super._value as _$_Error;

  @override
  $Res call({
    Object? err = freezed,
  }) {
    return _then(_$_Error(
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
            other is _$_Error &&
            const DeepCollectionEquality().equals(other.err, err));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(err));

  @JsonKey(ignore: true)
  @override
  _$$_ErrorCopyWith<_$_Error> get copyWith =>
      __$$_ErrorCopyWithImpl<_$_Error>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(dynamic err) error,
    required TResult Function() camera,
    required TResult Function(File file) viewing,
    required TResult Function() missingPermission,
  }) {
    return error(err);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(dynamic err)? error,
    TResult Function()? camera,
    TResult Function(File file)? viewing,
    TResult Function()? missingPermission,
  }) {
    return error?.call(err);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(dynamic err)? error,
    TResult Function()? camera,
    TResult Function(File file)? viewing,
    TResult Function()? missingPermission,
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
    required TResult Function(_Error value) error,
    required TResult Function(_Camera value) camera,
    required TResult Function(_Viewing value) viewing,
    required TResult Function(_MissingPermission value) missingPermission,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Error value)? error,
    TResult Function(_Camera value)? camera,
    TResult Function(_Viewing value)? viewing,
    TResult Function(_MissingPermission value)? missingPermission,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Error value)? error,
    TResult Function(_Camera value)? camera,
    TResult Function(_Viewing value)? viewing,
    TResult Function(_MissingPermission value)? missingPermission,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements VideoRecorderState {
  const factory _Error(final dynamic err) = _$_Error;

  dynamic get err;
  @JsonKey(ignore: true)
  _$$_ErrorCopyWith<_$_Error> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_CameraCopyWith<$Res> {
  factory _$$_CameraCopyWith(_$_Camera value, $Res Function(_$_Camera) then) =
      __$$_CameraCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_CameraCopyWithImpl<$Res>
    extends _$VideoRecorderStateCopyWithImpl<$Res>
    implements _$$_CameraCopyWith<$Res> {
  __$$_CameraCopyWithImpl(_$_Camera _value, $Res Function(_$_Camera) _then)
      : super(_value, (v) => _then(v as _$_Camera));

  @override
  _$_Camera get _value => super._value as _$_Camera;
}

/// @nodoc

class _$_Camera implements _Camera {
  const _$_Camera();

  @override
  String toString() {
    return 'VideoRecorderState.camera()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Camera);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(dynamic err) error,
    required TResult Function() camera,
    required TResult Function(File file) viewing,
    required TResult Function() missingPermission,
  }) {
    return camera();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(dynamic err)? error,
    TResult Function()? camera,
    TResult Function(File file)? viewing,
    TResult Function()? missingPermission,
  }) {
    return camera?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(dynamic err)? error,
    TResult Function()? camera,
    TResult Function(File file)? viewing,
    TResult Function()? missingPermission,
    required TResult orElse(),
  }) {
    if (camera != null) {
      return camera();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Error value) error,
    required TResult Function(_Camera value) camera,
    required TResult Function(_Viewing value) viewing,
    required TResult Function(_MissingPermission value) missingPermission,
  }) {
    return camera(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Error value)? error,
    TResult Function(_Camera value)? camera,
    TResult Function(_Viewing value)? viewing,
    TResult Function(_MissingPermission value)? missingPermission,
  }) {
    return camera?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Error value)? error,
    TResult Function(_Camera value)? camera,
    TResult Function(_Viewing value)? viewing,
    TResult Function(_MissingPermission value)? missingPermission,
    required TResult orElse(),
  }) {
    if (camera != null) {
      return camera(this);
    }
    return orElse();
  }
}

abstract class _Camera implements VideoRecorderState {
  const factory _Camera() = _$_Camera;
}

/// @nodoc
abstract class _$$_ViewingCopyWith<$Res> {
  factory _$$_ViewingCopyWith(
          _$_Viewing value, $Res Function(_$_Viewing) then) =
      __$$_ViewingCopyWithImpl<$Res>;
  $Res call({File file});
}

/// @nodoc
class __$$_ViewingCopyWithImpl<$Res>
    extends _$VideoRecorderStateCopyWithImpl<$Res>
    implements _$$_ViewingCopyWith<$Res> {
  __$$_ViewingCopyWithImpl(_$_Viewing _value, $Res Function(_$_Viewing) _then)
      : super(_value, (v) => _then(v as _$_Viewing));

  @override
  _$_Viewing get _value => super._value as _$_Viewing;

  @override
  $Res call({
    Object? file = freezed,
  }) {
    return _then(_$_Viewing(
      file == freezed
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as File,
    ));
  }
}

/// @nodoc

class _$_Viewing implements _Viewing {
  const _$_Viewing(this.file);

  @override
  final File file;

  @override
  String toString() {
    return 'VideoRecorderState.viewing(file: $file)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Viewing &&
            const DeepCollectionEquality().equals(other.file, file));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(file));

  @JsonKey(ignore: true)
  @override
  _$$_ViewingCopyWith<_$_Viewing> get copyWith =>
      __$$_ViewingCopyWithImpl<_$_Viewing>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(dynamic err) error,
    required TResult Function() camera,
    required TResult Function(File file) viewing,
    required TResult Function() missingPermission,
  }) {
    return viewing(file);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(dynamic err)? error,
    TResult Function()? camera,
    TResult Function(File file)? viewing,
    TResult Function()? missingPermission,
  }) {
    return viewing?.call(file);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(dynamic err)? error,
    TResult Function()? camera,
    TResult Function(File file)? viewing,
    TResult Function()? missingPermission,
    required TResult orElse(),
  }) {
    if (viewing != null) {
      return viewing(file);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Error value) error,
    required TResult Function(_Camera value) camera,
    required TResult Function(_Viewing value) viewing,
    required TResult Function(_MissingPermission value) missingPermission,
  }) {
    return viewing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Error value)? error,
    TResult Function(_Camera value)? camera,
    TResult Function(_Viewing value)? viewing,
    TResult Function(_MissingPermission value)? missingPermission,
  }) {
    return viewing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Error value)? error,
    TResult Function(_Camera value)? camera,
    TResult Function(_Viewing value)? viewing,
    TResult Function(_MissingPermission value)? missingPermission,
    required TResult orElse(),
  }) {
    if (viewing != null) {
      return viewing(this);
    }
    return orElse();
  }
}

abstract class _Viewing implements VideoRecorderState {
  const factory _Viewing(final File file) = _$_Viewing;

  File get file;
  @JsonKey(ignore: true)
  _$$_ViewingCopyWith<_$_Viewing> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_MissingPermissionCopyWith<$Res> {
  factory _$$_MissingPermissionCopyWith(_$_MissingPermission value,
          $Res Function(_$_MissingPermission) then) =
      __$$_MissingPermissionCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_MissingPermissionCopyWithImpl<$Res>
    extends _$VideoRecorderStateCopyWithImpl<$Res>
    implements _$$_MissingPermissionCopyWith<$Res> {
  __$$_MissingPermissionCopyWithImpl(
      _$_MissingPermission _value, $Res Function(_$_MissingPermission) _then)
      : super(_value, (v) => _then(v as _$_MissingPermission));

  @override
  _$_MissingPermission get _value => super._value as _$_MissingPermission;
}

/// @nodoc

class _$_MissingPermission implements _MissingPermission {
  const _$_MissingPermission();

  @override
  String toString() {
    return 'VideoRecorderState.missingPermission()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_MissingPermission);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(dynamic err) error,
    required TResult Function() camera,
    required TResult Function(File file) viewing,
    required TResult Function() missingPermission,
  }) {
    return missingPermission();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(dynamic err)? error,
    TResult Function()? camera,
    TResult Function(File file)? viewing,
    TResult Function()? missingPermission,
  }) {
    return missingPermission?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(dynamic err)? error,
    TResult Function()? camera,
    TResult Function(File file)? viewing,
    TResult Function()? missingPermission,
    required TResult orElse(),
  }) {
    if (missingPermission != null) {
      return missingPermission();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Error value) error,
    required TResult Function(_Camera value) camera,
    required TResult Function(_Viewing value) viewing,
    required TResult Function(_MissingPermission value) missingPermission,
  }) {
    return missingPermission(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Error value)? error,
    TResult Function(_Camera value)? camera,
    TResult Function(_Viewing value)? viewing,
    TResult Function(_MissingPermission value)? missingPermission,
  }) {
    return missingPermission?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Error value)? error,
    TResult Function(_Camera value)? camera,
    TResult Function(_Viewing value)? viewing,
    TResult Function(_MissingPermission value)? missingPermission,
    required TResult orElse(),
  }) {
    if (missingPermission != null) {
      return missingPermission(this);
    }
    return orElse();
  }
}

abstract class _MissingPermission implements VideoRecorderState {
  const factory _MissingPermission() = _$_MissingPermission;
}
