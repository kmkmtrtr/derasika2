// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'version.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Version _$$_VersionFromJson(Map<String, dynamic> json) => _$_Version(
      json['id'] as int,
      json['version'] as String,
      Version._parseDateTime(json['start_at'] as String),
      json['rank'] as int,
    );

Map<String, dynamic> _$$_VersionToJson(_$_Version instance) =>
    <String, dynamic>{
      'id': instance.id,
      'version': instance.title,
      'start_at': instance.startAt.toIso8601String(),
      'rank': instance.number,
    };
