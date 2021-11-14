import 'package:freezed_annotation/freezed_annotation.dart';

part 'csv_since_heroic_verse.freezed.dart';
part 'csv_since_heroic_verse.g.dart';

@freezed
abstract class CsvSinceHeroicVerse with _$CsvSinceHeroicVerse {
  factory CsvSinceHeroicVerse(
      String version,
      String title,
      String genre,
      String artist,
      String playcount,
      String beginnerLevel,
      String beginnerExScore,
      String beginnerPgreat,
      String beginnerGreat,
      String beginnerMisscount,
      String beginnerClearType,
      String beginnerDjlevel,
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
      String leggendariaLevel,
      String leggendariaExScore,
      String leggendariaPgreat,
      String leggendariaGreat,
      String leggendariaMisscount,
      String leggendariaClearType,
      String leggendariaDjlevel,
      String lastplayAt) = _CsvSinceHeroicVerse;

  factory CsvSinceHeroicVerse.fromJson(Map<String, dynamic> json) =>
      _$CsvSinceHeroicVerseFromJson(json);
}
