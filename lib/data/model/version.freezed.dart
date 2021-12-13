// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'version.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Version _$VersionFromJson(Map<String, dynamic> json) {
  return _Version.fromJson(json);
}

/// @nodoc
class _$VersionTearOff {
  const _$VersionTearOff();

  _Version call(
      @JsonKey(name: 'id')
          int id,
      @JsonKey(name: 'version')
          String title,
      @JsonKey(name: 'start_at', fromJson: Version._parseDateTime)
          DateTime startAt,
      @JsonKey(name: 'rank')
          int number) {
    return _Version(
      id,
      title,
      startAt,
      number,
    );
  }

  Version fromJson(Map<String, Object?> json) {
    return Version.fromJson(json);
  }
}

/// @nodoc
const $Version = _$VersionTearOff();

/// @nodoc
mixin _$Version {
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'version')
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'start_at', fromJson: Version._parseDateTime)
  DateTime get startAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'rank')
  int get number => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VersionCopyWith<Version> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VersionCopyWith<$Res> {
  factory $VersionCopyWith(Version value, $Res Function(Version) then) =
      _$VersionCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'id')
          int id,
      @JsonKey(name: 'version')
          String title,
      @JsonKey(name: 'start_at', fromJson: Version._parseDateTime)
          DateTime startAt,
      @JsonKey(name: 'rank')
          int number});
}

/// @nodoc
class _$VersionCopyWithImpl<$Res> implements $VersionCopyWith<$Res> {
  _$VersionCopyWithImpl(this._value, this._then);

  final Version _value;
  // ignore: unused_field
  final $Res Function(Version) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? startAt = freezed,
    Object? number = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      startAt: startAt == freezed
          ? _value.startAt
          : startAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      number: number == freezed
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$VersionCopyWith<$Res> implements $VersionCopyWith<$Res> {
  factory _$VersionCopyWith(_Version value, $Res Function(_Version) then) =
      __$VersionCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'id')
          int id,
      @JsonKey(name: 'version')
          String title,
      @JsonKey(name: 'start_at', fromJson: Version._parseDateTime)
          DateTime startAt,
      @JsonKey(name: 'rank')
          int number});
}

/// @nodoc
class __$VersionCopyWithImpl<$Res> extends _$VersionCopyWithImpl<$Res>
    implements _$VersionCopyWith<$Res> {
  __$VersionCopyWithImpl(_Version _value, $Res Function(_Version) _then)
      : super(_value, (v) => _then(v as _Version));

  @override
  _Version get _value => super._value as _Version;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? startAt = freezed,
    Object? number = freezed,
  }) {
    return _then(_Version(
      id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      startAt == freezed
          ? _value.startAt
          : startAt // ignore: cast_nullable_to_non_nullable
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
class _$_Version implements _Version {
  _$_Version(
      @JsonKey(name: 'id') this.id,
      @JsonKey(name: 'version') this.title,
      @JsonKey(name: 'start_at', fromJson: Version._parseDateTime) this.startAt,
      @JsonKey(name: 'rank') this.number);

  factory _$_Version.fromJson(Map<String, dynamic> json) =>
      _$$_VersionFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  @JsonKey(name: 'version')
  final String title;
  @override
  @JsonKey(name: 'start_at', fromJson: Version._parseDateTime)
  final DateTime startAt;
  @override
  @JsonKey(name: 'rank')
  final int number;

  @override
  String toString() {
    return 'Version(id: $id, title: $title, startAt: $startAt, number: $number)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Version &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.startAt, startAt) &&
            const DeepCollectionEquality().equals(other.number, number));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(startAt),
      const DeepCollectionEquality().hash(number));

  @JsonKey(ignore: true)
  @override
  _$VersionCopyWith<_Version> get copyWith =>
      __$VersionCopyWithImpl<_Version>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_VersionToJson(this);
  }
}

abstract class _Version implements Version {
  factory _Version(
      @JsonKey(name: 'id')
          int id,
      @JsonKey(name: 'version')
          String title,
      @JsonKey(name: 'start_at', fromJson: Version._parseDateTime)
          DateTime startAt,
      @JsonKey(name: 'rank')
          int number) = _$_Version;

  factory _Version.fromJson(Map<String, dynamic> json) = _$_Version.fromJson;

  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'version')
  String get title;
  @override
  @JsonKey(name: 'start_at', fromJson: Version._parseDateTime)
  DateTime get startAt;
  @override
  @JsonKey(name: 'rank')
  int get number;
  @override
  @JsonKey(ignore: true)
  _$VersionCopyWith<_Version> get copyWith =>
      throw _privateConstructorUsedError;
}
