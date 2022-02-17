// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'play_state_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PlayStateFilter _$PlayStateFilterFromJson(Map<String, dynamic> json) {
  return _PlayStateFilter.fromJson(json);
}

/// @nodoc
class _$PlayStateFilterTearOff {
  const _$PlayStateFilterTearOff();

  _PlayStateFilter call(@JsonKey(name: 'use') bool use,
      @JsonKey(name: 'condition') PlayState condition) {
    return _PlayStateFilter(
      use,
      condition,
    );
  }

  PlayStateFilter fromJson(Map<String, Object?> json) {
    return PlayStateFilter.fromJson(json);
  }
}

/// @nodoc
const $PlayStateFilter = _$PlayStateFilterTearOff();

/// @nodoc
mixin _$PlayStateFilter {
  @JsonKey(name: 'use')
  bool get use => throw _privateConstructorUsedError;
  @JsonKey(name: 'condition')
  PlayState get condition => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlayStateFilterCopyWith<PlayStateFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlayStateFilterCopyWith<$Res> {
  factory $PlayStateFilterCopyWith(
          PlayStateFilter value, $Res Function(PlayStateFilter) then) =
      _$PlayStateFilterCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'use') bool use,
      @JsonKey(name: 'condition') PlayState condition});
}

/// @nodoc
class _$PlayStateFilterCopyWithImpl<$Res>
    implements $PlayStateFilterCopyWith<$Res> {
  _$PlayStateFilterCopyWithImpl(this._value, this._then);

  final PlayStateFilter _value;
  // ignore: unused_field
  final $Res Function(PlayStateFilter) _then;

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
              as PlayState,
    ));
  }
}

/// @nodoc
abstract class _$PlayStateFilterCopyWith<$Res>
    implements $PlayStateFilterCopyWith<$Res> {
  factory _$PlayStateFilterCopyWith(
          _PlayStateFilter value, $Res Function(_PlayStateFilter) then) =
      __$PlayStateFilterCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'use') bool use,
      @JsonKey(name: 'condition') PlayState condition});
}

/// @nodoc
class __$PlayStateFilterCopyWithImpl<$Res>
    extends _$PlayStateFilterCopyWithImpl<$Res>
    implements _$PlayStateFilterCopyWith<$Res> {
  __$PlayStateFilterCopyWithImpl(
      _PlayStateFilter _value, $Res Function(_PlayStateFilter) _then)
      : super(_value, (v) => _then(v as _PlayStateFilter));

  @override
  _PlayStateFilter get _value => super._value as _PlayStateFilter;

  @override
  $Res call({
    Object? use = freezed,
    Object? condition = freezed,
  }) {
    return _then(_PlayStateFilter(
      use == freezed
          ? _value.use
          : use // ignore: cast_nullable_to_non_nullable
              as bool,
      condition == freezed
          ? _value.condition
          : condition // ignore: cast_nullable_to_non_nullable
              as PlayState,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PlayStateFilter extends _PlayStateFilter {
  _$_PlayStateFilter(@JsonKey(name: 'use') this.use,
      @JsonKey(name: 'condition') this.condition)
      : super._();

  factory _$_PlayStateFilter.fromJson(Map<String, dynamic> json) =>
      _$$_PlayStateFilterFromJson(json);

  @override
  @JsonKey(name: 'use')
  final bool use;
  @override
  @JsonKey(name: 'condition')
  final PlayState condition;

  @override
  String toString() {
    return 'PlayStateFilter(use: $use, condition: $condition)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PlayStateFilter &&
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
  _$PlayStateFilterCopyWith<_PlayStateFilter> get copyWith =>
      __$PlayStateFilterCopyWithImpl<_PlayStateFilter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PlayStateFilterToJson(this);
  }
}

abstract class _PlayStateFilter extends PlayStateFilter {
  factory _PlayStateFilter(@JsonKey(name: 'use') bool use,
      @JsonKey(name: 'condition') PlayState condition) = _$_PlayStateFilter;
  _PlayStateFilter._() : super._();

  factory _PlayStateFilter.fromJson(Map<String, dynamic> json) =
      _$_PlayStateFilter.fromJson;

  @override
  @JsonKey(name: 'use')
  bool get use;
  @override
  @JsonKey(name: 'condition')
  PlayState get condition;
  @override
  @JsonKey(ignore: true)
  _$PlayStateFilterCopyWith<_PlayStateFilter> get copyWith =>
      throw _privateConstructorUsedError;
}
