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

  _Uploading uploading(
      File video, ImageProvider<Object>? thumbnail, int progress) {
    return _Uploading(
      video,
      thumbnail,
      progress,
    );
  }

  _Processing processing(File video, ImageProvider<Object>? thumbnail) {
    return _Processing(
      video,
      thumbnail,
    );
  }

  _Uploaded uploaded(ImageProvider<Object>? thumbnail, VideoAsset asset) {
    return _Uploaded(
      thumbnail,
      asset,
    );
  }

  _UploadError uploadError(Object error,
      {required File video, ImageProvider<Object>? thumbnail}) {
    return _UploadError(
      error,
      video: video,
      thumbnail: thumbnail,
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
    required TResult Function(
            File video, ImageProvider<Object>? thumbnail, int progress)
        uploading,
    required TResult Function(File video, ImageProvider<Object>? thumbnail)
        processing,
    required TResult Function(
            ImageProvider<Object>? thumbnail, VideoAsset asset)
        uploaded,
    required TResult Function(
            Object error, File video, ImageProvider<Object>? thumbnail)
        uploadError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
            File video, ImageProvider<Object>? thumbnail, int progress)?
        uploading,
    TResult Function(File video, ImageProvider<Object>? thumbnail)? processing,
    TResult Function(ImageProvider<Object>? thumbnail, VideoAsset asset)?
        uploaded,
    TResult Function(
            Object error, File video, ImageProvider<Object>? thumbnail)?
        uploadError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
            File video, ImageProvider<Object>? thumbnail, int progress)?
        uploading,
    TResult Function(File video, ImageProvider<Object>? thumbnail)? processing,
    TResult Function(ImageProvider<Object>? thumbnail, VideoAsset asset)?
        uploaded,
    TResult Function(
            Object error, File video, ImageProvider<Object>? thumbnail)?
        uploadError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Uploading value) uploading,
    required TResult Function(_Processing value) processing,
    required TResult Function(_Uploaded value) uploaded,
    required TResult Function(_UploadError value) uploadError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Uploading value)? uploading,
    TResult Function(_Processing value)? processing,
    TResult Function(_Uploaded value)? uploaded,
    TResult Function(_UploadError value)? uploadError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Uploading value)? uploading,
    TResult Function(_Processing value)? processing,
    TResult Function(_Uploaded value)? uploaded,
    TResult Function(_UploadError value)? uploadError,
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
    required TResult Function(
            File video, ImageProvider<Object>? thumbnail, int progress)
        uploading,
    required TResult Function(File video, ImageProvider<Object>? thumbnail)
        processing,
    required TResult Function(
            ImageProvider<Object>? thumbnail, VideoAsset asset)
        uploaded,
    required TResult Function(
            Object error, File video, ImageProvider<Object>? thumbnail)
        uploadError,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
            File video, ImageProvider<Object>? thumbnail, int progress)?
        uploading,
    TResult Function(File video, ImageProvider<Object>? thumbnail)? processing,
    TResult Function(ImageProvider<Object>? thumbnail, VideoAsset asset)?
        uploaded,
    TResult Function(
            Object error, File video, ImageProvider<Object>? thumbnail)?
        uploadError,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
            File video, ImageProvider<Object>? thumbnail, int progress)?
        uploading,
    TResult Function(File video, ImageProvider<Object>? thumbnail)? processing,
    TResult Function(ImageProvider<Object>? thumbnail, VideoAsset asset)?
        uploaded,
    TResult Function(
            Object error, File video, ImageProvider<Object>? thumbnail)?
        uploadError,
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
    required TResult Function(_UploadError value) uploadError,
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
    TResult Function(_UploadError value)? uploadError,
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
    TResult Function(_UploadError value)? uploadError,
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
  $Res call({File video, ImageProvider<Object>? thumbnail, int progress});
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
    Object? video = freezed,
    Object? thumbnail = freezed,
    Object? progress = freezed,
  }) {
    return _then(_Uploading(
      video == freezed
          ? _value.video
          : video // ignore: cast_nullable_to_non_nullable
              as File,
      thumbnail == freezed
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as ImageProvider<Object>?,
      progress == freezed
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_Uploading implements _Uploading {
  const _$_Uploading(this.video, this.thumbnail, this.progress);

  @override
  final File video;
  @override
  final ImageProvider<Object>? thumbnail;
  @override
  final int progress;

  @override
  String toString() {
    return 'VideoUploadState.uploading(video: $video, thumbnail: $thumbnail, progress: $progress)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Uploading &&
            (identical(other.video, video) || other.video == video) &&
            (identical(other.thumbnail, thumbnail) ||
                other.thumbnail == thumbnail) &&
            (identical(other.progress, progress) ||
                other.progress == progress));
  }

  @override
  int get hashCode => Object.hash(runtimeType, video, thumbnail, progress);

  @JsonKey(ignore: true)
  @override
  _$UploadingCopyWith<_Uploading> get copyWith =>
      __$UploadingCopyWithImpl<_Uploading>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
            File video, ImageProvider<Object>? thumbnail, int progress)
        uploading,
    required TResult Function(File video, ImageProvider<Object>? thumbnail)
        processing,
    required TResult Function(
            ImageProvider<Object>? thumbnail, VideoAsset asset)
        uploaded,
    required TResult Function(
            Object error, File video, ImageProvider<Object>? thumbnail)
        uploadError,
  }) {
    return uploading(video, thumbnail, progress);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
            File video, ImageProvider<Object>? thumbnail, int progress)?
        uploading,
    TResult Function(File video, ImageProvider<Object>? thumbnail)? processing,
    TResult Function(ImageProvider<Object>? thumbnail, VideoAsset asset)?
        uploaded,
    TResult Function(
            Object error, File video, ImageProvider<Object>? thumbnail)?
        uploadError,
  }) {
    return uploading?.call(video, thumbnail, progress);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
            File video, ImageProvider<Object>? thumbnail, int progress)?
        uploading,
    TResult Function(File video, ImageProvider<Object>? thumbnail)? processing,
    TResult Function(ImageProvider<Object>? thumbnail, VideoAsset asset)?
        uploaded,
    TResult Function(
            Object error, File video, ImageProvider<Object>? thumbnail)?
        uploadError,
    required TResult orElse(),
  }) {
    if (uploading != null) {
      return uploading(video, thumbnail, progress);
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
    required TResult Function(_UploadError value) uploadError,
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
    TResult Function(_UploadError value)? uploadError,
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
    TResult Function(_UploadError value)? uploadError,
    required TResult orElse(),
  }) {
    if (uploading != null) {
      return uploading(this);
    }
    return orElse();
  }
}

