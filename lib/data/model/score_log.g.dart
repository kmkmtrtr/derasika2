// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'score_log.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ScoreLog _$$_ScoreLogFromJson(Map<String, dynamic> json) => _$_ScoreLog(
      json['score'] as int,
      json['clearTypeId'] as int,
      json['clearType'] as String,
      json['djLevelTypeId'] as int,
      json['djLevelType'] as String,
      json['scorePace'] as String,
      json['nextScorePace'] as String,
      (json['scoreRate'] as num).toDouble(),
      (json['djPoint'] as num).toDouble(),
      json['misscount'] as int?,
      json['versionId'] as int,
      json['version'] as String,
      json['updatedAt'] as String,
    );

Map<String, dynamic> _$$_ScoreLogToJson(_$_ScoreLog instance) =>
    <String, dynamic>{
      'score': instance.score,
      'clearTypeId': instance.clearTypeId,
      'clearType': instance.clearType,
      'djLevelTypeId': instance.djLevelTypeId,
      'djLevelType': instance.djLevelType,
      'scorePace': instance.scorePace,
      'nextScorePace': instance.nextScorePace,
      'scoreRate': instance.scoreRate,
      'djPoint': instance.djPoint,
      'misscount': instance.misscount,
      'versionId': instance.versionId,
      'version': instance.version,
      'updatedAt': instance.updatedAt,
    };
