// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'difficulty_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DifficultyFilter _$DifficultyFilterFromJson(Map<String, dynamic> json) {
  return _DifficultyFilter.fromJson(json);
}

/// @nodoc
class _$DifficultyFilterTearOff {
  const _$DifficultyFilterTearOff();

  _DifficultyFilter call(@JsonKey(name: 'use') bool use,
      @JsonKey(name: 'condition') Set<Difficulty> condition) {
    return _DifficultyFilter(
      use,
      condition,
    );
  }

  DifficultyFilter fromJson(Map<String, Object?> json) {
    return DifficultyFilter.fromJson(json);
  }
}

/// @nodoc
const $DifficultyFilter = _$DifficultyFilterTearOff();

/// @nodoc
mixin _$DifficultyFilter {
  @JsonKey(name: 'use')
  bool get use => throw _privateConstructorUsedError;
  @JsonKey(name: 'condition')
  Set<Difficulty> get condition => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DifficultyFilterCopyWith<DifficultyFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DifficultyFilterCopyWith<$Res> {
  factory $DifficultyFilterCopyWith(
          DifficultyFilter value, $Res Function(DifficultyFilter) then) =
      _$DifficultyFilterCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'use') bool use,
      @JsonKey(name: 'condition') Set<Difficulty> condition});
}

/// @nodoc
class _$DifficultyFilterCopyWithImpl<$Res>
    implements $DifficultyFilterCopyWith<$Res> {
  _$DifficultyFilterCopyWithImpl(this._value, this._then);

  final DifficultyFilter _value;
  // ignore: unused_field
  final $Res Function(DifficultyFilter) _then;

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
              as Set<Difficulty>,
    ));
  }
}

/// @nodoc
abstract class _$DifficultyFilterCopyWith<$Res>
    implements $DifficultyFilterCopyWith<$Res> {
  factory _$DifficultyFilterCopyWith(
          _DifficultyFilter value, $Res Function(_DifficultyFilter) then) =
      __$DifficultyFilterCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'use') bool use,
      @JsonKey(name: 'condition') Set<Difficulty> condition});
}

/// @nodoc
class __$DifficultyFilterCopyWithImpl<$Res>
    extends _$DifficultyFilterCopyWithImpl<$Res>
    implements _$DifficultyFilterCopyWith<$Res> {
  __$DifficultyFilterCopyWithImpl(
      _DifficultyFilter _value, $Res Function(_DifficultyFilter) _then)
      : super(_value, (v) => _then(v as _DifficultyFilter));

  @override
  _DifficultyFilter get _value => super._value as _DifficultyFilter;

  @override
  $Res call({
    Object? use = freezed,
    Object? condition = freezed,
  }) {
    return _then(_DifficultyFilter(
      use == freezed
          ? _value.use
          : use // ignore: cast_nullable_to_non_nullable
              as bool,
      condition == freezed
          ? _value.condition
          : condition // ignore: cast_nullable_to_non_nullable
              as Set<Difficulty>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DifficultyFilter extends _DifficultyFilter {
  _$_DifficultyFilter(@JsonKey(name: 'use') this.use,
      @JsonKey(name: 'condition') this.condition)
      : super._();

  factory _$_DifficultyFilter.fromJson(Map<String, dynamic> json) =>
      _$$_DifficultyFilterFromJson(json);

  @override
  @JsonKey(name: 'use')
  final bool use;
  @override
  @JsonKey(name: 'condition')
  final Set<Difficulty> condition;

  @override
  String toString() {
    return 'DifficultyFilter(use: $use, condition: $condition)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DifficultyFilter &&
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
  _$DifficultyFilterCopyWith<_DifficultyFilter> get copyWith =>
      __$DifficultyFilterCopyWithImpl<_DifficultyFilter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DifficultyFilterToJson(this);
  }
}

abstract class _DifficultyFilter extends DifficultyFilter {
  factory _DifficultyFilter(@JsonKey(name: 'use') bool use,
          @JsonKey(name: 'condition') Set<Difficulty> condition) =
      _$_DifficultyFilter;
  _DifficultyFilter._() : super._();

  factory _DifficultyFilter.fromJson(Map<String, dynamic> json) =
      _$_DifficultyFilter.fromJson;

  @override
  @JsonKey(name: 'use')
  bool get use;
  @override
  @JsonKey(name: 'condition')
  Set<Difficulty> get condition;
  @override
  @JsonKey(ignore: true)
  _$DifficultyFilterCopyWith<_DifficultyFilter> get copyWith =>
      throw _privateConstructorUsedError;
}
