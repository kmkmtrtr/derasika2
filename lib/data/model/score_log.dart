import 'package:freezed_annotation/freezed_annotation.dart';

part 'score_log.freezed.dart';
part 'score_log.g.dart';

@freezed
abstract class ScoreLog with _$ScoreLog {
  factory ScoreLog(
    int score,
    int clearTypeId,
    String clearType,
    int djLevelTypeId,
    String djLevelType,
    String scorePace,
    String nextScorePace,
    double scoreRate,
    double djPoint,
    int? misscount,
    int versionId,
    String version,
    String updatedAt,
  ) = _ScoreLog;

  factory ScoreLog.fromJson(Map<String, dynamic> json) =>
      _$ScoreLogFromJson(json);
}
