// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_play_log.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DailyPlayLog _$$_DailyPlayLogFromJson(Map<String, dynamic> json) =>
    _$_DailyPlayLog(
      json['title'] as String,
      json['difficulty'] as String,
      json['level'] as int,
      json['chart_id'] as int,
      json['clear_type_id'] as int,
      json['clear_type'] as String,
      json['before_clear_type_id'] as int,
      json['before_clear_type'] as String,
      json['djlevel_type_id'] as int,
      json['djlevel_type'] as String,
      json['before_djlevel_type_id'] as int,
      json['before_djlevel_type'] as String,
      json['score'] as int,
      json['before_score'] as int,
      (json['score_rate'] as num).toDouble(),
      (json['before_score_rate'] as num).toDouble(),
      DailyPlayLog._parseMissCount(json['misscount']),
      DailyPlayLog._parseMissCount(json['before_misscount']),
      json['version_id'] as int,
      DailyPlayLog._parseDateTime(json['updated_at']),
    );

Map<String, dynamic> _$$_DailyPlayLogToJson(_$_DailyPlayLog instance) =>
    <String, dynamic>{
      'title': instance.title,
      'difficulty': instance.difficulty,
      'level': instance.level,
      'chart_id': instance.chartId,
      'clear_type_id': instance.clearTypeId,
      'clear_type': instance.clearType,
      'before_clear_type_id': instance.beforeClearTypeId,
      'before_clear_type': instance.beforeClearType,
      'djlevel_type_id': instance.djlevelTypeId,
      'djlevel_type': instance.djlevelType,
      'before_djlevel_type_id': instance.beforeDjlevelTypeId,
      'before_djlevel_type': instance.beforeDjlevelType,
      'score': instance.score,
      'before_score': instance.beforeScore,
      'score_rate': instance.scoreRate,
      'before_score_rate': instance.beforeScoreRate,
      'misscount': instance.misscount,
      'before_misscount': instance.beforeMisscount,
      'version_id': instance.versionId,
      'updated_at': instance.updatedAt.toIso8601String(),
    };
