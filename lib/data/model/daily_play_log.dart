import 'package:freezed_annotation/freezed_annotation.dart';
part 'daily_play_log.freezed.dart';
part 'daily_play_log.g.dart';

@freezed
class DailyPlayLog with _$DailyPlayLog {
  factory DailyPlayLog(
    @JsonKey(name: 'title') String title,
    @JsonKey(name: 'difficulty') String difficulty,
    @JsonKey(name: 'level') int level,
    @JsonKey(name: 'chart_id') int chartId,
    @JsonKey(name: 'clear_type_id') int clearTypeId,
    @JsonKey(name: 'clear_type') String clearType,
    @JsonKey(name: 'before_clear_type_id') int beforeClearTypeId,
    @JsonKey(name: 'before_clear_type') String beforeClearType,
    @JsonKey(name: 'djlevel_type_id') int djlevelTypeId,
    @JsonKey(name: 'djlevel_type') String djlevelType,
    @JsonKey(name: 'before_djlevel_type_id') int beforeDjlevelTypeId,
    @JsonKey(name: 'before_djlevel_type') String beforeDjlevelType,
    @JsonKey(name: 'score') int score,
    @JsonKey(name: 'before_score') int beforeScore,
    @JsonKey(name: 'score_rate') double scoreRate,
    @JsonKey(name: 'before_score_rate') double beforeScoreRate,
    @JsonKey(name: 'misscount', fromJson: DailyPlayLog._parseMissCount)
        int? misscount,
    @JsonKey(name: 'before_misscount', fromJson: DailyPlayLog._parseMissCount)
        int? beforeMisscount,
    @JsonKey(name: 'version_id') int versionId,
    @JsonKey(name: 'updated_at', fromJson: DailyPlayLog._parseDateTime)
        DateTime updatedAt,
  ) = _DailyPlayLog;

  factory DailyPlayLog.fromJson(Map<String, dynamic> json) =>
      _$DailyPlayLogFromJson(json);

  static int? _parseMissCount(value) =>
      value is int ? value : int.tryParse(value?.toString() ?? '');
  static DateTime _parseDateTime(value) => DateTime.parse(value);
}
