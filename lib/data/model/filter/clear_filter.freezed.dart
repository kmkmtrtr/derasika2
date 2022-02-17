// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'clear_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ClearFilter _$ClearFilterFromJson(Map<String, dynamic> json) {
  return _ClearFilter.fromJson(json);
}

/// @nodoc
class _$ClearFilterTearOff {
  const _$ClearFilterTearOff();

  _ClearFilter call(@JsonKey(name: 'use') bool use,
      @JsonKey(name: 'condition') Set<ClearLamp> condition) {
    return _ClearFilter(
      use,
      condition,
    );
  }

  ClearFilter fromJson(Map<String, Object?> json) {
    return ClearFilter.fromJson(json);
  }
}

/// @nodoc
const $ClearFilter = _$ClearFilterTearOff();

/// @nodoc
mixin _$ClearFilter {
  @JsonKey(name: 'use')
  bool get use => throw _privateConstructorUsedError;
  @JsonKey(name: 'condition')
  Set<ClearLamp> get condition => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ClearFilterCopyWith<ClearFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClearFilterCopyWith<$Res> {
  factory $ClearFilterCopyWith(
          ClearFilter value, $Res Function(ClearFilter) then) =
      _$ClearFilterCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'use') bool use,
      @JsonKey(name: 'condition') Set<ClearLamp> condition});
}

/// @nodoc
class _$ClearFilterCopyWithImpl<$Res> implements $ClearFilterCopyWith<$Res> {
  _$ClearFilterCopyWithImpl(this._value, this._then);

  final ClearFilter _value;
  // ignore: unused_field
  final $Res Function(ClearFilter) _then;

  @override
  $Res call({
    Object? use = freezed,
    Object? condition = freezed,
  }) {
    return _then(_value.copyWith(
      use: use == freezed
          ? _value.use
          : use // ignore: cast_nullable_to_non_nullable
              as bool,
      condition: condition == freezed
          ? _value.condition
          : condition // ignore: cast_nullable_to_non_nullable
              as Set<ClearLamp>,
    ));
  }
}

/// @nodoc
abstract class _$ClearFilterCopyWith<$Res>
    implements $ClearFilterCopyWith<$Res> {
  factory _$ClearFilterCopyWith(
          _ClearFilter value, $Res Function(_ClearFilter) then) =
      __$ClearFilterCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'use') bool use,
      @JsonKey(name: 'condition') Set<ClearLamp> condition});
}

/// @nodoc
class __$ClearFilterCopyWithImpl<$Res> extends _$ClearFilterCopyWithImpl<$Res>
    implements _$ClearFilterCopyWith<$Res> {
  __$ClearFilterCopyWithImpl(
      _ClearFilter _value, $Res Function(_ClearFilter) _then)
      : super(_value, (v) => _then(v as _ClearFilter));

  @override
  _ClearFilter get _value => super._value as _ClearFilter;

  @override
  $Res call({
    Object? use = freezed,
    Object? condition = freezed,
  }) {
    return _then(_ClearFilter(
      use == freezed
          ? _value.use
          : use // ignore: cast_nullable_to_non_nullable
              as bool,
      condition == freezed
          ? _value.condition
          : condition // ignore: cast_nullable_to_non_nullable
              as Set<ClearLamp>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ClearFilter extends _ClearFilter {
  _$_ClearFilter(@JsonKey(name: 'use') this.use,
      @JsonKey(name: 'condition') this.condition)
      : super._();

  factory _$_ClearFilter.fromJson(Map<String, dynamic> json) =>
      _$$_ClearFilterFromJson(json);

  @override
  @JsonKey(name: 'use')
  final bool use;
  @override
  @JsonKey(name: 'condition')
  final Set<ClearLamp> condition;

  @override
  String toString() {
    return 'ClearFilter(use: $use, condition: $condition)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ClearFilter &&
            const DeepCollectionEquality().equals(other.use, use) &&
            const DeepCollectionEquality().equals(other.condition, condition));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(use),
      const DeepCollectionEquality().hash(condition));

  @JsonKey(ignore: true)
  @override
  _$ClearFilterCopyWith<_ClearFilter> get copyWith =>
      __$ClearFilterCopyWithImpl<_ClearFilter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ClearFilterToJson(this);
  }
}

abstract class _ClearFilter extends ClearFilter {
  factory _ClearFilter(@JsonKey(name: 'use') bool use,
      @JsonKey(name: 'condition') Set<ClearLamp> condition) = _$_ClearFilter;
  _ClearFilter._() : super._();

  factory _ClearFilter.fromJson(Map<String, dynamic> json) =
      _$_ClearFilter.fromJson;

  @override
  @JsonKey(name: 'use')
  bool get use;
  @override
  @JsonKey(name: 'condition')
  Set<ClearLamp> get condition;
  @override
  @JsonKey(ignore: true)
  _$ClearFilterCopyWith<_ClearFilter> get copyWith =>
      throw _privateConstructorUsedError;
}
