// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'post_editor_proto_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PostEditorProtoStateTearOff {
  const _$PostEditorProtoStateTearOff();

  _Initial call(List<VideoUploadCubit> videoUploadCubits) {
    return _Initial(
      videoUploadCubits,
    );
  }
}

/// @nodoc
const $PostEditorProtoState = _$PostEditorProtoStateTearOff();

/// @nodoc
mixin _$PostEditorProtoState {
  List<VideoUploadCubit> get videoUploadCubits =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PostEditorProtoStateCopyWith<PostEditorProtoState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostEditorProtoStateCopyWith<$Res> {
  factory $PostEditorProtoStateCopyWith(PostEditorProtoState value,
          $Res Function(PostEditorProtoState) then) =
      _$PostEditorProtoStateCopyWithImpl<$Res>;
  $Res call({List<VideoUploadCubit> videoUploadCubits});
}

/// @nodoc
class _$PostEditorProtoStateCopyWithImpl<$Res>
    implements $PostEditorProtoStateCopyWith<$Res> {
  _$PostEditorProtoStateCopyWithImpl(this._value, this._then);

  final PostEditorProtoState _value;
  // ignore: unused_field
  final $Res Function(PostEditorProtoState) _then;

  @override
  $Res call({
    Object? videoUploadCubits = freezed,
  }) {
    return _then(_value.copyWith(
      videoUploadCubits: videoUploadCubits == freezed
          ? _value.videoUploadCubits
          : videoUploadCubits // ignore: cast_nullable_to_non_nullable
              as List<VideoUploadCubit>,
    ));
  }
}

/// @nodoc
abstract class _$InitialCopyWith<$Res>
    implements $PostEditorProtoStateCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
  @override
  $Res call({List<VideoUploadCubit> videoUploadCubits});
}

/// @nodoc
class __$InitialCopyWithImpl<$Res>
    extends _$PostEditorProtoStateCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(_Initial _value, $Res Function(_Initial) _then)
      : super(_value, (v) => _then(v as _Initial));

  @override
  _Initial get _value => super._value as _Initial;

  @override
  $Res call({
    Object? videoUploadCubits = freezed,
  }) {
    return _then(_Initial(
      videoUploadCubits == freezed
          ? _value.videoUploadCubits
          : videoUploadCubits // ignore: cast_nullable_to_non_nullable
              as List<VideoUploadCubit>,
    ));
  }
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial(this.videoUploadCubits);

  @override
  final List<VideoUploadCubit> videoUploadCubits;

  @override
  String toString() {
    return 'PostEditorProtoState(videoUploadCubits: $videoUploadCubits)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Initial &&
            const DeepCollectionEquality()
                .equals(other.videoUploadCubits, videoUploadCubits));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(videoUploadCubits));

  @JsonKey(ignore: true)
  @override
  _$InitialCopyWith<_Initial> get copyWith =>
      __$InitialCopyWithImpl<_Initial>(this, _$identity);
}

abstract class _Initial implements PostEditorProtoState {
  const factory _Initial(List<VideoUploadCubit> videoUploadCubits) = _$_Initial;

  @override
  List<VideoUploadCubit> get videoUploadCubits;
  @override
  @JsonKey(ignore: true)
  _$InitialCopyWith<_Initial> get copyWith =>
      throw _privateConstructorUsedError;
}
