import 'package:freezed_annotation/freezed_annotation.dart';

part 'csv_until_rootage.freezed.dart';
part 'csv_until_rootage.g.dart';

@freezed
abstract class CsvUntilRootage with _$CsvUntilRootage {
  factory CsvUntilRootage(
      String version,
      String title,
      String genre,
      String artist,
      String playcount,
      String normalLevel,
      String normalExScore,
      String normalPgreat,
      String normalGreat,
      String normalMisscount,
      String normalClearType,
      String normalDjlevel,
      String hyperLevel,
      String hyperExScore,
      String hyperPgreat,
      String hyperGreat,
      String hyperMisscount,
      String hyperClearType,
      String hyperDjlevel,
      String anotherLevel,
      String anotherExScore,
      String anotherPgreat,
      String anotherGreat,
      String anotherMisscount,
      String anotherClearType,
      String anotherDjlevel,
      String lastplayAt) = _CsvUntilRootage;

  factory CsvUntilRootage.fromJson(Map<String, dynamic> json) =>
      _$CsvUntilRootageFromJson(json);
}
