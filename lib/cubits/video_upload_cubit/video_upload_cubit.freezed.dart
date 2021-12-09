// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'video_upload_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$VideoUploadStateTearOff {
  const _$VideoUploadStateTearOff();

  _Initial initial() {
    return const _Initial();
  }

  _Uploading uploading(Uint8List? thumbnail) {
    return _Uploading(
      thumbnail,
    );
  }

  _Processing processing(Uint8List? thumbnail) {
    return _Processing(
      thumbnail,
    );
  }

  _Uploaded uploaded(Uint8List? thumbnail, VideoAsset asset) {
    return _Uploaded(
      thumbnail,
      asset,
    );
  }

  _Error error(Object error) {
    return _Error(
      error,
    );
  }
}

/// @nodoc
const $VideoUploadState = _$VideoUploadStateTearOff();

/// @nodoc
mixin _$VideoUploadState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(Uint8List? thumbnail) uploading,
    required TResult Function(Uint8List? thumbnail) processing,
    required TResult Function(Uint8List? thumbnail, VideoAsset asset) uploaded,
    required TResult Function(Object error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Uint8List? thumbnail)? uploading,
    TResult Function(Uint8List? thumbnail)? processing,
    TResult Function(Uint8List? thumbnail, VideoAsset asset)? uploaded,
    TResult Function(Object error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Uint8List? thumbnail)? uploading,
    TResult Function(Uint8List? thumbnail)? processing,
    TResult Function(Uint8List? thumbnail, VideoAsset asset)? uploaded,
    TResult Function(Object error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Uploading value) uploading,
    required TResult Function(_Processing value) processing,
    required TResult Function(_Uploaded value) uploaded,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Uploading value)? uploading,
    TResult Function(_Processing value)? processing,
    TResult Function(_Uploaded value)? uploaded,
    TResult Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Uploading value)? uploading,
    TResult Function(_Processing value)? processing,
    TResult Function(_Uploaded value)? uploaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VideoUploadStateCopyWith<$Res> {
  factory $VideoUploadStateCopyWith(
          VideoUploadState value, $Res Function(VideoUploadState) then) =
      _$VideoUploadStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$VideoUploadStateCopyWithImpl<$Res>
    implements $VideoUploadStateCopyWith<$Res> {
  _$VideoUploadStateCopyWithImpl(this._value, this._then);

  final VideoUploadState _value;
  // ignore: unused_field
  final $Res Function(VideoUploadState) _then;
}

/// @nodoc
abstract class _$InitialCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$InitialCopyWithImpl<$Res> extends _$VideoUploadStateCopyWithImpl<$Res>
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
    return 'VideoUploadState.initial()';
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
    required TResult Function(Uint8List? thumbnail) uploading,
    required TResult Function(Uint8List? thumbnail) processing,
    required TResult Function(Uint8List? thumbnail, VideoAsset asset) uploaded,
    required TResult Function(Object error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Uint8List? thumbnail)? uploading,
    TResult Function(Uint8List? thumbnail)? processing,
    TResult Function(Uint8List? thumbnail, VideoAsset asset)? uploaded,
    TResult Function(Object error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Uint8List? thumbnail)? uploading,
    TResult Function(Uint8List? thumbnail)? processing,
    TResult Function(Uint8List? thumbnail, VideoAsset asset)? uploaded,
    TResult Function(Object error)? error,
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
    required TResult Function(_Uploading value) uploading,
    required TResult Function(_Processing value) processing,
    required TResult Function(_Uploaded value) uploaded,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Uploading value)? uploading,
    TResult Function(_Processing value)? processing,
    TResult Function(_Uploaded value)? uploaded,
    TResult Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Uploading value)? uploading,
    TResult Function(_Processing value)? processing,
    TResult Function(_Uploaded value)? uploaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements VideoUploadState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$UploadingCopyWith<$Res> {
  factory _$UploadingCopyWith(
          _Uploading value, $Res Function(_Uploading) then) =
      __$UploadingCopyWithImpl<$Res>;
  $Res call({Uint8List? thumbnail});
}

