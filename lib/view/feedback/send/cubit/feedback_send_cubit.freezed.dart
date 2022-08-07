// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'feedback_send_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FeedbackSendState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<UserFeedbackCategories> categories,
            TextEditingController title, TextEditingController description)
        editing,
    required TResult Function() sending,
    required TResult Function() sent,
    required TResult Function(dynamic e) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<UserFeedbackCategories> categories,
            TextEditingController title, TextEditingController description)?
        editing,
    TResult Function()? sending,
    TResult Function()? sent,
    TResult Function(dynamic e)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<UserFeedbackCategories> categories,
            TextEditingController title, TextEditingController description)?
        editing,
    TResult Function()? sending,
    TResult Function()? sent,
    TResult Function(dynamic e)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Editing value) editing,
    required TResult Function(_Sending value) sending,
    required TResult Function(_Sent value) sent,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Editing value)? editing,
    TResult Function(_Sending value)? sending,
    TResult Function(_Sent value)? sent,
    TResult Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Editing value)? editing,
    TResult Function(_Sending value)? sending,
    TResult Function(_Sent value)? sent,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeedbackSendStateCopyWith<$Res> {
  factory $FeedbackSendStateCopyWith(
          FeedbackSendState value, $Res Function(FeedbackSendState) then) =
      _$FeedbackSendStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$FeedbackSendStateCopyWithImpl<$Res>
    implements $FeedbackSendStateCopyWith<$Res> {
  _$FeedbackSendStateCopyWithImpl(this._value, this._then);

  final FeedbackSendState _value;
  // ignore: unused_field
  final $Res Function(FeedbackSendState) _then;
}

/// @nodoc
abstract class _$$_EditingCopyWith<$Res> {
  factory _$$_EditingCopyWith(
          _$_Editing value, $Res Function(_$_Editing) then) =
      __$$_EditingCopyWithImpl<$Res>;
  $Res call(
      {List<UserFeedbackCategories> categories,
      TextEditingController title,
      TextEditingController description});
}

/// @nodoc
class __$$_EditingCopyWithImpl<$Res>
    extends _$FeedbackSendStateCopyWithImpl<$Res>
    implements _$$_EditingCopyWith<$Res> {
  __$$_EditingCopyWithImpl(_$_Editing _value, $Res Function(_$_Editing) _then)
      : super(_value, (v) => _then(v as _$_Editing));

  @override
  _$_Editing get _value => super._value as _$_Editing;

  @override
  $Res call({
    Object? categories = freezed,
    Object? title = freezed,
    Object? description = freezed,
  }) {
    return _then(_$_Editing(
      categories == freezed
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<UserFeedbackCategories>,
      title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
    ));
  }
}

/// @nodoc

class _$_Editing implements _Editing {
  const _$_Editing(final List<UserFeedbackCategories> categories, this.title,
      this.description)
      : _categories = categories;

  final List<UserFeedbackCategories> _categories;
  @override
  List<UserFeedbackCategories> get categories {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  final TextEditingController title;
  @override
  final TextEditingController description;

  @override
  String toString() {
    return 'FeedbackSendState.editing(categories: $categories, title: $title, description: $description)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Editing &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality()
                .equals(other.description, description));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_categories),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(description));

  @JsonKey(ignore: true)
  @override
  _$$_EditingCopyWith<_$_Editing> get copyWith =>
      __$$_EditingCopyWithImpl<_$_Editing>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<UserFeedbackCategories> categories,
            TextEditingController title, TextEditingController description)
        editing,
    required TResult Function() sending,
    required TResult Function() sent,
    required TResult Function(dynamic e) error,
  }) {
    return editing(categories, title, description);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<UserFeedbackCategories> categories,
            TextEditingController title, TextEditingController description)?
        editing,
    TResult Function()? sending,
    TResult Function()? sent,
    TResult Function(dynamic e)? error,
  }) {
    return editing?.call(categories, title, description);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<UserFeedbackCategories> categories,
            TextEditingController title, TextEditingController description)?
        editing,
    TResult Function()? sending,
    TResult Function()? sent,
    TResult Function(dynamic e)? error,
    required TResult orElse(),
  }) {
    if (editing != null) {
      return editing(categories, title, description);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Editing value) editing,
    required TResult Function(_Sending value) sending,
    required TResult Function(_Sent value) sent,
    required TResult Function(_Error value) error,
  }) {
    return editing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Editing value)? editing,
    TResult Function(_Sending value)? sending,
    TResult Function(_Sent value)? sent,
    TResult Function(_Error value)? error,
  }) {
    return editing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Editing value)? editing,
    TResult Function(_Sending value)? sending,
    TResult Function(_Sent value)? sent,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (editing != null) {
      return editing(this);
    }
    return orElse();
  }
}

