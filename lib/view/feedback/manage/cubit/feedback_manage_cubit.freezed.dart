// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feedback_manage_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FeedbackManageState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<UserFeedback> feedback, bool showClosed)
        neutral,
    required TResult Function(dynamic e) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<UserFeedback> feedback, bool showClosed)? neutral,
    TResult? Function(dynamic e)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<UserFeedback> feedback, bool showClosed)? neutral,
    TResult Function(dynamic e)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Neutral value) neutral,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Neutral value)? neutral,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Neutral value)? neutral,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeedbackManageStateCopyWith<$Res> {
  factory $FeedbackManageStateCopyWith(
          FeedbackManageState value, $Res Function(FeedbackManageState) then) =
      _$FeedbackManageStateCopyWithImpl<$Res, FeedbackManageState>;
}

/// @nodoc
class _$FeedbackManageStateCopyWithImpl<$Res, $Val extends FeedbackManageState>
    implements $FeedbackManageStateCopyWith<$Res> {
  _$FeedbackManageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_LoadingCopyWith<$Res> {
  factory _$$_LoadingCopyWith(
          _$_Loading value, $Res Function(_$_Loading) then) =
      __$$_LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_LoadingCopyWithImpl<$Res>
    extends _$FeedbackManageStateCopyWithImpl<$Res, _$_Loading>
    implements _$$_LoadingCopyWith<$Res> {
  __$$_LoadingCopyWithImpl(_$_Loading _value, $Res Function(_$_Loading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Loading implements _Loading {
  const _$_Loading();

  @override
  String toString() {
    return 'FeedbackManageState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<UserFeedback> feedback, bool showClosed)
        neutral,
    required TResult Function(dynamic e) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<UserFeedback> feedback, bool showClosed)? neutral,
    TResult? Function(dynamic e)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<UserFeedback> feedback, bool showClosed)? neutral,
    TResult Function(dynamic e)? error,
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
    required TResult Function(_Neutral value) neutral,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Neutral value)? neutral,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Neutral value)? neutral,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements FeedbackManageState {
  const factory _Loading() = _$_Loading;
}

/// @nodoc
abstract class _$$_NeutralCopyWith<$Res> {
  factory _$$_NeutralCopyWith(
          _$_Neutral value, $Res Function(_$_Neutral) then) =
      __$$_NeutralCopyWithImpl<$Res>;
  @useResult
  $Res call({List<UserFeedback> feedback, bool showClosed});
}

/// @nodoc
class __$$_NeutralCopyWithImpl<$Res>
    extends _$FeedbackManageStateCopyWithImpl<$Res, _$_Neutral>
    implements _$$_NeutralCopyWith<$Res> {
  __$$_NeutralCopyWithImpl(_$_Neutral _value, $Res Function(_$_Neutral) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? feedback = null,
    Object? showClosed = null,
  }) {
    return _then(_$_Neutral(
      null == feedback
          ? _value._feedback
          : feedback // ignore: cast_nullable_to_non_nullable
              as List<UserFeedback>,
      null == showClosed
          ? _value.showClosed
          : showClosed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_Neutral implements _Neutral {
  const _$_Neutral(final List<UserFeedback> feedback, this.showClosed)
      : _feedback = feedback;

  final List<UserFeedback> _feedback;
  @override
  List<UserFeedback> get feedback {
    if (_feedback is EqualUnmodifiableListView) return _feedback;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_feedback);
  }

  @override
  final bool showClosed;

  @override
  String toString() {
    return 'FeedbackManageState.neutral(feedback: $feedback, showClosed: $showClosed)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Neutral &&
            const DeepCollectionEquality().equals(other._feedback, _feedback) &&
            (identical(other.showClosed, showClosed) ||
                other.showClosed == showClosed));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_feedback), showClosed);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NeutralCopyWith<_$_Neutral> get copyWith =>
      __$$_NeutralCopyWithImpl<_$_Neutral>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<UserFeedback> feedback, bool showClosed)
        neutral,
    required TResult Function(dynamic e) error,
  }) {
    return neutral(feedback, showClosed);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<UserFeedback> feedback, bool showClosed)? neutral,
    TResult? Function(dynamic e)? error,
  }) {
    return neutral?.call(feedback, showClosed);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<UserFeedback> feedback, bool showClosed)? neutral,
    TResult Function(dynamic e)? error,
    required TResult orElse(),
  }) {
    if (neutral != null) {
      return neutral(feedback, showClosed);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Neutral value) neutral,
    required TResult Function(_Error value) error,
  }) {
    return neutral(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Neutral value)? neutral,
    TResult? Function(_Error value)? error,
  }) {
    return neutral?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Neutral value)? neutral,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (neutral != null) {
      return neutral(this);
    }
    return orElse();
  }
}

abstract class _Neutral implements FeedbackManageState {
  const factory _Neutral(
      final List<UserFeedback> feedback, final bool showClosed) = _$_Neutral;

  List<UserFeedback> get feedback;
  bool get showClosed;
  @JsonKey(ignore: true)
  _$$_NeutralCopyWith<_$_Neutral> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ErrorCopyWith<$Res> {
  factory _$$_ErrorCopyWith(_$_Error value, $Res Function(_$_Error) then) =
      __$$_ErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({dynamic e});
}

/// @nodoc
class __$$_ErrorCopyWithImpl<$Res>
    extends _$FeedbackManageStateCopyWithImpl<$Res, _$_Error>
    implements _$$_ErrorCopyWith<$Res> {
  __$$_ErrorCopyWithImpl(_$_Error _value, $Res Function(_$_Error) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? e = freezed,
  }) {
    return _then(_$_Error(
      freezed == e
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
    return 'FeedbackManageState.error(e: $e)';
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
  @pragma('vm:prefer-inline')
  _$$_ErrorCopyWith<_$_Error> get copyWith =>
      __$$_ErrorCopyWithImpl<_$_Error>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<UserFeedback> feedback, bool showClosed)
        neutral,
    required TResult Function(dynamic e) error,
  }) {
    return error(e);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<UserFeedback> feedback, bool showClosed)? neutral,
    TResult? Function(dynamic e)? error,
  }) {
    return error?.call(e);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<UserFeedback> feedback, bool showClosed)? neutral,
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
    required TResult Function(_Loading value) loading,
    required TResult Function(_Neutral value) neutral,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Neutral value)? neutral,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Neutral value)? neutral,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements FeedbackManageState {
  const factory _Error(final dynamic e) = _$_Error;

  dynamic get e;
  @JsonKey(ignore: true)
  _$$_ErrorCopyWith<_$_Error> get copyWith =>
      throw _privateConstructorUsedError;
}
