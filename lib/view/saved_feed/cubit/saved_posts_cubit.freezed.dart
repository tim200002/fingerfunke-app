// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'saved_posts_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SavedPostsStateTearOff {
  const _$SavedPostsStateTearOff();

  _Loading loading() {
    return const _Loading();
  }

  _LoadedButNohthingSaved loadedButNothingSaved() {
    return const _LoadedButNohthingSaved();
  }

  _Loaded loaded(List<Post> posts) {
    return _Loaded(
      posts,
    );
  }
}

/// @nodoc
const $SavedPostsState = _$SavedPostsStateTearOff();

/// @nodoc
mixin _$SavedPostsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() loadedButNothingSaved,
    required TResult Function(List<Post> posts) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? loadedButNothingSaved,
    TResult Function(List<Post> posts)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? loadedButNothingSaved,
    TResult Function(List<Post> posts)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_LoadedButNohthingSaved value)
        loadedButNothingSaved,
    required TResult Function(_Loaded value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadedButNohthingSaved value)? loadedButNothingSaved,
    TResult Function(_Loaded value)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadedButNohthingSaved value)? loadedButNothingSaved,
    TResult Function(_Loaded value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SavedPostsStateCopyWith<$Res> {
  factory $SavedPostsStateCopyWith(
          SavedPostsState value, $Res Function(SavedPostsState) then) =
      _$SavedPostsStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$SavedPostsStateCopyWithImpl<$Res>
    implements $SavedPostsStateCopyWith<$Res> {
  _$SavedPostsStateCopyWithImpl(this._value, this._then);

  final SavedPostsState _value;
  // ignore: unused_field
  final $Res Function(SavedPostsState) _then;
}

/// @nodoc
abstract class _$LoadingCopyWith<$Res> {
  factory _$LoadingCopyWith(_Loading value, $Res Function(_Loading) then) =
      __$LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$LoadingCopyWithImpl<$Res> extends _$SavedPostsStateCopyWithImpl<$Res>
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
    return 'SavedPostsState.loading()';
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
    required TResult Function() loadedButNothingSaved,
    required TResult Function(List<Post> posts) loaded,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? loadedButNothingSaved,
    TResult Function(List<Post> posts)? loaded,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? loadedButNothingSaved,
    TResult Function(List<Post> posts)? loaded,
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
    required TResult Function(_LoadedButNohthingSaved value)
        loadedButNothingSaved,
    required TResult Function(_Loaded value) loaded,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadedButNohthingSaved value)? loadedButNothingSaved,
    TResult Function(_Loaded value)? loaded,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadedButNohthingSaved value)? loadedButNothingSaved,
    TResult Function(_Loaded value)? loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements SavedPostsState {
  const factory _Loading() = _$_Loading;
}

/// @nodoc
abstract class _$LoadedButNohthingSavedCopyWith<$Res> {
  factory _$LoadedButNohthingSavedCopyWith(_LoadedButNohthingSaved value,
          $Res Function(_LoadedButNohthingSaved) then) =
      __$LoadedButNohthingSavedCopyWithImpl<$Res>;
}

/// @nodoc
class __$LoadedButNohthingSavedCopyWithImpl<$Res>
    extends _$SavedPostsStateCopyWithImpl<$Res>
    implements _$LoadedButNohthingSavedCopyWith<$Res> {
  __$LoadedButNohthingSavedCopyWithImpl(_LoadedButNohthingSaved _value,
      $Res Function(_LoadedButNohthingSaved) _then)
      : super(_value, (v) => _then(v as _LoadedButNohthingSaved));

  @override
  _LoadedButNohthingSaved get _value => super._value as _LoadedButNohthingSaved;
}

/// @nodoc

class _$_LoadedButNohthingSaved implements _LoadedButNohthingSaved {
  const _$_LoadedButNohthingSaved();

  @override
  String toString() {
    return 'SavedPostsState.loadedButNothingSaved()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _LoadedButNohthingSaved);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() loadedButNothingSaved,
    required TResult Function(List<Post> posts) loaded,
  }) {
    return loadedButNothingSaved();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? loadedButNothingSaved,
    TResult Function(List<Post> posts)? loaded,
  }) {
    return loadedButNothingSaved?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? loadedButNothingSaved,
    TResult Function(List<Post> posts)? loaded,
    required TResult orElse(),
  }) {
    if (loadedButNothingSaved != null) {
      return loadedButNothingSaved();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_LoadedButNohthingSaved value)
        loadedButNothingSaved,
    required TResult Function(_Loaded value) loaded,
  }) {
    return loadedButNothingSaved(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadedButNohthingSaved value)? loadedButNothingSaved,
    TResult Function(_Loaded value)? loaded,
  }) {
    return loadedButNothingSaved?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadedButNohthingSaved value)? loadedButNothingSaved,
    TResult Function(_Loaded value)? loaded,
    required TResult orElse(),
  }) {
    if (loadedButNothingSaved != null) {
      return loadedButNothingSaved(this);
    }
    return orElse();
  }
}

abstract class _LoadedButNohthingSaved implements SavedPostsState {
  const factory _LoadedButNohthingSaved() = _$_LoadedButNohthingSaved;
}

/// @nodoc
abstract class _$LoadedCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) then) =
      __$LoadedCopyWithImpl<$Res>;
  $Res call({List<Post> posts});
}

/// @nodoc
class __$LoadedCopyWithImpl<$Res> extends _$SavedPostsStateCopyWithImpl<$Res>
    implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(_Loaded _value, $Res Function(_Loaded) _then)
      : super(_value, (v) => _then(v as _Loaded));

  @override
  _Loaded get _value => super._value as _Loaded;

  @override
  $Res call({
    Object? posts = freezed,
  }) {
    return _then(_Loaded(
      posts == freezed
          ? _value.posts
          : posts // ignore: cast_nullable_to_non_nullable
              as List<Post>,
    ));
  }
}

/// @nodoc

class _$_Loaded implements _Loaded {
  const _$_Loaded(this.posts);

  @override
  final List<Post> posts;

  @override
  String toString() {
    return 'SavedPostsState.loaded(posts: $posts)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Loaded &&
            const DeepCollectionEquality().equals(other.posts, posts));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(posts));

  @JsonKey(ignore: true)
  @override
  _$LoadedCopyWith<_Loaded> get copyWith =>
      __$LoadedCopyWithImpl<_Loaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() loadedButNothingSaved,
    required TResult Function(List<Post> posts) loaded,
  }) {
    return loaded(posts);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? loadedButNothingSaved,
    TResult Function(List<Post> posts)? loaded,
  }) {
    return loaded?.call(posts);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? loadedButNothingSaved,
    TResult Function(List<Post> posts)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(posts);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_LoadedButNohthingSaved value)
        loadedButNothingSaved,
    required TResult Function(_Loaded value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadedButNohthingSaved value)? loadedButNothingSaved,
    TResult Function(_Loaded value)? loaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadedButNohthingSaved value)? loadedButNothingSaved,
    TResult Function(_Loaded value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements SavedPostsState {
  const factory _Loaded(List<Post> posts) = _$_Loaded;

  List<Post> get posts;
  @JsonKey(ignore: true)
  _$LoadedCopyWith<_Loaded> get copyWith => throw _privateConstructorUsedError;
}
