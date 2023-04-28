// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'video_upload_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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
    TResult? Function()? initial,
    TResult? Function(
            File video, ImageProvider<Object>? thumbnail, int progress)?
        uploading,
    TResult? Function(File video, ImageProvider<Object>? thumbnail)? processing,
    TResult? Function(ImageProvider<Object>? thumbnail, VideoAsset asset)?
        uploaded,
    TResult? Function(
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
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Uploading value)? uploading,
    TResult? Function(_Processing value)? processing,
    TResult? Function(_Uploaded value)? uploaded,
    TResult? Function(_UploadError value)? uploadError,
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
      _$VideoUploadStateCopyWithImpl<$Res, VideoUploadState>;
}

/// @nodoc
class _$VideoUploadStateCopyWithImpl<$Res, $Val extends VideoUploadState>
    implements $VideoUploadStateCopyWith<$Res> {
  _$VideoUploadStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$VideoUploadStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);
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
        (other.runtimeType == runtimeType && other is _$_Initial);
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
    TResult? Function()? initial,
    TResult? Function(
            File video, ImageProvider<Object>? thumbnail, int progress)?
        uploading,
    TResult? Function(File video, ImageProvider<Object>? thumbnail)? processing,
    TResult? Function(ImageProvider<Object>? thumbnail, VideoAsset asset)?
        uploaded,
    TResult? Function(
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
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Uploading value)? uploading,
    TResult? Function(_Processing value)? processing,
    TResult? Function(_Uploaded value)? uploaded,
    TResult? Function(_UploadError value)? uploadError,
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
abstract class _$$_UploadingCopyWith<$Res> {
  factory _$$_UploadingCopyWith(
          _$_Uploading value, $Res Function(_$_Uploading) then) =
      __$$_UploadingCopyWithImpl<$Res>;
  @useResult
  $Res call({File video, ImageProvider<Object>? thumbnail, int progress});
}

