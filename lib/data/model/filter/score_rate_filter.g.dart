// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'score_rate_filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ScoreRange _$$_ScoreRangeFromJson(Map<String, dynamic> json) =>
    _$_ScoreRange(
      $enumDecode(_$ScoreRateConditionEnumMap, json['lower']),
      $enumDecode(_$ScoreRateConditionEnumMap, json['upper']),
    );

Map<String, dynamic> _$$_ScoreRangeToJson(_$_ScoreRange instance) =>
    <String, dynamic>{
      'lower': _$ScoreRateConditionEnumMap[instance.lower],
      'upper': _$ScoreRateConditionEnumMap[instance.upper],
    };

const _$ScoreRateConditionEnumMap = {
  ScoreRateCondition.aminus: 'aminus',
  ScoreRateCondition.aplus: 'aplus',
  ScoreRateCondition.aaminus: 'aaminus',
  ScoreRateCondition.aaplus: 'aaplus',
  ScoreRateCondition.aaaminus: 'aaaminus',
  ScoreRateCondition.aaaplus: 'aaaplus',
  ScoreRateCondition.maxminus: 'maxminus',
  ScoreRateCondition.max: 'max',
};

_$_ScoreRateFilter _$$_ScoreRateFilterFromJson(Map<String, dynamic> json) =>
    _$_ScoreRateFilter(
      json['use'] as bool,
      ScoreRange.fromJson(json['condition'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ScoreRateFilterToJson(_$_ScoreRateFilter instance) =>
    <String, dynamic>{
      'use': instance.use,
      'condition': instance.condition,
    };