abstract class _Uploading implements VideoUploadState {
  const factory _Uploading(
          File video, ImageProvider<Object>? thumbnail, int progress) =
      _$_Uploading;

  File get video;
  ImageProvider<Object>? get thumbnail;
  int get progress;
  @JsonKey(ignore: true)
  _$UploadingCopyWith<_Uploading> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$ProcessingCopyWith<$Res> {
  factory _$ProcessingCopyWith(
          _Processing value, $Res Function(_Processing) then) =
      __$ProcessingCopyWithImpl<$Res>;
  $Res call({File video, ImageProvider<Object>? thumbnail});
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
    Object? video = freezed,
    Object? thumbnail = freezed,
  }) {
    return _then(_Processing(
      video == freezed
          ? _value.video
          : video // ignore: cast_nullable_to_non_nullable
              as File,
      thumbnail == freezed
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as ImageProvider<Object>?,
    ));
  }
}

/// @nodoc

class _$_Processing implements _Processing {
  const _$_Processing(this.video, this.thumbnail);

  @override
  final File video;
  @override
  final ImageProvider<Object>? thumbnail;

  @override
  String toString() {
    return 'VideoUploadState.processing(video: $video, thumbnail: $thumbnail)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Processing &&
            (identical(other.video, video) || other.video == video) &&
            (identical(other.thumbnail, thumbnail) ||
                other.thumbnail == thumbnail));
  }

  @override
  int get hashCode => Object.hash(runtimeType, video, thumbnail);

  @JsonKey(ignore: true)
  @override
  _$ProcessingCopyWith<_Processing> get copyWith =>
      __$ProcessingCopyWithImpl<_Processing>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
            File video, ImageProvider<Object>? thumbnail, int progress)
        uploading,
    required TResult Function(File video, ImageProvider<Object>? thumbnail)
        processing,
    required TResult Function(
            ImageProvider<Object>? thumbnail, VideoAsset asset)
        uploaded,
    required TResult Function(
            Object error, File video, ImageProvider<Object>? thumbnail)
        uploadError,
  }) {
    return processing(video, thumbnail);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
            File video, ImageProvider<Object>? thumbnail, int progress)?
        uploading,
    TResult Function(File video, ImageProvider<Object>? thumbnail)? processing,
    TResult Function(ImageProvider<Object>? thumbnail, VideoAsset asset)?
        uploaded,
    TResult Function(
            Object error, File video, ImageProvider<Object>? thumbnail)?
        uploadError,
  }) {
    return processing?.call(video, thumbnail);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
            File video, ImageProvider<Object>? thumbnail, int progress)?
        uploading,
    TResult Function(File video, ImageProvider<Object>? thumbnail)? processing,
    TResult Function(ImageProvider<Object>? thumbnail, VideoAsset asset)?
        uploaded,
    TResult Function(
            Object error, File video, ImageProvider<Object>? thumbnail)?
        uploadError,
    required TResult orElse(),
  }) {
    if (processing != null) {
      return processing(video, thumbnail);
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
    required TResult Function(_UploadError value) uploadError,
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
    TResult Function(_UploadError value)? uploadError,
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
    TResult Function(_UploadError value)? uploadError,
    required TResult orElse(),
  }) {
    if (processing != null) {
      return processing(this);
    }
    return orElse();
  }
}

