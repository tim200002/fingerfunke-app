// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'paginated_list_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PaginatedListEventTearOff {
  const _$PaginatedListEventTearOff();

  RequestNewPage<T> requestNewPage<T>() {
    return RequestNewPage<T>();
  }

  ItemsUpdated<T> itemsUpdated<T>(List<T> items) {
    return ItemsUpdated<T>(
      items,
    );
  }
}

/// @nodoc
const $PaginatedListEvent = _$PaginatedListEventTearOff();

/// @nodoc
mixin _$PaginatedListEvent<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() requestNewPage,
    required TResult Function(List<T> items) itemsUpdated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? requestNewPage,
    TResult Function(List<T> items)? itemsUpdated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? requestNewPage,
    TResult Function(List<T> items)? itemsUpdated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RequestNewPage<T> value) requestNewPage,
    required TResult Function(ItemsUpdated<T> value) itemsUpdated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(RequestNewPage<T> value)? requestNewPage,
    TResult Function(ItemsUpdated<T> value)? itemsUpdated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RequestNewPage<T> value)? requestNewPage,
    TResult Function(ItemsUpdated<T> value)? itemsUpdated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginatedListEventCopyWith<T, $Res> {
  factory $PaginatedListEventCopyWith(PaginatedListEvent<T> value,
          $Res Function(PaginatedListEvent<T>) then) =
      _$PaginatedListEventCopyWithImpl<T, $Res>;
}

/// @nodoc
class _$PaginatedListEventCopyWithImpl<T, $Res>
    implements $PaginatedListEventCopyWith<T, $Res> {
  _$PaginatedListEventCopyWithImpl(this._value, this._then);

  final PaginatedListEvent<T> _value;
  // ignore: unused_field
  final $Res Function(PaginatedListEvent<T>) _then;
}

/// @nodoc
abstract class $RequestNewPageCopyWith<T, $Res> {
  factory $RequestNewPageCopyWith(
          RequestNewPage<T> value, $Res Function(RequestNewPage<T>) then) =
      _$RequestNewPageCopyWithImpl<T, $Res>;
}

/// @nodoc
class _$RequestNewPageCopyWithImpl<T, $Res>
    extends _$PaginatedListEventCopyWithImpl<T, $Res>
    implements $RequestNewPageCopyWith<T, $Res> {
  _$RequestNewPageCopyWithImpl(
      RequestNewPage<T> _value, $Res Function(RequestNewPage<T>) _then)
      : super(_value, (v) => _then(v as RequestNewPage<T>));

  @override
  RequestNewPage<T> get _value => super._value as RequestNewPage<T>;
}

/// @nodoc

class _$RequestNewPage<T> implements RequestNewPage<T> {
  const _$RequestNewPage();

  @override
  String toString() {
    return 'PaginatedListEvent<$T>.requestNewPage()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is RequestNewPage<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() requestNewPage,
    required TResult Function(List<T> items) itemsUpdated,
  }) {
    return requestNewPage();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? requestNewPage,
    TResult Function(List<T> items)? itemsUpdated,
  }) {
    return requestNewPage?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? requestNewPage,
    TResult Function(List<T> items)? itemsUpdated,
    required TResult orElse(),
  }) {
    if (requestNewPage != null) {
      return requestNewPage();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RequestNewPage<T> value) requestNewPage,
    required TResult Function(ItemsUpdated<T> value) itemsUpdated,
  }) {
    return requestNewPage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(RequestNewPage<T> value)? requestNewPage,
    TResult Function(ItemsUpdated<T> value)? itemsUpdated,
  }) {
    return requestNewPage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RequestNewPage<T> value)? requestNewPage,
    TResult Function(ItemsUpdated<T> value)? itemsUpdated,
    required TResult orElse(),
  }) {
    if (requestNewPage != null) {
      return requestNewPage(this);
    }
    return orElse();
  }
}

abstract class RequestNewPage<T> implements PaginatedListEvent<T> {
  const factory RequestNewPage() = _$RequestNewPage<T>;
}

/// @nodoc
abstract class $ItemsUpdatedCopyWith<T, $Res> {
  factory $ItemsUpdatedCopyWith(
          ItemsUpdated<T> value, $Res Function(ItemsUpdated<T>) then) =
      _$ItemsUpdatedCopyWithImpl<T, $Res>;
  $Res call({List<T> items});
}

/// @nodoc
class _$ItemsUpdatedCopyWithImpl<T, $Res>
    extends _$PaginatedListEventCopyWithImpl<T, $Res>
    implements $ItemsUpdatedCopyWith<T, $Res> {
  _$ItemsUpdatedCopyWithImpl(
      ItemsUpdated<T> _value, $Res Function(ItemsUpdated<T>) _then)
      : super(_value, (v) => _then(v as ItemsUpdated<T>));

  @override
  ItemsUpdated<T> get _value => super._value as ItemsUpdated<T>;

  @override
  $Res call({
    Object? items = freezed,
  }) {
    return _then(ItemsUpdated<T>(
      items == freezed
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<T>,
    ));
  }
}

/// @nodoc

class _$ItemsUpdated<T> implements ItemsUpdated<T> {
  const _$ItemsUpdated(this.items);

  @override
  final List<T> items;

