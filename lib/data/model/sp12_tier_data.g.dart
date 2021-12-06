// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sp12_tier_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Sp12TierData _$$_Sp12TierDataFromJson(Map<String, dynamic> json) =>
    _$_Sp12TierData(
      json['chart_id'] as int,
      json['title'] as String,
      json['difficulty_type_id'] as int,
      json['difficulty'] as String,
      json['clear_tier_id'] as int,
      json['clear_tier_class'] as String,
      json['hard_tier_id'] as int,
      json['hard_tier_class'] as String,
      json['clear_type_id'] as int,
      json['clear_type'] as String,
    );

Map<String, dynamic> _$$_Sp12TierDataToJson(_$_Sp12TierData instance) =>
    <String, dynamic>{
      'chart_id': instance.chartId,
      'title': instance.title,
      'difficulty_type_id': instance.difficultyTypeId,
      'difficulty': instance.difficulty,
      'clear_tier_id': instance.clearTierId,
      'clear_tier_class': instance.clearTierClass,
      'hard_tier_id': instance.hardTierId,
      'hard_tier_class': instance.hardTierClass,
      'clear_type_id': instance.clearTypeId,
      'clear_type': instance.clearType,
    };
