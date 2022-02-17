// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'level_filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LevelFilter _$$_LevelFilterFromJson(Map<String, dynamic> json) =>
    _$_LevelFilter(
      json['use'] as bool,
      (json['condition'] as List<dynamic>).map((e) => e as int).toSet(),
    );

Map<String, dynamic> _$$_LevelFilterToJson(_$_LevelFilter instance) =>
    <String, dynamic>{
      'use': instance.use,
      'condition': instance.condition.toList(),
    };
