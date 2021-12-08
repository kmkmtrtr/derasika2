// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sort_condition.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SortCondition _$$_SortConditionFromJson(Map<String, dynamic> json) =>
    _$_SortCondition(
      $enumDecode(_$SortElementEnumMap, json['sort_element']),
      $enumDecode(_$SortOrderEnumMap, json['sort_order']),
    );

Map<String, dynamic> _$$_SortConditionToJson(_$_SortCondition instance) =>
    <String, dynamic>{
      'sort_element': _$SortElementEnumMap[instance.sortElement],
      'sort_order': _$SortOrderEnumMap[instance.sortOrder],
    };

const _$SortElementEnumMap = {
  SortElement.title: 'title',
  SortElement.level: 'level',
  SortElement.difficulty: 'difficulty',
  SortElement.scoreRate: 'scoreRate',
  SortElement.clearType: 'clearType',
  SortElement.djPoint: 'djPoint',
  SortElement.maxBpm: 'maxBpm',
  SortElement.notes: 'notes',
  SortElement.version: 'version',
  SortElement.prevScoreDiff: 'prevScoreDiff',
  SortElement.bestScoreDiff: 'bestScoreDiff',
  SortElement.targetScoreDiff: 'targetScoreDiff',
};

const _$SortOrderEnumMap = {
  SortOrder.asc: 'asc',
  SortOrder.desc: 'desc',
};
