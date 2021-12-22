import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

part 'version.freezed.dart';
part 'version.g.dart';

@freezed
class Version with _$Version {
  factory Version(
    @JsonKey(name: 'id') int id,
    @JsonKey(name: 'version') String title,
    @JsonKey(name: 'start_at', fromJson: Version._parseDateTime)
        DateTime startAt,
    @JsonKey(name: 'rank') int number,
  ) = _Version;

  factory Version.fromJson(Map<String, dynamic> json) =>
      _$VersionFromJson(json);
  static DateTime _parseDateTime(String value) =>
      DateFormat('yyyy-MM-dd').parse(value);
}
