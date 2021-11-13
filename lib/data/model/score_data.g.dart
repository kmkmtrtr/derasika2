// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'score_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ScoreData _$$_ScoreDataFromJson(Map<String, dynamic> json) => _$_ScoreData(
      json['chartId'] as int,
      json['title'] as String,
      json['level'] as int,
      json['difficulty'] as String,
      json['modeType'] as int,
      json['score'] as int,
      json['djLevel'] as String,
      (json['scoreRate'] as num).toDouble(),
      json['scorePace'] as String,
      json['nextScorePace'] as String,
      json['prevScore'] as int?,
      json['bestScore'] as int?,
      json['clearType'] as String,
      json['misscount'] as int?,
      json['prevMisscount'] as int?,
      json['bestMisscount'] as int?,
    );

Map<String, dynamic> _$$_ScoreDataToJson(_$_ScoreData instance) =>
    <String, dynamic>{
      'chartId': instance.chartId,
      'title': instance.title,
      'level': instance.level,
      'difficulty': instance.difficulty,
      'modeType': instance.modeType,
      'score': instance.score,
      'djLevel': instance.djLevel,
      'scoreRate': instance.scoreRate,
      'scorePace': instance.scorePace,
      'nextScorePace': instance.nextScorePace,
      'prevScore': instance.prevScore,
      'bestScore': instance.bestScore,
      'clearType': instance.clearType,
      'misscount': instance.misscount,
      'prevMisscount': instance.prevMisscount,
      'bestMisscount': instance.bestMisscount,
    };