abstract class _Editing implements FeedbackSendState {
  const factory _Editing(
      final List<UserFeedbackCategories> categories,
      final TextEditingController title,
      final TextEditingController description) = _$_Editing;

  List<UserFeedbackCategories> get categories;
  TextEditingController get title;
  TextEditingController get description;
  @JsonKey(ignore: true)
  _$$_EditingCopyWith<_$_Editing> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SendingCopyWith<$Res> {
  factory _$$_SendingCopyWith(
          _$_Sending value, $Res Function(_$_Sending) then) =
      __$$_SendingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_SendingCopyWithImpl<$Res>
    extends _$FeedbackSendStateCopyWithImpl<$Res>
    implements _$$_SendingCopyWith<$Res> {
  __$$_SendingCopyWithImpl(_$_Sending _value, $Res Function(_$_Sending) _then)
      : super(_value, (v) => _then(v as _$_Sending));

  @override
  _$_Sending get _value => super._value as _$_Sending;
}

/// @nodoc

class _$_Sending implements _Sending {
  const _$_Sending();

  @override
  String toString() {
    return 'FeedbackSendState.sending()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Sending);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<UserFeedbackCategories> categories,
            TextEditingController title, TextEditingController description)
        editing,
    required TResult Function() sending,
    required TResult Function() sent,
    required TResult Function(dynamic e) error,
  }) {
    return sending();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<UserFeedbackCategories> categories,
            TextEditingController title, TextEditingController description)?
        editing,
    TResult Function()? sending,
    TResult Function()? sent,
    TResult Function(dynamic e)? error,
  }) {
    return sending?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<UserFeedbackCategories> categories,
            TextEditingController title, TextEditingController description)?
        editing,
    TResult Function()? sending,
    TResult Function()? sent,
    TResult Function(dynamic e)? error,
    required TResult orElse(),
  }) {
    if (sending != null) {
      return sending();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Editing value) editing,
    required TResult Function(_Sending value) sending,
    required TResult Function(_Sent value) sent,
    required TResult Function(_Error value) error,
  }) {
    return sending(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Editing value)? editing,
    TResult Function(_Sending value)? sending,
    TResult Function(_Sent value)? sent,
    TResult Function(_Error value)? error,
  }) {
    return sending?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Editing value)? editing,
    TResult Function(_Sending value)? sending,
    TResult Function(_Sent value)? sent,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (sending != null) {
      return sending(this);
    }
    return orElse();
  }
}

abstract class _Sending implements FeedbackSendState {
  const factory _Sending() = _$_Sending;
}

/// @nodoc
abstract class _$$_SentCopyWith<$Res> {
  factory _$$_SentCopyWith(_$_Sent value, $Res Function(_$_Sent) then) =
      __$$_SentCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_SentCopyWithImpl<$Res> extends _$FeedbackSendStateCopyWithImpl<$Res>
    implements _$$_SentCopyWith<$Res> {
  __$$_SentCopyWithImpl(_$_Sent _value, $Res Function(_$_Sent) _then)
      : super(_value, (v) => _then(v as _$_Sent));

  @override
  _$_Sent get _value => super._value as _$_Sent;
}

/// @nodoc

class _$_Sent implements _Sent {
  const _$_Sent();