abstract class _Processing implements VideoUploadState {
  const factory _Processing(File video, ImageProvider<Object>? thumbnail) =
      _$_Processing;

  File get video;
  ImageProvider<Object>? get thumbnail;
  @JsonKey(ignore: true)
  _$ProcessingCopyWith<_Processing> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$UploadedCopyWith<$Res> {
  factory _$UploadedCopyWith(_Uploaded value, $Res Function(_Uploaded) then) =
      __$UploadedCopyWithImpl<$Res>;
  $Res call({ImageProvider<Object>? thumbnail, VideoAsset asset});
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
              as ImageProvider<Object>?,
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
  final ImageProvider<Object>? thumbnail;
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
    required TResult Function(
            File video, ImageProvider<Object>? thumbnail, int progress)
        uploading,
    required TResult Function(File video, ImageProvider<Object>? thumbnail)
        processing,
    required TResult Function(
            ImageProvider<Object>? thumbnail, VideoAsset asset)
        uploaded,
    required TResult Function(
            Object error, File video, ImageProvider<Object>? thumbnail)
        uploadError,
  }) {
    return uploaded(thumbnail, asset);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
            File video, ImageProvider<Object>? thumbnail, int progress)?
        uploading,
    TResult Function(File video, ImageProvider<Object>? thumbnail)? processing,
    TResult Function(ImageProvider<Object>? thumbnail, VideoAsset asset)?
        uploaded,
    TResult Function(
            Object error, File video, ImageProvider<Object>? thumbnail)?
        uploadError,
  }) {
    return uploaded?.call(thumbnail, asset);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
            File video, ImageProvider<Object>? thumbnail, int progress)?
        uploading,
    TResult Function(File video, ImageProvider<Object>? thumbnail)? processing,
    TResult Function(ImageProvider<Object>? thumbnail, VideoAsset asset)?
        uploaded,
    TResult Function(
            Object error, File video, ImageProvider<Object>? thumbnail)?
        uploadError,
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
    required TResult Function(_UploadError value) uploadError,
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
    TResult Function(_UploadError value)? uploadError,
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
    TResult Function(_UploadError value)? uploadError,
    required TResult orElse(),
  }) {
    if (uploaded != null) {
      return uploaded(this);
    }
    return orElse();
  }
}

abstract class _Uploaded implements VideoUploadState {
  const factory _Uploaded(ImageProvider<Object>? thumbnail, VideoAsset asset) =
      _$_Uploaded;

