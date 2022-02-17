// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'score_rate_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ScoreRange _$ScoreRangeFromJson(Map<String, dynamic> json) {
  return _ScoreRange.fromJson(json);
}

/// @nodoc
class _$ScoreRangeTearOff {
  const _$ScoreRangeTearOff();

  _ScoreRange call(@JsonKey(name: 'lower') ScoreRateCondition lower,
      @JsonKey(name: 'upper') ScoreRateCondition upper) {
    return _ScoreRange(
      lower,
      upper,
    );
  }

  ScoreRange fromJson(Map<String, Object?> json) {
    return ScoreRange.fromJson(json);
  }
}

/// @nodoc
const $ScoreRange = _$ScoreRangeTearOff();

/// @nodoc
mixin _$ScoreRange {
  @JsonKey(name: 'lower')
  ScoreRateCondition get lower => throw _privateConstructorUsedError;
  @JsonKey(name: 'upper')
  ScoreRateCondition get upper => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ScoreRangeCopyWith<ScoreRange> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScoreRangeCopyWith<$Res> {
  factory $ScoreRangeCopyWith(
          ScoreRange value, $Res Function(ScoreRange) then) =
      _$ScoreRangeCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'lower') ScoreRateCondition lower,
      @JsonKey(name: 'upper') ScoreRateCondition upper});
}

/// @nodoc
class _$ScoreRangeCopyWithImpl<$Res> implements $ScoreRangeCopyWith<$Res> {
  _$ScoreRangeCopyWithImpl(this._value, this._then);

  final ScoreRange _value;
  // ignore: unused_field
  final $Res Function(ScoreRange) _then;

  @override
  $Res call({
    Object? lower = freezed,
    Object? upper = freezed,
  }) {
    return _then(_value.copyWith(
      lower: lower == freezed
          ? _value.lower
          : lower // ignore: cast_nullable_to_non_nullable
              as ScoreRateCondition,
      upper: upper == freezed
          ? _value.upper
          : upper // ignore: cast_nullable_to_non_nullable
              as ScoreRateCondition,
    ));
  }
}

/// @nodoc
abstract class _$ScoreRangeCopyWith<$Res> implements $ScoreRangeCopyWith<$Res> {
  factory _$ScoreRangeCopyWith(
          _ScoreRange value, $Res Function(_ScoreRange) then) =
      __$ScoreRangeCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'lower') ScoreRateCondition lower,
      @JsonKey(name: 'upper') ScoreRateCondition upper});
}

/// @nodoc
class __$ScoreRangeCopyWithImpl<$Res> extends _$ScoreRangeCopyWithImpl<$Res>
    implements _$ScoreRangeCopyWith<$Res> {
  __$ScoreRangeCopyWithImpl(
      _ScoreRange _value, $Res Function(_ScoreRange) _then)
      : super(_value, (v) => _then(v as _ScoreRange));

  @override
  _ScoreRange get _value => super._value as _ScoreRange;

  @override
  $Res call({
    Object? lower = freezed,
    Object? upper = freezed,
  }) {
    return _then(_ScoreRange(
      lower == freezed
          ? _value.lower
          : lower // ignore: cast_nullable_to_non_nullable
              as ScoreRateCondition,
      upper == freezed
          ? _value.upper
          : upper // ignore: cast_nullable_to_non_nullable
              as ScoreRateCondition,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ScoreRange extends _ScoreRange {
  _$_ScoreRange(
      @JsonKey(name: 'lower') this.lower, @JsonKey(name: 'upper') this.upper)
      : super._();

  factory _$_ScoreRange.fromJson(Map<String, dynamic> json) =>
      _$$_ScoreRangeFromJson(json);

  @override
  @JsonKey(name: 'lower')
  final ScoreRateCondition lower;
  @override
  @JsonKey(name: 'upper')
  final ScoreRateCondition upper;

  @override
  String toString() {
    return 'ScoreRange(lower: $lower, upper: $upper)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ScoreRange &&
            const DeepCollectionEquality().equals(other.lower, lower) &&
            const DeepCollectionEquality().equals(other.upper, upper));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(lower),
      const DeepCollectionEquality().hash(upper));

  @JsonKey(ignore: true)
  @override
  _$ScoreRangeCopyWith<_ScoreRange> get copyWith =>
      __$ScoreRangeCopyWithImpl<_ScoreRange>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ScoreRangeToJson(this);
  }
}

abstract class _ScoreRange extends ScoreRange {
  factory _ScoreRange(@JsonKey(name: 'lower') ScoreRateCondition lower,
      @JsonKey(name: 'upper') ScoreRateCondition upper) = _$_ScoreRange;
  _ScoreRange._() : super._();

  factory _ScoreRange.fromJson(Map<String, dynamic> json) =
      _$_ScoreRange.fromJson;

  @override
  @JsonKey(name: 'lower')
  ScoreRateCondition get lower;
  @override
  @JsonKey(name: 'upper')
  ScoreRateCondition get upper;
  @override
  @JsonKey(ignore: true)
  _$ScoreRangeCopyWith<_ScoreRange> get copyWith =>
      throw _privateConstructorUsedError;
}

ScoreRateFilter _$ScoreRateFilterFromJson(Map<String, dynamic> json) {
  return _ScoreRateFilter.fromJson(json);
}

/// @nodoc
class _$ScoreRateFilterTearOff {
  const _$ScoreRateFilterTearOff();

  _ScoreRateFilter call(@JsonKey(name: 'use') bool use,
      @JsonKey(name: 'condition') ScoreRange condition) {
    return _ScoreRateFilter(
      use,
      condition,
    );
  }

  ScoreRateFilter fromJson(Map<String, Object?> json) {
    return ScoreRateFilter.fromJson(json);
  }
}

/// @nodoc
const $ScoreRateFilter = _$ScoreRateFilterTearOff();

/// @nodoc
mixin _$ScoreRateFilter {
  @JsonKey(name: 'use')
  bool get use => throw _privateConstructorUsedError;
  @JsonKey(name: 'condition')
  ScoreRange get condition => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ScoreRateFilterCopyWith<ScoreRateFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScoreRateFilterCopyWith<$Res> {
  factory $ScoreRateFilterCopyWith(
          ScoreRateFilter value, $Res Function(ScoreRateFilter) then) =
      _$ScoreRateFilterCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'use') bool use,
      @JsonKey(name: 'condition') ScoreRange condition});

  $ScoreRangeCopyWith<$Res> get condition;
}