/// @nodoc
class __$UploadingCopyWithImpl<$Res>
    extends _$VideoUploadStateCopyWithImpl<$Res>
    implements _$UploadingCopyWith<$Res> {
  __$UploadingCopyWithImpl(_Uploading _value, $Res Function(_Uploading) _then)
      : super(_value, (v) => _then(v as _Uploading));

  @override
  _Uploading get _value => super._value as _Uploading;

  @override
  $Res call({
    Object? thumbnail = freezed,
  }) {
    return _then(_Uploading(
      thumbnail == freezed
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
    ));
  }
}

/// @nodoc

class _$_Uploading implements _Uploading {
  const _$_Uploading(this.thumbnail);

  @override
  final Uint8List? thumbnail;

  @override
  String toString() {
    return 'VideoUploadState.uploading(thumbnail: $thumbnail)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Uploading &&
            (identical(other.thumbnail, thumbnail) ||
                other.thumbnail == thumbnail));
  }

  @override
  int get hashCode => Object.hash(runtimeType, thumbnail);

  @JsonKey(ignore: true)
  @override
  _$UploadingCopyWith<_Uploading> get copyWith =>
      __$UploadingCopyWithImpl<_Uploading>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(Uint8List? thumbnail) uploading,
    required TResult Function(Uint8List? thumbnail) processing,
    required TResult Function(Uint8List? thumbnail, VideoAsset asset) uploaded,
    required TResult Function(Object error) error,
  }) {
    return uploading(thumbnail);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Uint8List? thumbnail)? uploading,
    TResult Function(Uint8List? thumbnail)? processing,
    TResult Function(Uint8List? thumbnail, VideoAsset asset)? uploaded,
    TResult Function(Object error)? error,
  }) {
    return uploading?.call(thumbnail);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Uint8List? thumbnail)? uploading,
    TResult Function(Uint8List? thumbnail)? processing,
    TResult Function(Uint8List? thumbnail, VideoAsset asset)? uploaded,
    TResult Function(Object error)? error,
    required TResult orElse(),
  }) {
    if (uploading != null) {
      return uploading(thumbnail);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Uploading value) uploading,
    required TResult Function(_Processing value) processing,
    required TResult Function(_Uploaded value) uploaded,
    required TResult Function(_Error value) error,
  }) {
    return uploading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Uploading value)? uploading,
    TResult Function(_Processing value)? processing,
    TResult Function(_Uploaded value)? uploaded,
    TResult Function(_Error value)? error,
  }) {
    return uploading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Uploading value)? uploading,
    TResult Function(_Processing value)? processing,
    TResult Function(_Uploaded value)? uploaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (uploading != null) {
      return uploading(this);
    }
    return orElse();
  }
}

abstract class _Uploading implements VideoUploadState {
  const factory _Uploading(Uint8List? thumbnail) = _$_Uploading;

  Uint8List? get thumbnail;
  @JsonKey(ignore: true)
  _$UploadingCopyWith<_Uploading> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$ProcessingCopyWith<$Res> {
  factory _$ProcessingCopyWith(
          _Processing value, $Res Function(_Processing) then) =
      __$ProcessingCopyWithImpl<$Res>;
  $Res call({Uint8List? thumbnail});
}

/// @nodoc
class __$ProcessingCopyWithImpl<$Res>
    extends _$VideoUploadStateCopyWithImpl<$Res>
    implements _$ProcessingCopyWith<$Res> {
  __$ProcessingCopyWithImpl(
      _Processing _value, $Res Function(_Processing) _then)
      : super(_value, (v) => _then(v as _Processing));

  @override
  _Processing get _value => super._value as _Processing;

  @override
  $Res call({
    Object? thumbnail = freezed,
  }) {
    return _then(_Processing(
      thumbnail == freezed
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
    ));
  }
}

/// @nodoc

class _$_Processing implements _Processing {
  const _$_Processing(this.thumbnail);

