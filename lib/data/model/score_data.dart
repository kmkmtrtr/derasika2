import 'package:freezed_annotation/freezed_annotation.dart';

part 'score_data.freezed.dart';
part 'score_data.g.dart';

@freezed
class ScoreData with _$ScoreData {
  factory ScoreData(
      @JsonKey(name: 'chart_id')
          int chartId,
      @JsonKey(name: 'version_id')
          int versionId,
      @JsonKey(name: 'title')
          String title,
      @JsonKey(name: 'difficulty_type_id')
          int difficultyId,
      @JsonKey(name: 'difficulty')
          String difficulty,
      @JsonKey(name: 'mode_type_id')
          int modeType,
      @JsonKey(name: 'level')
          int level,
      @JsonKey(name: 'notes')
          int notes,
      @JsonKey(name: 'clear_type_id')
          int clearTypeId,
      @JsonKey(name: 'clear_type')
          String clearType,
      @JsonKey(name: 'score')
          int score,
      @JsonKey(name: 'djlevel_type_id')
          int djLevelId,
      @JsonKey(name: 'djlevel_type')
          String djLevel,
      @JsonKey(name: 'score_pace')
          String scorePace,
      @JsonKey(name: 'next_score_pace')
          String nextScorePace,
      @JsonKey(name: 'score_rate')
          double scoreRate,
      @JsonKey(name: 'djpoint')
          double djpoint,
      @JsonKey(name: 'misscount', fromJson: ScoreData._parseNullableInt)
          int? misscount,
      @JsonKey(name: 'prev_score', fromJson: ScoreData._parseNullableInt)
          int? prevScore,
      @JsonKey(name: 'best_score', fromJson: ScoreData._parseNullableInt)
          int? bestScore,
      @JsonKey(name: 'prev_misscount', fromJson: ScoreData._parseNullableInt)
          int? prevMisscount,
      @JsonKey(name: 'best_misscount', fromJson: ScoreData._parseNullableInt)
          int? bestMisscount) = _ScoreData;

  factory ScoreData.fromJson(Map<String, dynamic> json) =>
      _$ScoreDataFromJson(json);
  static int? _parseNullableInt(value) =>
      value is int ? value : int.tryParse(value?.toString() ?? '');
}