  @override
  String toString() {
    return 'FeedbackSendState.sent()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Sent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<UserFeedbackCategories> categories,
            TextEditingController title, TextEditingController description)
        editing,
    required TResult Function() sending,
    required TResult Function() sent,
    required TResult Function(dynamic e) error,
  }) {
    return sent();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<UserFeedbackCategories> categories,
            TextEditingController title, TextEditingController description)?
        editing,
    TResult Function()? sending,
    TResult Function()? sent,
    TResult Function(dynamic e)? error,
  }) {
    return sent?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<UserFeedbackCategories> categories,
            TextEditingController title, TextEditingController description)?
        editing,
    TResult Function()? sending,
    TResult Function()? sent,
    TResult Function(dynamic e)? error,
    required TResult orElse(),
  }) {
    if (sent != null) {
      return sent();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Editing value) editing,
    required TResult Function(_Sending value) sending,
    required TResult Function(_Sent value) sent,
    required TResult Function(_Error value) error,
  }) {
    return sent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Editing value)? editing,
    TResult Function(_Sending value)? sending,
    TResult Function(_Sent value)? sent,
    TResult Function(_Error value)? error,
  }) {
    return sent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Editing value)? editing,
    TResult Function(_Sending value)? sending,
    TResult Function(_Sent value)? sent,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (sent != null) {
      return sent(this);
    }
    return orElse();
  }
}

abstract class _Sent implements FeedbackSendState {
  const factory _Sent() = _$_Sent;
}

/// @nodoc
abstract class _$$_ErrorCopyWith<$Res> {
  factory _$$_ErrorCopyWith(_$_Error value, $Res Function(_$_Error) then) =
      __$$_ErrorCopyWithImpl<$Res>;
  $Res call({dynamic e});
}

/// @nodoc
class __$$_ErrorCopyWithImpl<$Res> extends _$FeedbackSendStateCopyWithImpl<$Res>
    implements _$$_ErrorCopyWith<$Res> {
  __$$_ErrorCopyWithImpl(_$_Error _value, $Res Function(_$_Error) _then)
      : super(_value, (v) => _then(v as _$_Error));

  @override
  _$_Error get _value => super._value as _$_Error;

  @override
  $Res call({
    Object? e = freezed,
  }) {
    return _then(_$_Error(
      e == freezed
          ? _value.e
          : e // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

class _$_Error implements _Error {
  const _$_Error(this.e);

  @override
  final dynamic e;

  @override
  String toString() {
    return 'FeedbackSendState.error(e: $e)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Error &&
            const DeepCollectionEquality().equals(other.e, e));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(e));

  @JsonKey(ignore: true)
  @override
  _$$_ErrorCopyWith<_$_Error> get copyWith =>
      __$$_ErrorCopyWithImpl<_$_Error>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<UserFeedbackCategories> categories,
            TextEditingController title, TextEditingController description)
        editing,
    required TResult Function() sending,
    required TResult Function() sent,
    required TResult Function(dynamic e) error,
  }) {
    return error(e);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<UserFeedbackCategories> categories,
            TextEditingController title, TextEditingController description)?
        editing,
    TResult Function()? sending,
    TResult Function()? sent,
    TResult Function(dynamic e)? error,
  }) {
    return error?.call(e);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<UserFeedbackCategories> categories,
            TextEditingController title, TextEditingController description)?
        editing,
    TResult Function()? sending,
    TResult Function()? sent,
    TResult Function(dynamic e)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(e);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Editing value) editing,
    required TResult Function(_Sending value) sending,
    required TResult Function(_Sent value) sent,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Editing value)? editing,
    TResult Function(_Sending value)? sending,
    TResult Function(_Sent value)? sent,
    TResult Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Editing value)? editing,
    TResult Function(_Sending value)? sending,
    TResult Function(_Sent value)? sent,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements FeedbackSendState {
  const factory _Error(final dynamic e) = _$_Error;

  dynamic get e;
  @JsonKey(ignore: true)
  _$$_ErrorCopyWith<_$_Error> get copyWith =>
      throw _privateConstructorUsedError;
}
