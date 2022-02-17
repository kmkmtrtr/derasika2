// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'level_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LevelFilter _$LevelFilterFromJson(Map<String, dynamic> json) {
  return _LevelFilter.fromJson(json);
}

/// @nodoc
class _$LevelFilterTearOff {
  const _$LevelFilterTearOff();

  _LevelFilter call(@JsonKey(name: 'use') bool use,
      @JsonKey(name: 'condition') Set<int> condition) {
    return _LevelFilter(
      use,
      condition,
    );
  }

  LevelFilter fromJson(Map<String, Object?> json) {
    return LevelFilter.fromJson(json);
  }
}

/// @nodoc
const $LevelFilter = _$LevelFilterTearOff();

/// @nodoc
mixin _$LevelFilter {
  @JsonKey(name: 'use')
  bool get use => throw _privateConstructorUsedError;
  @JsonKey(name: 'condition')
  Set<int> get condition => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LevelFilterCopyWith<LevelFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LevelFilterCopyWith<$Res> {
  factory $LevelFilterCopyWith(
          LevelFilter value, $Res Function(LevelFilter) then) =
      _$LevelFilterCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'use') bool use,
      @JsonKey(name: 'condition') Set<int> condition});
}

/// @nodoc
class _$LevelFilterCopyWithImpl<$Res> implements $LevelFilterCopyWith<$Res> {
  _$LevelFilterCopyWithImpl(this._value, this._then);

  final LevelFilter _value;
  // ignore: unused_field
  final $Res Function(LevelFilter) _then;

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
              as Set<int>,
    ));
  }
}

/// @nodoc
abstract class _$LevelFilterCopyWith<$Res>
    implements $LevelFilterCopyWith<$Res> {
  factory _$LevelFilterCopyWith(
          _LevelFilter value, $Res Function(_LevelFilter) then) =
      __$LevelFilterCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'use') bool use,
      @JsonKey(name: 'condition') Set<int> condition});
}

/// @nodoc
class __$LevelFilterCopyWithImpl<$Res> extends _$LevelFilterCopyWithImpl<$Res>
    implements _$LevelFilterCopyWith<$Res> {
  __$LevelFilterCopyWithImpl(
      _LevelFilter _value, $Res Function(_LevelFilter) _then)
      : super(_value, (v) => _then(v as _LevelFilter));

  @override
  _LevelFilter get _value => super._value as _LevelFilter;

  @override
  $Res call({
    Object? use = freezed,
    Object? condition = freezed,
  }) {
    return _then(_LevelFilter(
      use == freezed
          ? _value.use
          : use // ignore: cast_nullable_to_non_nullable
              as bool,
      condition == freezed
          ? _value.condition
          : condition // ignore: cast_nullable_to_non_nullable
              as Set<int>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LevelFilter extends _LevelFilter {
  _$_LevelFilter(@JsonKey(name: 'use') this.use,
      @JsonKey(name: 'condition') this.condition)
      : super._();

  factory _$_LevelFilter.fromJson(Map<String, dynamic> json) =>
      _$$_LevelFilterFromJson(json);

  @override
  @JsonKey(name: 'use')
  final bool use;
  @override
  @JsonKey(name: 'condition')
  final Set<int> condition;

  @override
  String toString() {
    return 'LevelFilter(use: $use, condition: $condition)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LevelFilter &&
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
  _$LevelFilterCopyWith<_LevelFilter> get copyWith =>
      __$LevelFilterCopyWithImpl<_LevelFilter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LevelFilterToJson(this);
  }
}

abstract class _LevelFilter extends LevelFilter {
  factory _LevelFilter(@JsonKey(name: 'use') bool use,
      @JsonKey(name: 'condition') Set<int> condition) = _$_LevelFilter;
  _LevelFilter._() : super._();

  factory _LevelFilter.fromJson(Map<String, dynamic> json) =
      _$_LevelFilter.fromJson;

  @override
  @JsonKey(name: 'use')
  bool get use;
  @override
  @JsonKey(name: 'condition')
  Set<int> get condition;
  @override
  @JsonKey(ignore: true)
  _$LevelFilterCopyWith<_LevelFilter> get copyWith =>
      throw _privateConstructorUsedError;
}