  @override
  final Uint8List? thumbnail;

  @override
  String toString() {
    return 'VideoUploadState.processing(thumbnail: $thumbnail)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Processing &&
            (identical(other.thumbnail, thumbnail) ||
                other.thumbnail == thumbnail));
  }

  @override
  int get hashCode => Object.hash(runtimeType, thumbnail);

  @JsonKey(ignore: true)
  @override
  _$ProcessingCopyWith<_Processing> get copyWith =>
      __$ProcessingCopyWithImpl<_Processing>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(Uint8List? thumbnail) uploading,
    required TResult Function(Uint8List? thumbnail) processing,
    required TResult Function(Uint8List? thumbnail, VideoAsset asset) uploaded,
    required TResult Function(Object error) error,
  }) {
    return processing(thumbnail);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Uint8List? thumbnail)? uploading,
    TResult Function(Uint8List? thumbnail)? processing,
    TResult Function(Uint8List? thumbnail, VideoAsset asset)? uploaded,
    TResult Function(Object error)? error,
  }) {
    return processing?.call(thumbnail);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Uint8List? thumbnail)? uploading,
    TResult Function(Uint8List? thumbnail)? processing,
    TResult Function(Uint8List? thumbnail, VideoAsset asset)? uploaded,
    TResult Function(Object error)? error,
    required TResult orElse(),
  }) {
    if (processing != null) {
      return processing(thumbnail);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Uploading value) uploading,
    required TResult Function(_Processing value) processing,
    required TResult Function(_Uploaded value) uploaded,
    required TResult Function(_Error value) error,
  }) {
    return processing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Uploading value)? uploading,
    TResult Function(_Processing value)? processing,
    TResult Function(_Uploaded value)? uploaded,
    TResult Function(_Error value)? error,
  }) {
    return processing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Uploading value)? uploading,
    TResult Function(_Processing value)? processing,
    TResult Function(_Uploaded value)? uploaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (processing != null) {
      return processing(this);
    }
    return orElse();
  }
}

abstract class _Processing implements VideoUploadState {
  const factory _Processing(Uint8List? thumbnail) = _$_Processing;

  Uint8List? get thumbnail;
  @JsonKey(ignore: true)
  _$ProcessingCopyWith<_Processing> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$UploadedCopyWith<$Res> {
  factory _$UploadedCopyWith(_Uploaded value, $Res Function(_Uploaded) then) =
      __$UploadedCopyWithImpl<$Res>;
  $Res call({Uint8List? thumbnail, VideoAsset asset});
}

/// @nodoc
class __$UploadedCopyWithImpl<$Res> extends _$VideoUploadStateCopyWithImpl<$Res>
    implements _$UploadedCopyWith<$Res> {
  __$UploadedCopyWithImpl(_Uploaded _value, $Res Function(_Uploaded) _then)
      : super(_value, (v) => _then(v as _Uploaded));

  @override
  _Uploaded get _value => super._value as _Uploaded;

  @override
  $Res call({
    Object? thumbnail = freezed,
    Object? asset = freezed,
  }) {
    return _then(_Uploaded(
      thumbnail == freezed
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
      asset == freezed
          ? _value.asset
          : asset // ignore: cast_nullable_to_non_nullable
              as VideoAsset,
    ));
  }
}

/// @nodoc

class _$_Uploaded implements _Uploaded {
  const _$_Uploaded(this.thumbnail, this.asset);

  @override
  final Uint8List? thumbnail;
  @override
  final VideoAsset asset;

  @override
  String toString() {
    return 'VideoUploadState.uploaded(thumbnail: $thumbnail, asset: $asset)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Uploaded &&
            (identical(other.thumbnail, thumbnail) ||
                other.thumbnail == thumbnail) &&
            (identical(other.asset, asset) || other.asset == asset));
  }

  @override
  int get hashCode => Object.hash(runtimeType, thumbnail, asset);

