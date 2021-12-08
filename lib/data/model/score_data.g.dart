// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'score_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ScoreData _$$_ScoreDataFromJson(Map<String, dynamic> json) => _$_ScoreData(
      json['chart_id'] as int,
      json['version_id'] as int,
      json['title'] as String,
      json['difficulty_type_id'] as int,
      json['difficulty'] as String,
      json['mode_type_id'] as int,
      json['level'] as int,
      json['notes'] as int,
      json['clear_type_id'] as int,
      json['clear_type'] as String,
      json['score'] as int,
      json['djlevel_type_id'] as int,
      json['djlevel_type'] as String,
      json['score_pace'] as String,
      json['next_score_pace'] as String,
      (json['score_rate'] as num).toDouble(),
      (json['djpoint'] as num).toDouble(),
      ScoreData._parseNullableInt(json['misscount']),
      ScoreData._parseNullableInt(json['prev_score']),
      ScoreData._parseNullableInt(json['best_score']),
      ScoreData._parseNullableInt(json['prev_misscount']),
      ScoreData._parseNullableInt(json['best_misscount']),
    );

Map<String, dynamic> _$$_ScoreDataToJson(_$_ScoreData instance) =>
    <String, dynamic>{
      'chart_id': instance.chartId,
      'version_id': instance.versionId,
      'title': instance.title,
      'difficulty_type_id': instance.difficultyId,
      'difficulty': instance.difficulty,
      'mode_type_id': instance.modeType,
      'level': instance.level,
      'notes': instance.notes,
      'clear_type_id': instance.clearTypeId,
      'clear_type': instance.clearType,
      'score': instance.score,
      'djlevel_type_id': instance.djLevelId,
      'djlevel_type': instance.djLevel,
      'score_pace': instance.scorePace,
      'next_score_pace': instance.nextScorePace,
      'score_rate': instance.scoreRate,
      'djpoint': instance.djpoint,
      'misscount': instance.misscount,
      'prev_score': instance.prevScore,
      'best_score': instance.bestScore,
      'prev_misscount': instance.prevMisscount,
      'best_misscount': instance.bestMisscount,
    };
