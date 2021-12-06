import 'package:freezed_annotation/freezed_annotation.dart';
part 'memo.freezed.dart';
part 'memo.g.dart';

@freezed
class Memo with _$Memo {
  factory Memo(
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'created_at', fromJson: Memo._parseDateTime)
        DateTime createdAt,
    @JsonKey(name: 'text') String text,
    @JsonKey(name: 'title') String title,
    @JsonKey(name: 'chart_id') int chartId,
  ) = _Memo;

  factory Memo.fromJson(Map<String, dynamic> json) => _$MemoFromJson(json);

  static DateTime _parseDateTime(value) => DateTime.parse(value);
}
