// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'memo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Memo _$$_MemoFromJson(Map<String, dynamic> json) => _$_Memo(
      json['id'] as int?,
      Memo._parseDateTime(json['created_at']),
      json['text'] as String,
      json['title'] as String,
      json['chart_id'] as int,
    );

Map<String, dynamic> _$$_MemoToJson(_$_Memo instance) => <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt.toIso8601String(),
      'text': instance.text,
      'title': instance.title,
      'chart_id': instance.chartId,
    };