  @JsonKey(ignore: true)
  @override
  _$UploadedCopyWith<_Uploaded> get copyWith =>
      __$UploadedCopyWithImpl<_Uploaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(Uint8List? thumbnail) uploading,
    required TResult Function(Uint8List? thumbnail) processing,
    required TResult Function(Uint8List? thumbnail, VideoAsset asset) uploaded,
    required TResult Function(Object error) error,
  }) {
    return uploaded(thumbnail, asset);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Uint8List? thumbnail)? uploading,
    TResult Function(Uint8List? thumbnail)? processing,
    TResult Function(Uint8List? thumbnail, VideoAsset asset)? uploaded,
    TResult Function(Object error)? error,
  }) {
    return uploaded?.call(thumbnail, asset);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Uint8List? thumbnail)? uploading,
    TResult Function(Uint8List? thumbnail)? processing,
    TResult Function(Uint8List? thumbnail, VideoAsset asset)? uploaded,
    TResult Function(Object error)? error,
    required TResult orElse(),
  }) {
    if (uploaded != null) {
      return uploaded(thumbnail, asset);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Uploading value) uploading,
    required TResult Function(_Processing value) processing,
    required TResult Function(_Uploaded value) uploaded,
    required TResult Function(_Error value) error,
  }) {
    return uploaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Uploading value)? uploading,
    TResult Function(_Processing value)? processing,
    TResult Function(_Uploaded value)? uploaded,
    TResult Function(_Error value)? error,
  }) {
    return uploaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Uploading value)? uploading,
    TResult Function(_Processing value)? processing,
    TResult Function(_Uploaded value)? uploaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (uploaded != null) {
      return uploaded(this);
    }
    return orElse();
  }
}

abstract class _Uploaded implements VideoUploadState {
  const factory _Uploaded(Uint8List? thumbnail, VideoAsset asset) = _$_Uploaded;

  Uint8List? get thumbnail;
  VideoAsset get asset;
  @JsonKey(ignore: true)
  _$UploadedCopyWith<_Uploaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$ErrorCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) then) =
      __$ErrorCopyWithImpl<$Res>;
  $Res call({Object error});
}

/// @nodoc
class __$ErrorCopyWithImpl<$Res> extends _$VideoUploadStateCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(_Error _value, $Res Function(_Error) _then)
      : super(_value, (v) => _then(v as _Error));

  @override
  _Error get _value => super._value as _Error;

  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_Error(
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
    return 'VideoUploadState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Error &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  _$ErrorCopyWith<_Error> get copyWith =>
      __$ErrorCopyWithImpl<_Error>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(Uint8List? thumbnail) uploading,
    required TResult Function(Uint8List? thumbnail) processing,
    required TResult Function(Uint8List? thumbnail, VideoAsset asset) uploaded,
    required TResult Function(Object error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Uint8List? thumbnail)? uploading,
    TResult Function(Uint8List? thumbnail)? processing,
    TResult Function(Uint8List? thumbnail, VideoAsset asset)? uploaded,
    TResult Function(Object error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Uint8List? thumbnail)? uploading,
    TResult Function(Uint8List? thumbnail)? processing,
    TResult Function(Uint8List? thumbnail, VideoAsset asset)? uploaded,
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
    required TResult Function(_Initial value) initial,
    required TResult Function(_Uploading value) uploading,
    required TResult Function(_Processing value) processing,
    required TResult Function(_Uploaded value) uploaded,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Uploading value)? uploading,
    TResult Function(_Processing value)? processing,
    TResult Function(_Uploaded value)? uploaded,
    TResult Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Uploading value)? uploading,
    TResult Function(_Processing value)? processing,
    TResult Function(_Uploaded value)? uploaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements VideoUploadState {
  const factory _Error(Object error) = _$_Error;

  Object get error;
  @JsonKey(ignore: true)
  _$ErrorCopyWith<_Error> get copyWith => throw _privateConstructorUsedError;
}
