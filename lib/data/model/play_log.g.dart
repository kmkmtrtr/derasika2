// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'play_log.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PlayLog _$$_PlayLogFromJson(Map<String, dynamic> json) => _$_PlayLog(
      json['version'] as String,
      json['version_id'] as int,
      PlayLog._parseDateTime(json['updated_at']),
      json['number'] as int,
    );

Map<String, dynamic> _$$_PlayLogToJson(_$_PlayLog instance) =>
    <String, dynamic>{
      'version': instance.version,
      'version_id': instance.versionId,
      'updated_at': instance.updatedAt.toIso8601String(),
      'number': instance.number,
    };