/// @nodoc
class _$ScoreRateFilterCopyWithImpl<$Res>
    implements $ScoreRateFilterCopyWith<$Res> {
  _$ScoreRateFilterCopyWithImpl(this._value, this._then);

  final ScoreRateFilter _value;
  // ignore: unused_field
  final $Res Function(ScoreRateFilter) _then;

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
              as ScoreRange,
    ));
  }

  @override
  $ScoreRangeCopyWith<$Res> get condition {
    return $ScoreRangeCopyWith<$Res>(_value.condition, (value) {
      return _then(_value.copyWith(condition: value));
    });
  }
}

/// @nodoc
abstract class _$ScoreRateFilterCopyWith<$Res>
    implements $ScoreRateFilterCopyWith<$Res> {
  factory _$ScoreRateFilterCopyWith(
          _ScoreRateFilter value, $Res Function(_ScoreRateFilter) then) =
      __$ScoreRateFilterCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'use') bool use,
      @JsonKey(name: 'condition') ScoreRange condition});

  @override
  $ScoreRangeCopyWith<$Res> get condition;
}

/// @nodoc
class __$ScoreRateFilterCopyWithImpl<$Res>
    extends _$ScoreRateFilterCopyWithImpl<$Res>
    implements _$ScoreRateFilterCopyWith<$Res> {
  __$ScoreRateFilterCopyWithImpl(
      _ScoreRateFilter _value, $Res Function(_ScoreRateFilter) _then)
      : super(_value, (v) => _then(v as _ScoreRateFilter));

  @override
  _ScoreRateFilter get _value => super._value as _ScoreRateFilter;

  @override
  $Res call({
    Object? use = freezed,
    Object? condition = freezed,
  }) {
    return _then(_ScoreRateFilter(
      use == freezed
          ? _value.use
          : use // ignore: cast_nullable_to_non_nullable
              as bool,
      condition == freezed
          ? _value.condition
          : condition // ignore: cast_nullable_to_non_nullable
              as ScoreRange,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ScoreRateFilter extends _ScoreRateFilter {
  _$_ScoreRateFilter(@JsonKey(name: 'use') this.use,
      @JsonKey(name: 'condition') this.condition)
      : super._();

  factory _$_ScoreRateFilter.fromJson(Map<String, dynamic> json) =>
      _$$_ScoreRateFilterFromJson(json);

  @override
  @JsonKey(name: 'use')
  final bool use;
  @override
  @JsonKey(name: 'condition')
  final ScoreRange condition;

  @override
  String toString() {
    return 'ScoreRateFilter(use: $use, condition: $condition)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ScoreRateFilter &&
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
  _$ScoreRateFilterCopyWith<_ScoreRateFilter> get copyWith =>
      __$ScoreRateFilterCopyWithImpl<_ScoreRateFilter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ScoreRateFilterToJson(this);
  }
}

abstract class _ScoreRateFilter extends ScoreRateFilter {
  factory _ScoreRateFilter(@JsonKey(name: 'use') bool use,
      @JsonKey(name: 'condition') ScoreRange condition) = _$_ScoreRateFilter;
  _ScoreRateFilter._() : super._();

  factory _ScoreRateFilter.fromJson(Map<String, dynamic> json) =
      _$_ScoreRateFilter.fromJson;

  @override
  @JsonKey(name: 'use')
  bool get use;
  @override
  @JsonKey(name: 'condition')
  ScoreRange get condition;
  @override
  @JsonKey(ignore: true)
  _$ScoreRateFilterCopyWith<_ScoreRateFilter> get copyWith =>
      throw _privateConstructorUsedError;
}
