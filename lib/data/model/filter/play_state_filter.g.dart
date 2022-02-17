// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'play_state_filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PlayStateFilter _$$_PlayStateFilterFromJson(Map<String, dynamic> json) =>
    _$_PlayStateFilter(
      json['use'] as bool,
      $enumDecode(_$PlayStateEnumMap, json['condition']),
    );

Map<String, dynamic> _$$_PlayStateFilterToJson(_$_PlayStateFilter instance) =>
    <String, dynamic>{
      'use': instance.use,
      'condition': _$PlayStateEnumMap[instance.condition],
    };

const _$PlayStateEnumMap = {
  PlayState.all: 'all',
  PlayState.everPlayed: 'everPlayed',
  PlayState.played: 'played',
};