/// @nodoc
class __$$_UploadingCopyWithImpl<$Res>
    extends _$VideoUploadStateCopyWithImpl<$Res, _$_Uploading>
    implements _$$_UploadingCopyWith<$Res> {
  __$$_UploadingCopyWithImpl(
      _$_Uploading _value, $Res Function(_$_Uploading) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? video = null,
    Object? thumbnail = freezed,
    Object? progress = null,
  }) {
    return _then(_$_Uploading(
      null == video
          ? _value.video
          : video // ignore: cast_nullable_to_non_nullable
              as File,
      freezed == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as ImageProvider<Object>?,
      null == progress
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
            other is _$_Uploading &&
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
  @pragma('vm:prefer-inline')
  _$$_UploadingCopyWith<_$_Uploading> get copyWith =>
      __$$_UploadingCopyWithImpl<_$_Uploading>(this, _$identity);

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
    TResult? Function()? initial,
    TResult? Function(
            File video, ImageProvider<Object>? thumbnail, int progress)?
        uploading,
    TResult? Function(File video, ImageProvider<Object>? thumbnail)? processing,
    TResult? Function(ImageProvider<Object>? thumbnail, VideoAsset asset)?
        uploaded,
    TResult? Function(
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
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Uploading value)? uploading,
    TResult? Function(_Processing value)? processing,
    TResult? Function(_Uploaded value)? uploaded,
    TResult? Function(_UploadError value)? uploadError,
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
      final File video,
      final ImageProvider<Object>? thumbnail,
      final int progress) = _$_Uploading;

  File get video;
  ImageProvider<Object>? get thumbnail;
  int get progress;
  @JsonKey(ignore: true)
  _$$_UploadingCopyWith<_$_Uploading> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ProcessingCopyWith<$Res> {
  factory _$$_ProcessingCopyWith(
          _$_Processing value, $Res Function(_$_Processing) then) =
      __$$_ProcessingCopyWithImpl<$Res>;
  @useResult
  $Res call({File video, ImageProvider<Object>? thumbnail});
}

/// @nodoc
class __$$_ProcessingCopyWithImpl<$Res>
    extends _$VideoUploadStateCopyWithImpl<$Res, _$_Processing>
    implements _$$_ProcessingCopyWith<$Res> {
  __$$_ProcessingCopyWithImpl(
      _$_Processing _value, $Res Function(_$_Processing) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? video = null,
    Object? thumbnail = freezed,
  }) {
    return _then(_$_Processing(
      null == video
          ? _value.video
          : video // ignore: cast_nullable_to_non_nullable
              as File,
      freezed == thumbnail
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
            other is _$_Processing &&
            (identical(other.video, video) || other.video == video) &&
            (identical(other.thumbnail, thumbnail) ||
                other.thumbnail == thumbnail));
  }

  @override
  int get hashCode => Object.hash(runtimeType, video, thumbnail);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProcessingCopyWith<_$_Processing> get copyWith =>
      __$$_ProcessingCopyWithImpl<_$_Processing>(this, _$identity);

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
    TResult? Function()? initial,
    TResult? Function(
            File video, ImageProvider<Object>? thumbnail, int progress)?
        uploading,
    TResult? Function(File video, ImageProvider<Object>? thumbnail)? processing,
    TResult? Function(ImageProvider<Object>? thumbnail, VideoAsset asset)?
        uploaded,
    TResult? Function(
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
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Uploading value)? uploading,
    TResult? Function(_Processing value)? processing,
    TResult? Function(_Uploaded value)? uploaded,
    TResult? Function(_UploadError value)? uploadError,
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
  const factory _Processing(
      final File video, final ImageProvider<Object>? thumbnail) = _$_Processing;

  File get video;
  ImageProvider<Object>? get thumbnail;
  @JsonKey(ignore: true)
  _$$_ProcessingCopyWith<_$_Processing> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_UploadedCopyWith<$Res> {
  factory _$$_UploadedCopyWith(
          _$_Uploaded value, $Res Function(_$_Uploaded) then) =
      __$$_UploadedCopyWithImpl<$Res>;
  @useResult
  $Res call({ImageProvider<Object>? thumbnail, VideoAsset asset});
}

/// @nodoc
class __$$_UploadedCopyWithImpl<$Res>
    extends _$VideoUploadStateCopyWithImpl<$Res, _$_Uploaded>
    implements _$$_UploadedCopyWith<$Res> {
  __$$_UploadedCopyWithImpl(
      _$_Uploaded _value, $Res Function(_$_Uploaded) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? thumbnail = freezed,
    Object? asset = null,
  }) {
    return _then(_$_Uploaded(
      freezed == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as ImageProvider<Object>?,
      null == asset
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
            other is _$_Uploaded &&
            (identical(other.thumbnail, thumbnail) ||
                other.thumbnail == thumbnail) &&
            (identical(other.asset, asset) || other.asset == asset));
  }

  @override
  int get hashCode => Object.hash(runtimeType, thumbnail, asset);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UploadedCopyWith<_$_Uploaded> get copyWith =>
      __$$_UploadedCopyWithImpl<_$_Uploaded>(this, _$identity);

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
    TResult? Function()? initial,
    TResult? Function(
            File video, ImageProvider<Object>? thumbnail, int progress)?
        uploading,
    TResult? Function(File video, ImageProvider<Object>? thumbnail)? processing,
    TResult? Function(ImageProvider<Object>? thumbnail, VideoAsset asset)?
        uploaded,
    TResult? Function(
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
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Uploading value)? uploading,
    TResult? Function(_Processing value)? processing,
    TResult? Function(_Uploaded value)? uploaded,
    TResult? Function(_UploadError value)? uploadError,
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
  const factory _Uploaded(
          final ImageProvider<Object>? thumbnail, final VideoAsset asset) =
      _$_Uploaded;

  ImageProvider<Object>? get thumbnail;
  VideoAsset get asset;
  @JsonKey(ignore: true)
  _$$_UploadedCopyWith<_$_Uploaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_UploadErrorCopyWith<$Res> {
  factory _$$_UploadErrorCopyWith(
          _$_UploadError value, $Res Function(_$_UploadError) then) =
      __$$_UploadErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({Object error, File video, ImageProvider<Object>? thumbnail});
}

/// @nodoc
class __$$_UploadErrorCopyWithImpl<$Res>
    extends _$VideoUploadStateCopyWithImpl<$Res, _$_UploadError>
    implements _$$_UploadErrorCopyWith<$Res> {
  __$$_UploadErrorCopyWithImpl(
      _$_UploadError _value, $Res Function(_$_UploadError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
    Object? video = null,
    Object? thumbnail = freezed,
  }) {
    return _then(_$_UploadError(
      null == error ? _value.error : error,
      video: null == video
          ? _value.video
          : video // ignore: cast_nullable_to_non_nullable
              as File,
      thumbnail: freezed == thumbnail
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
            other is _$_UploadError &&
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
  @pragma('vm:prefer-inline')
  _$$_UploadErrorCopyWith<_$_UploadError> get copyWith =>
      __$$_UploadErrorCopyWithImpl<_$_UploadError>(this, _$identity);

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
    TResult? Function()? initial,
    TResult? Function(
            File video, ImageProvider<Object>? thumbnail, int progress)?
        uploading,
    TResult? Function(File video, ImageProvider<Object>? thumbnail)? processing,
    TResult? Function(ImageProvider<Object>? thumbnail, VideoAsset asset)?
        uploaded,
    TResult? Function(
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
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Uploading value)? uploading,
    TResult? Function(_Processing value)? processing,
    TResult? Function(_Uploaded value)? uploaded,
    TResult? Function(_UploadError value)? uploadError,
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
  const factory _UploadError(final Object error,
      {required final File video,
      final ImageProvider<Object>? thumbnail}) = _$_UploadError;

  Object get error;
  File get video;
  ImageProvider<Object>? get thumbnail;
  @JsonKey(ignore: true)
  _$$_UploadErrorCopyWith<_$_UploadError> get copyWith =>
      throw _privateConstructorUsedError;
}
