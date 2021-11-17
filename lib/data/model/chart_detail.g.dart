// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chart_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ChartDetail _$$_ChartDetailFromJson(Map<String, dynamic> json) =>
    _$_ChartDetail(
      json['title'] as String,
      json['artist'] as String,
      json['genre'] as String,
      json['min_bpm'] as int,
      json['max_bpm'] as int,
      json['notes'] as int,
      json['max'] as int,
      json['max_minus'] as int,
      json['rank_aaa'] as int,
      json['rank_aaa_minus'] as int,
      json['rank_aa'] as int,
      json['rank_aa_minus'] as int,
      json['rank_a'] as int,
      json['difficulty'] as String,
      json['level'] as int,
      json['textage_url'] as String?,
    );

Map<String, dynamic> _$$_ChartDetailToJson(_$_ChartDetail instance) =>
    <String, dynamic>{
      'title': instance.title,
      'artist': instance.artist,
      'genre': instance.genre,
      'min_bpm': instance.minBpm,
      'max_bpm': instance.maxBpm,
      'notes': instance.notes,
      'max': instance.max,
      'max_minus': instance.maxMinus,
      'rank_aaa': instance.rankAAA,
      'rank_aaa_minus': instance.rankAAAMinus,
      'rank_aa': instance.rankAA,
      'rank_aa_minus': instance.rankAAMinus,
      'rank_a': instance.rankA,
      'difficulty': instance.difficulty,
      'level': instance.level,
      'textage_url': instance.textageUrl,
    };
