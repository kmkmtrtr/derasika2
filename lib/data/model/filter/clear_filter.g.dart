// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clear_filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ClearFilter _$$_ClearFilterFromJson(Map<String, dynamic> json) =>
    _$_ClearFilter(
      json['use'] as bool,
      (json['condition'] as List<dynamic>)
          .map((e) => $enumDecode(_$ClearLampEnumMap, e))
          .toSet(),
    );

Map<String, dynamic> _$$_ClearFilterToJson(_$_ClearFilter instance) =>
    <String, dynamic>{
      'use': instance.use,
      'condition':
          instance.condition.map((e) => _$ClearLampEnumMap[e]).toList(),
    };

const _$ClearLampEnumMap = {
  ClearLamp.noplay: 'noplay',
  ClearLamp.assisteasy: 'assisteasy',
  ClearLamp.easyclear: 'easyclear',
  ClearLamp.clear: 'clear',
  ClearLamp.hardclear: 'hardclear',
  ClearLamp.exhardclear: 'exhardclear',
  ClearLamp.fullcombo: 'fullcombo',
};
