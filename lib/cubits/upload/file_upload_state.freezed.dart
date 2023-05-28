// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'file_upload_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FileUploadState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(int progress) uploading,
    required TResult Function() processing,
    required TResult Function(Asset fileAsset) uploaded,
    required TResult Function(Object error) uploadError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(int progress)? uploading,
    TResult? Function()? processing,
    TResult? Function(Asset fileAsset)? uploaded,
    TResult? Function(Object error)? uploadError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(int progress)? uploading,
    TResult Function()? processing,
    TResult Function(Asset fileAsset)? uploaded,
    TResult Function(Object error)? uploadError,
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
abstract class $FileUploadStateCopyWith<$Res> {
  factory $FileUploadStateCopyWith(
          FileUploadState value, $Res Function(FileUploadState) then) =
      _$FileUploadStateCopyWithImpl<$Res, FileUploadState>;
}

/// @nodoc
class _$FileUploadStateCopyWithImpl<$Res, $Val extends FileUploadState>
    implements $FileUploadStateCopyWith<$Res> {
  _$FileUploadStateCopyWithImpl(this._value, this._then);

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
    extends _$FileUploadStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'FileUploadState.initial()';
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
    required TResult Function(int progress) uploading,
    required TResult Function() processing,
    required TResult Function(Asset fileAsset) uploaded,
    required TResult Function(Object error) uploadError,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(int progress)? uploading,
    TResult? Function()? processing,
    TResult? Function(Asset fileAsset)? uploaded,
    TResult? Function(Object error)? uploadError,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(int progress)? uploading,
    TResult Function()? processing,
    TResult Function(Asset fileAsset)? uploaded,
    TResult Function(Object error)? uploadError,
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

abstract class _Initial implements FileUploadState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$$_UploadingCopyWith<$Res> {
  factory _$$_UploadingCopyWith(
          _$_Uploading value, $Res Function(_$_Uploading) then) =
      __$$_UploadingCopyWithImpl<$Res>;
  @useResult
  $Res call({int progress});
}

/// @nodoc
class __$$_UploadingCopyWithImpl<$Res>
    extends _$FileUploadStateCopyWithImpl<$Res, _$_Uploading>
    implements _$$_UploadingCopyWith<$Res> {
  __$$_UploadingCopyWithImpl(
      _$_Uploading _value, $Res Function(_$_Uploading) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? progress = null,
  }) {
    return _then(_$_Uploading(
      null == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_Uploading implements _Uploading {
  const _$_Uploading(this.progress);

  @override
  final int progress;

  @override
  String toString() {
    return 'FileUploadState.uploading(progress: $progress)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Uploading &&
            (identical(other.progress, progress) ||
                other.progress == progress));
  }

  @override
  int get hashCode => Object.hash(runtimeType, progress);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UploadingCopyWith<_$_Uploading> get copyWith =>
      __$$_UploadingCopyWithImpl<_$_Uploading>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(int progress) uploading,
    required TResult Function() processing,
    required TResult Function(Asset fileAsset) uploaded,
    required TResult Function(Object error) uploadError,
  }) {
    return uploading(progress);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(int progress)? uploading,
    TResult? Function()? processing,
    TResult? Function(Asset fileAsset)? uploaded,
    TResult? Function(Object error)? uploadError,
  }) {
    return uploading?.call(progress);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(int progress)? uploading,
    TResult Function()? processing,
    TResult Function(Asset fileAsset)? uploaded,
    TResult Function(Object error)? uploadError,
    required TResult orElse(),
  }) {
    if (uploading != null) {
      return uploading(progress);
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

abstract class _Uploading implements FileUploadState {
  const factory _Uploading(final int progress) = _$_Uploading;

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
}

/// @nodoc
class __$$_ProcessingCopyWithImpl<$Res>
    extends _$FileUploadStateCopyWithImpl<$Res, _$_Processing>
    implements _$$_ProcessingCopyWith<$Res> {
  __$$_ProcessingCopyWithImpl(
      _$_Processing _value, $Res Function(_$_Processing) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Processing implements _Processing {
  const _$_Processing();

  @override
  String toString() {
    return 'FileUploadState.processing()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Processing);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(int progress) uploading,
    required TResult Function() processing,
    required TResult Function(Asset fileAsset) uploaded,
    required TResult Function(Object error) uploadError,
  }) {
    return processing();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(int progress)? uploading,
    TResult? Function()? processing,
    TResult? Function(Asset fileAsset)? uploaded,
    TResult? Function(Object error)? uploadError,
  }) {
    return processing?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(int progress)? uploading,
    TResult Function()? processing,
    TResult Function(Asset fileAsset)? uploaded,
    TResult Function(Object error)? uploadError,
    required TResult orElse(),
  }) {
    if (processing != null) {
      return processing();
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

abstract class _Processing implements FileUploadState {
  const factory _Processing() = _$_Processing;
}

/// @nodoc
abstract class _$$_UploadedCopyWith<$Res> {
  factory _$$_UploadedCopyWith(
          _$_Uploaded value, $Res Function(_$_Uploaded) then) =
      __$$_UploadedCopyWithImpl<$Res>;
  @useResult
  $Res call({Asset fileAsset});
}

/// @nodoc
class __$$_UploadedCopyWithImpl<$Res>
    extends _$FileUploadStateCopyWithImpl<$Res, _$_Uploaded>
    implements _$$_UploadedCopyWith<$Res> {
  __$$_UploadedCopyWithImpl(
      _$_Uploaded _value, $Res Function(_$_Uploaded) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fileAsset = null,
  }) {
    return _then(_$_Uploaded(
      null == fileAsset
          ? _value.fileAsset
          : fileAsset // ignore: cast_nullable_to_non_nullable
              as Asset,
    ));
  }
}

/// @nodoc

class _$_Uploaded implements _Uploaded {
  const _$_Uploaded(this.fileAsset);

  @override
  final Asset fileAsset;

  @override
  String toString() {
    return 'FileUploadState.uploaded(fileAsset: $fileAsset)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Uploaded &&
            (identical(other.fileAsset, fileAsset) ||
                other.fileAsset == fileAsset));
  }

  @override
  int get hashCode => Object.hash(runtimeType, fileAsset);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UploadedCopyWith<_$_Uploaded> get copyWith =>
      __$$_UploadedCopyWithImpl<_$_Uploaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(int progress) uploading,
    required TResult Function() processing,
    required TResult Function(Asset fileAsset) uploaded,
    required TResult Function(Object error) uploadError,
  }) {
    return uploaded(fileAsset);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(int progress)? uploading,
    TResult? Function()? processing,
    TResult? Function(Asset fileAsset)? uploaded,
    TResult? Function(Object error)? uploadError,
  }) {
    return uploaded?.call(fileAsset);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(int progress)? uploading,
    TResult Function()? processing,
    TResult Function(Asset fileAsset)? uploaded,
    TResult Function(Object error)? uploadError,
    required TResult orElse(),
  }) {
    if (uploaded != null) {
      return uploaded(fileAsset);
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

abstract class _Uploaded implements FileUploadState {
  const factory _Uploaded(final Asset fileAsset) = _$_Uploaded;

  Asset get fileAsset;
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
  $Res call({Object error});
}

/// @nodoc
class __$$_UploadErrorCopyWithImpl<$Res>
    extends _$FileUploadStateCopyWithImpl<$Res, _$_UploadError>
    implements _$$_UploadErrorCopyWith<$Res> {
  __$$_UploadErrorCopyWithImpl(
      _$_UploadError _value, $Res Function(_$_UploadError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$_UploadError(
      null == error ? _value.error : error,
    ));
  }
}

/// @nodoc

class _$_UploadError implements _UploadError {
  const _$_UploadError(this.error);

  @override
  final Object error;

  @override
  String toString() {
    return 'FileUploadState.uploadError(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UploadError &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UploadErrorCopyWith<_$_UploadError> get copyWith =>
      __$$_UploadErrorCopyWithImpl<_$_UploadError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(int progress) uploading,
    required TResult Function() processing,
    required TResult Function(Asset fileAsset) uploaded,
    required TResult Function(Object error) uploadError,
  }) {
    return uploadError(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(int progress)? uploading,
    TResult? Function()? processing,
    TResult? Function(Asset fileAsset)? uploaded,
    TResult? Function(Object error)? uploadError,
  }) {
    return uploadError?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(int progress)? uploading,
    TResult Function()? processing,
    TResult Function(Asset fileAsset)? uploaded,
    TResult Function(Object error)? uploadError,
    required TResult orElse(),
  }) {
    if (uploadError != null) {
      return uploadError(error);
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

abstract class _UploadError implements FileUploadState {
  const factory _UploadError(final Object error) = _$_UploadError;

  Object get error;
  @JsonKey(ignore: true)
  _$$_UploadErrorCopyWith<_$_UploadError> get copyWith =>
      throw _privateConstructorUsedError;
}