  ImageProvider<Object>? get thumbnail;
  VideoAsset get asset;
  @JsonKey(ignore: true)
  _$UploadedCopyWith<_Uploaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$UploadErrorCopyWith<$Res> {
  factory _$UploadErrorCopyWith(
          _UploadError value, $Res Function(_UploadError) then) =
      __$UploadErrorCopyWithImpl<$Res>;
  $Res call({Object error, File video, ImageProvider<Object>? thumbnail});
}

/// @nodoc
class __$UploadErrorCopyWithImpl<$Res>
    extends _$VideoUploadStateCopyWithImpl<$Res>
    implements _$UploadErrorCopyWith<$Res> {
  __$UploadErrorCopyWithImpl(
      _UploadError _value, $Res Function(_UploadError) _then)
      : super(_value, (v) => _then(v as _UploadError));

  @override
  _UploadError get _value => super._value as _UploadError;

  @override
  $Res call({
    Object? error = freezed,
    Object? video = freezed,
    Object? thumbnail = freezed,
  }) {
    return _then(_UploadError(
      error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Object,
      video: video == freezed
          ? _value.video
          : video // ignore: cast_nullable_to_non_nullable
              as File,
      thumbnail: thumbnail == freezed
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as ImageProvider<Object>?,
    ));
  }
}

/// @nodoc

class _$_UploadError implements _UploadError {
  const _$_UploadError(this.error, {required this.video, this.thumbnail});

  @override
  final Object error;
  @override
  final File video;
  @override
  final ImageProvider<Object>? thumbnail;

  @override
  String toString() {
    return 'VideoUploadState.uploadError(error: $error, video: $video, thumbnail: $thumbnail)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UploadError &&
            const DeepCollectionEquality().equals(other.error, error) &&
            (identical(other.video, video) || other.video == video) &&
            (identical(other.thumbnail, thumbnail) ||
                other.thumbnail == thumbnail));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(error), video, thumbnail);

  @JsonKey(ignore: true)
  @override
  _$UploadErrorCopyWith<_UploadError> get copyWith =>
      __$UploadErrorCopyWithImpl<_UploadError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
            File video, ImageProvider<Object>? thumbnail, int progress)
        uploading,
    required TResult Function(File video, ImageProvider<Object>? thumbnail)
        processing,
    required TResult Function(
            ImageProvider<Object>? thumbnail, VideoAsset asset)
        uploaded,
    required TResult Function(
            Object error, File video, ImageProvider<Object>? thumbnail)
        uploadError,
  }) {
    return uploadError(error, video, thumbnail);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
            File video, ImageProvider<Object>? thumbnail, int progress)?
        uploading,
    TResult Function(File video, ImageProvider<Object>? thumbnail)? processing,
    TResult Function(ImageProvider<Object>? thumbnail, VideoAsset asset)?
        uploaded,
    TResult Function(
            Object error, File video, ImageProvider<Object>? thumbnail)?
        uploadError,
  }) {
    return uploadError?.call(error, video, thumbnail);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
            File video, ImageProvider<Object>? thumbnail, int progress)?
        uploading,
    TResult Function(File video, ImageProvider<Object>? thumbnail)? processing,
    TResult Function(ImageProvider<Object>? thumbnail, VideoAsset asset)?
        uploaded,
    TResult Function(
            Object error, File video, ImageProvider<Object>? thumbnail)?
        uploadError,
    required TResult orElse(),
  }) {
    if (uploadError != null) {
      return uploadError(error, video, thumbnail);
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
    required TResult Function(_UploadError value) uploadError,
  }) {
    return uploadError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Uploading value)? uploading,
    TResult Function(_Processing value)? processing,
    TResult Function(_Uploaded value)? uploaded,
    TResult Function(_UploadError value)? uploadError,
  }) {
    return uploadError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Uploading value)? uploading,
    TResult Function(_Processing value)? processing,
    TResult Function(_Uploaded value)? uploaded,
    TResult Function(_UploadError value)? uploadError,
    required TResult orElse(),
  }) {
    if (uploadError != null) {
      return uploadError(this);
    }
    return orElse();
  }
}

abstract class _UploadError implements VideoUploadState {
  const factory _UploadError(Object error,
      {required File video, ImageProvider<Object>? thumbnail}) = _$_UploadError;

  Object get error;
  File get video;
  ImageProvider<Object>? get thumbnail;
  @JsonKey(ignore: true)
  _$UploadErrorCopyWith<_UploadError> get copyWith =>
      throw _privateConstructorUsedError;
}
