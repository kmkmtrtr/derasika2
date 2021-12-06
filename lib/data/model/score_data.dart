import 'package:freezed_annotation/freezed_annotation.dart';

part 'score_data.freezed.dart';
part 'score_data.g.dart';

@freezed
class ScoreData with _$ScoreData {
  factory ScoreData(
      int chartId,
      String title,
      int level,
      String difficulty,
      int modeType,
      int score,
      String djLevel,
      double scoreRate,
      String scorePace,
      String nextScorePace,
      int? prevScore,
      int? bestScore,
      String clearType,
      int? misscount,
      int? prevMisscount,
      int? bestMisscount) = _ScoreData;

  factory ScoreData.fromJson(Map<String, dynamic> json) =>
      _$ScoreDataFromJson(json);
}
