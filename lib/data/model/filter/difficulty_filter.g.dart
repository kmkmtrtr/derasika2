// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'difficulty_filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DifficultyFilter _$$_DifficultyFilterFromJson(Map<String, dynamic> json) =>
    _$_DifficultyFilter(
      json['use'] as bool,
      (json['condition'] as List<dynamic>)
          .map((e) => $enumDecode(_$DifficultyEnumMap, e))
          .toSet(),
    );

Map<String, dynamic> _$$_DifficultyFilterToJson(_$_DifficultyFilter instance) =>
    <String, dynamic>{
      'use': instance.use,
      'condition':
          instance.condition.map((e) => _$DifficultyEnumMap[e]).toList(),
    };

const _$DifficultyEnumMap = {
  Difficulty.beginner: 'beginner',
  Difficulty.normal: 'normal',
  Difficulty.hyper: 'hyper',
  Difficulty.another: 'another',
  Difficulty.leggendaria: 'leggendaria',
};
