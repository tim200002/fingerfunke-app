// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'paginated_list_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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
abstract class _$$_PaginatedlistStateCopyWith<T, $Res>
    implements $PaginatedListStateCopyWith<T, $Res> {
  factory _$$_PaginatedlistStateCopyWith(_$_PaginatedlistState<T> value,
          $Res Function(_$_PaginatedlistState<T>) then) =
      __$$_PaginatedlistStateCopyWithImpl<T, $Res>;
  @override
  $Res call({List<T> items, bool isLoading, bool reachedEnd});
}

/// @nodoc
class __$$_PaginatedlistStateCopyWithImpl<T, $Res>
    extends _$PaginatedListStateCopyWithImpl<T, $Res>
    implements _$$_PaginatedlistStateCopyWith<T, $Res> {
  __$$_PaginatedlistStateCopyWithImpl(_$_PaginatedlistState<T> _value,
      $Res Function(_$_PaginatedlistState<T>) _then)
      : super(_value, (v) => _then(v as _$_PaginatedlistState<T>));

  @override
  _$_PaginatedlistState<T> get _value =>
      super._value as _$_PaginatedlistState<T>;

  @override
  $Res call({
    Object? items = freezed,
    Object? isLoading = freezed,
    Object? reachedEnd = freezed,
  }) {
    return _then(_$_PaginatedlistState<T>(
      items: items == freezed
          ? _value._items
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

class _$_PaginatedlistState<T> extends _PaginatedlistState<T> {
  const _$_PaginatedlistState(
      {required final List<T> items,
      required this.isLoading,
      required this.reachedEnd})
      : _items = items,
        super._();

  final List<T> _items;
  @override
  List<T> get items {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

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
            other is _$_PaginatedlistState<T> &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality()
                .equals(other.reachedEnd, reachedEnd));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_items),
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(reachedEnd));

  @JsonKey(ignore: true)
  @override
  _$$_PaginatedlistStateCopyWith<T, _$_PaginatedlistState<T>> get copyWith =>
      __$$_PaginatedlistStateCopyWithImpl<T, _$_PaginatedlistState<T>>(
          this, _$identity);
}

abstract class _PaginatedlistState<T> extends PaginatedListState<T> {
  const factory _PaginatedlistState(
      {required final List<T> items,
      required final bool isLoading,
      required final bool reachedEnd}) = _$_PaginatedlistState<T>;
  const _PaginatedlistState._() : super._();

  @override
  List<T> get items;
  @override
  bool get isLoading;
  @override
  bool get reachedEnd;
  @override
  @JsonKey(ignore: true)
  _$$_PaginatedlistStateCopyWith<T, _$_PaginatedlistState<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
