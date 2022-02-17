// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'special_filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ClearFilter _$$_ClearFilterFromJson(Map<String, dynamic> json) =>
    _$_ClearFilter(
      json['use'] as bool,
      (json['condition'] as List<dynamic>)
          .map((e) => $enumDecode(_$SpecialConditionEnumMap, e))
          .toSet(),
    );

Map<String, dynamic> _$$_ClearFilterToJson(_$_ClearFilter instance) =>
    <String, dynamic>{
      'use': instance.use,
      'condition':
          instance.condition.map((e) => _$SpecialConditionEnumMap[e]).toList(),
    };

const _$SpecialConditionEnumMap = {
  SpecialCondition.achievedAAA: 'achievedAAA',
  SpecialCondition.higherThanHistoricalScore: 'higherThanHistoricalScore',
  SpecialCondition.lowerThanHistoricalScore: 'lowerThanHistoricalScore',
};