  @override
  String toString() {
    return 'PaginatedListEvent<$T>.itemsUpdated(items: $items)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ItemsUpdated<T> &&
            const DeepCollectionEquality().equals(other.items, items));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(items));

  @JsonKey(ignore: true)
  @override
  $ItemsUpdatedCopyWith<T, ItemsUpdated<T>> get copyWith =>
      _$ItemsUpdatedCopyWithImpl<T, ItemsUpdated<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() requestNewPage,
    required TResult Function(List<T> items) itemsUpdated,
  }) {
    return itemsUpdated(items);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? requestNewPage,
    TResult Function(List<T> items)? itemsUpdated,
  }) {
    return itemsUpdated?.call(items);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? requestNewPage,
    TResult Function(List<T> items)? itemsUpdated,
    required TResult orElse(),
  }) {
    if (itemsUpdated != null) {
      return itemsUpdated(items);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RequestNewPage<T> value) requestNewPage,
    required TResult Function(ItemsUpdated<T> value) itemsUpdated,
  }) {
    return itemsUpdated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(RequestNewPage<T> value)? requestNewPage,
    TResult Function(ItemsUpdated<T> value)? itemsUpdated,
  }) {
    return itemsUpdated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RequestNewPage<T> value)? requestNewPage,
    TResult Function(ItemsUpdated<T> value)? itemsUpdated,
    required TResult orElse(),
  }) {
    if (itemsUpdated != null) {
      return itemsUpdated(this);
    }
    return orElse();
  }
}

abstract class ItemsUpdated<T> implements PaginatedListEvent<T> {
  const factory ItemsUpdated(List<T> items) = _$ItemsUpdated<T>;

  List<T> get items;
  @JsonKey(ignore: true)
  $ItemsUpdatedCopyWith<T, ItemsUpdated<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$PaginatedListStateTearOff {
  const _$PaginatedListStateTearOff();

  _PaginatedlistState<T> call<T>(
      {required List<T> items,
      required bool isLoading,
      required bool reachedEnd}) {
    return _PaginatedlistState<T>(
      items: items,
      isLoading: isLoading,
      reachedEnd: reachedEnd,
    );
  }
}

/// @nodoc
const $PaginatedListState = _$PaginatedListStateTearOff();

/// @nodoc
mixin _$PaginatedListState<T> {
  List<T> get items => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get reachedEnd => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PaginatedListStateCopyWith<T, PaginatedListState<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginatedListStateCopyWith<T, $Res> {
  factory $PaginatedListStateCopyWith(PaginatedListState<T> value,
          $Res Function(PaginatedListState<T>) then) =
      _$PaginatedListStateCopyWithImpl<T, $Res>;
  $Res call({List<T> items, bool isLoading, bool reachedEnd});
}

/// @nodoc
class _$PaginatedListStateCopyWithImpl<T, $Res>
    implements $PaginatedListStateCopyWith<T, $Res> {
  _$PaginatedListStateCopyWithImpl(this._value, this._then);

  final PaginatedListState<T> _value;
  // ignore: unused_field
  final $Res Function(PaginatedListState<T>) _then;

  @override
  $Res call({
    Object? items = freezed,
    Object? isLoading = freezed,
    Object? reachedEnd = freezed,
  }) {
    return _then(_value.copyWith(
      items: items == freezed
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<T>,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      reachedEnd: reachedEnd == freezed
          ? _value.reachedEnd
          : reachedEnd // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$PaginatedlistStateCopyWith<T, $Res>
    implements $PaginatedListStateCopyWith<T, $Res> {
  factory _$PaginatedlistStateCopyWith(_PaginatedlistState<T> value,
          $Res Function(_PaginatedlistState<T>) then) =
      __$PaginatedlistStateCopyWithImpl<T, $Res>;
  @override
  $Res call({List<T> items, bool isLoading, bool reachedEnd});
}

/// @nodoc
class __$PaginatedlistStateCopyWithImpl<T, $Res>
    extends _$PaginatedListStateCopyWithImpl<T, $Res>
    implements _$PaginatedlistStateCopyWith<T, $Res> {
  __$PaginatedlistStateCopyWithImpl(_PaginatedlistState<T> _value,
      $Res Function(_PaginatedlistState<T>) _then)
      : super(_value, (v) => _then(v as _PaginatedlistState<T>));

  @override
  _PaginatedlistState<T> get _value => super._value as _PaginatedlistState<T>;

  @override
  $Res call({
    Object? items = freezed,
    Object? isLoading = freezed,
    Object? reachedEnd = freezed,
  }) {
    return _then(_PaginatedlistState<T>(
      items: items == freezed
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<T>,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      reachedEnd: reachedEnd == freezed
          ? _value.reachedEnd
          : reachedEnd // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_PaginatedlistState<T> implements _PaginatedlistState<T> {
  const _$_PaginatedlistState(
      {required this.items, required this.isLoading, required this.reachedEnd});

  @override
  final List<T> items;
  @override
  final bool isLoading;
  @override
  final bool reachedEnd;

  @override
  String toString() {
    return 'PaginatedListState<$T>(items: $items, isLoading: $isLoading, reachedEnd: $reachedEnd)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PaginatedlistState<T> &&
            const DeepCollectionEquality().equals(other.items, items) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.reachedEnd, reachedEnd) ||
                other.reachedEnd == reachedEnd));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(items), isLoading, reachedEnd);

  @JsonKey(ignore: true)
  @override
  _$PaginatedlistStateCopyWith<T, _PaginatedlistState<T>> get copyWith =>
      __$PaginatedlistStateCopyWithImpl<T, _PaginatedlistState<T>>(
          this, _$identity);
}

abstract class _PaginatedlistState<T> implements PaginatedListState<T> {
  const factory _PaginatedlistState(
      {required List<T> items,
      required bool isLoading,
      required bool reachedEnd}) = _$_PaginatedlistState<T>;

  @override
  List<T> get items;
  @override
  bool get isLoading;
  @override
  bool get reachedEnd;
  @override
  @JsonKey(ignore: true)
  _$PaginatedlistStateCopyWith<T, _PaginatedlistState<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
