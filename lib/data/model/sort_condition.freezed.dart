// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'sort_condition.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SortCondition _$SortConditionFromJson(Map<String, dynamic> json) {
  return _SortCondition.fromJson(json);
}

/// @nodoc
class _$SortConditionTearOff {
  const _$SortConditionTearOff();

  _SortCondition call(@JsonKey(name: 'sort_element') SortElement sortElement,
      @JsonKey(name: 'sort_order') SortOrder sortOrder) {
    return _SortCondition(
      sortElement,
      sortOrder,
    );
  }

  SortCondition fromJson(Map<String, Object?> json) {
    return SortCondition.fromJson(json);
  }
}

/// @nodoc
const $SortCondition = _$SortConditionTearOff();

/// @nodoc
mixin _$SortCondition {
  @JsonKey(name: 'sort_element')
  SortElement get sortElement => throw _privateConstructorUsedError;
  @JsonKey(name: 'sort_order')
  SortOrder get sortOrder => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SortConditionCopyWith<SortCondition> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SortConditionCopyWith<$Res> {
  factory $SortConditionCopyWith(
          SortCondition value, $Res Function(SortCondition) then) =
      _$SortConditionCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'sort_element') SortElement sortElement,
      @JsonKey(name: 'sort_order') SortOrder sortOrder});
}

/// @nodoc
class _$SortConditionCopyWithImpl<$Res>
    implements $SortConditionCopyWith<$Res> {
  _$SortConditionCopyWithImpl(this._value, this._then);

  final SortCondition _value;
  // ignore: unused_field
  final $Res Function(SortCondition) _then;

  @override
  $Res call({
    Object? sortElement = freezed,
    Object? sortOrder = freezed,
  }) {
    return _then(_value.copyWith(
      sortElement: sortElement == freezed
          ? _value.sortElement
          : sortElement // ignore: cast_nullable_to_non_nullable
              as SortElement,
      sortOrder: sortOrder == freezed
          ? _value.sortOrder
          : sortOrder // ignore: cast_nullable_to_non_nullable
              as SortOrder,
    ));
  }
}

/// @nodoc
abstract class _$SortConditionCopyWith<$Res>
    implements $SortConditionCopyWith<$Res> {
  factory _$SortConditionCopyWith(
          _SortCondition value, $Res Function(_SortCondition) then) =
      __$SortConditionCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'sort_element') SortElement sortElement,
      @JsonKey(name: 'sort_order') SortOrder sortOrder});
}

/// @nodoc
class __$SortConditionCopyWithImpl<$Res>
    extends _$SortConditionCopyWithImpl<$Res>
    implements _$SortConditionCopyWith<$Res> {
  __$SortConditionCopyWithImpl(
      _SortCondition _value, $Res Function(_SortCondition) _then)
      : super(_value, (v) => _then(v as _SortCondition));

  @override
  _SortCondition get _value => super._value as _SortCondition;

  @override
  $Res call({
    Object? sortElement = freezed,
    Object? sortOrder = freezed,
  }) {
    return _then(_SortCondition(
      sortElement == freezed
          ? _value.sortElement
          : sortElement // ignore: cast_nullable_to_non_nullable
              as SortElement,
      sortOrder == freezed
          ? _value.sortOrder
          : sortOrder // ignore: cast_nullable_to_non_nullable
              as SortOrder,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SortCondition implements _SortCondition {
  _$_SortCondition(@JsonKey(name: 'sort_element') this.sortElement,
      @JsonKey(name: 'sort_order') this.sortOrder);

  factory _$_SortCondition.fromJson(Map<String, dynamic> json) =>
      _$$_SortConditionFromJson(json);

  @override
  @JsonKey(name: 'sort_element')
  final SortElement sortElement;
  @override
  @JsonKey(name: 'sort_order')
  final SortOrder sortOrder;

  @override
  String toString() {
    return 'SortCondition(sortElement: $sortElement, sortOrder: $sortOrder)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SortCondition &&
            (identical(other.sortElement, sortElement) ||
                other.sortElement == sortElement) &&
            (identical(other.sortOrder, sortOrder) ||
                other.sortOrder == sortOrder));
  }

  @override
  int get hashCode => Object.hash(runtimeType, sortElement, sortOrder);

  @JsonKey(ignore: true)
  @override
  _$SortConditionCopyWith<_SortCondition> get copyWith =>
      __$SortConditionCopyWithImpl<_SortCondition>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SortConditionToJson(this);
  }
}

abstract class _SortCondition implements SortCondition {
  factory _SortCondition(@JsonKey(name: 'sort_element') SortElement sortElement,
      @JsonKey(name: 'sort_order') SortOrder sortOrder) = _$_SortCondition;

  factory _SortCondition.fromJson(Map<String, dynamic> json) =
      _$_SortCondition.fromJson;

  @override
  @JsonKey(name: 'sort_element')
  SortElement get sortElement;
  @override
  @JsonKey(name: 'sort_order')
  SortOrder get sortOrder;
  @override
  @JsonKey(ignore: true)
  _$SortConditionCopyWith<_SortCondition> get copyWith =>
      throw _privateConstructorUsedError;
}
