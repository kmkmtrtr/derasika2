import 'package:freezed_annotation/freezed_annotation.dart';
part 'play_log.freezed.dart';
part 'play_log.g.dart';

@freezed
abstract class PlayLog with _$PlayLog {
  factory PlayLog(
    @JsonKey(name: 'version') String version,
    @JsonKey(name: 'version_id') int versionId,
    @JsonKey(name: 'updated_at', fromJson: PlayLog._parseDateTime)
        DateTime updatedAt,
    @JsonKey(name: 'number') int number,
  ) = _PlayLog;

  factory PlayLog.fromJson(Map<String, dynamic> json) =>
      _$PlayLogFromJson(json);

  static DateTime _parseDateTime(value) => DateTime.parse(value);
}
