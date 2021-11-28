// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'play_log.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PlayLog _$PlayLogFromJson(Map<String, dynamic> json) {
  return _PlayLog.fromJson(json);
}

/// @nodoc
class _$PlayLogTearOff {
  const _$PlayLogTearOff();

  _PlayLog call(
      @JsonKey(name: 'version')
          String version,
      @JsonKey(name: 'version_id')
          int versionId,
      @JsonKey(name: 'updated_at', fromJson: PlayLog._parseDateTime)
          DateTime updatedAt,
      @JsonKey(name: 'number')
          int number) {
    return _PlayLog(
      version,
      versionId,
      updatedAt,
      number,
    );
  }

  PlayLog fromJson(Map<String, Object?> json) {
    return PlayLog.fromJson(json);
  }
}

/// @nodoc
const $PlayLog = _$PlayLogTearOff();

/// @nodoc
mixin _$PlayLog {
  @JsonKey(name: 'version')
  String get version => throw _privateConstructorUsedError;
  @JsonKey(name: 'version_id')
  int get versionId => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at', fromJson: PlayLog._parseDateTime)
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'number')
  int get number => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlayLogCopyWith<PlayLog> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlayLogCopyWith<$Res> {
  factory $PlayLogCopyWith(PlayLog value, $Res Function(PlayLog) then) =
      _$PlayLogCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'version')
          String version,
      @JsonKey(name: 'version_id')
          int versionId,
      @JsonKey(name: 'updated_at', fromJson: PlayLog._parseDateTime)
          DateTime updatedAt,
      @JsonKey(name: 'number')
          int number});
}

/// @nodoc
class _$PlayLogCopyWithImpl<$Res> implements $PlayLogCopyWith<$Res> {
  _$PlayLogCopyWithImpl(this._value, this._then);

  final PlayLog _value;
  // ignore: unused_field
  final $Res Function(PlayLog) _then;

  @override
  $Res call({
    Object? version = freezed,
    Object? versionId = freezed,
    Object? updatedAt = freezed,
    Object? number = freezed,
  }) {
    return _then(_value.copyWith(
      version: version == freezed
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
      versionId: versionId == freezed
          ? _value.versionId
          : versionId // ignore: cast_nullable_to_non_nullable
              as int,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      number: number == freezed
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$PlayLogCopyWith<$Res> implements $PlayLogCopyWith<$Res> {
  factory _$PlayLogCopyWith(_PlayLog value, $Res Function(_PlayLog) then) =
      __$PlayLogCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'version')
          String version,
      @JsonKey(name: 'version_id')
          int versionId,
      @JsonKey(name: 'updated_at', fromJson: PlayLog._parseDateTime)
          DateTime updatedAt,
      @JsonKey(name: 'number')
          int number});
}

/// @nodoc
class __$PlayLogCopyWithImpl<$Res> extends _$PlayLogCopyWithImpl<$Res>
    implements _$PlayLogCopyWith<$Res> {
  __$PlayLogCopyWithImpl(_PlayLog _value, $Res Function(_PlayLog) _then)
      : super(_value, (v) => _then(v as _PlayLog));

  @override
  _PlayLog get _value => super._value as _PlayLog;

  @override
  $Res call({
    Object? version = freezed,
    Object? versionId = freezed,
    Object? updatedAt = freezed,
    Object? number = freezed,
  }) {
    return _then(_PlayLog(
      version == freezed
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
      versionId == freezed
          ? _value.versionId
          : versionId // ignore: cast_nullable_to_non_nullable
              as int,
      updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      number == freezed
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PlayLog implements _PlayLog {
  _$_PlayLog(
      @JsonKey(name: 'version')
          this.version,
      @JsonKey(name: 'version_id')
          this.versionId,
      @JsonKey(name: 'updated_at', fromJson: PlayLog._parseDateTime)
          this.updatedAt,
      @JsonKey(name: 'number')
          this.number);

  factory _$_PlayLog.fromJson(Map<String, dynamic> json) =>
      _$$_PlayLogFromJson(json);

  @override
  @JsonKey(name: 'version')
  final String version;
  @override
  @JsonKey(name: 'version_id')
  final int versionId;
  @override
  @JsonKey(name: 'updated_at', fromJson: PlayLog._parseDateTime)
  final DateTime updatedAt;
  @override
  @JsonKey(name: 'number')
  final int number;

  @override
  String toString() {
    return 'PlayLog(version: $version, versionId: $versionId, updatedAt: $updatedAt, number: $number)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PlayLog &&
            (identical(other.version, version) || other.version == version) &&
            (identical(other.versionId, versionId) ||
                other.versionId == versionId) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.number, number) || other.number == number));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, version, versionId, updatedAt, number);

  @JsonKey(ignore: true)
  @override
  _$PlayLogCopyWith<_PlayLog> get copyWith =>
      __$PlayLogCopyWithImpl<_PlayLog>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PlayLogToJson(this);
  }
}

abstract class _PlayLog implements PlayLog {
  factory _PlayLog(
      @JsonKey(name: 'version')
          String version,
      @JsonKey(name: 'version_id')
          int versionId,
      @JsonKey(name: 'updated_at', fromJson: PlayLog._parseDateTime)
          DateTime updatedAt,
      @JsonKey(name: 'number')
          int number) = _$_PlayLog;

  factory _PlayLog.fromJson(Map<String, dynamic> json) = _$_PlayLog.fromJson;

  @override
  @JsonKey(name: 'version')
  String get version;
  @override
  @JsonKey(name: 'version_id')
  int get versionId;
  @override
  @JsonKey(name: 'updated_at', fromJson: PlayLog._parseDateTime)
  DateTime get updatedAt;
  @override
  @JsonKey(name: 'number')
  int get number;
  @override
  @JsonKey(ignore: true)
  _$PlayLogCopyWith<_PlayLog> get copyWith =>
      throw _privateConstructorUsedError;
}
