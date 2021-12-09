import 'package:freezed_annotation/freezed_annotation.dart';

part 'csv_since_heroic_verse.freezed.dart';
part 'csv_since_heroic_verse.g.dart';

@freezed
class CsvSinceHeroicVerse with _$CsvSinceHeroicVerse {
  factory CsvSinceHeroicVerse(
      @JsonKey(name: 'バージョン') String version,
      @JsonKey(name: 'タイトル') String title,
      @JsonKey(name: 'ジャンル') String genre,
      @JsonKey(name: 'アーティスト') String artist,
      @JsonKey(name: 'プレー回数') String playcount,
      @JsonKey(name: 'BEGINNER 難易度') String beginnerLevel,
      @JsonKey(name: 'BEGINNER スコア') String beginnerExScore,
      @JsonKey(name: 'BEGINNER PGreat') String beginnerPgreat,
      @JsonKey(name: 'BEGINNER Great') String beginnerGreat,
      @JsonKey(name: 'BEGINNER ミスカウント') String beginnerMisscount,
      @JsonKey(name: 'BEGINNER クリアタイプ') String beginnerClearType,
      @JsonKey(name: 'BEGINNER DJ LEVEL') String beginnerDjlevel,
      @JsonKey(name: 'NORMAL 難易度') String normalLevel,
      @JsonKey(name: 'NORMAL スコア') String normalExScore,
      @JsonKey(name: 'NORMAL PGreat') String normalPgreat,
      @JsonKey(name: 'NORMAL Great') String normalGreat,
      @JsonKey(name: 'NORMAL ミスカウント') String normalMisscount,
      @JsonKey(name: 'NORMAL クリアタイプ') String normalClearType,
      @JsonKey(name: 'NORMAL DJ LEVEL') String normalDjlevel,
      @JsonKey(name: 'HYPER 難易度') String hyperLevel,
      @JsonKey(name: 'HYPER スコア') String hyperExScore,
      @JsonKey(name: 'HYPER PGreat') String hyperPgreat,
      @JsonKey(name: 'HYPER Great') String hyperGreat,
      @JsonKey(name: 'HYPER ミスカウント') String hyperMisscount,
      @JsonKey(name: 'HYPER クリアタイプ') String hyperClearType,
      @JsonKey(name: 'HYPER DJ LEVEL') String hyperDjlevel,
      @JsonKey(name: 'ANOTHER 難易度') String anotherLevel,
      @JsonKey(name: 'ANOTHER スコア') String anotherExScore,
      @JsonKey(name: 'ANOTHER PGreat') String anotherPgreat,
      @JsonKey(name: 'ANOTHER Great') String anotherGreat,
      @JsonKey(name: 'ANOTHER ミスカウント') String anotherMisscount,
      @JsonKey(name: 'ANOTHER クリアタイプ') String anotherClearType,
      @JsonKey(name: 'ANOTHER DJ LEVEL') String anotherDjlevel,
      @JsonKey(name: 'LEGGENDARIA 難易度') String leggendariaLevel,
      @JsonKey(name: 'LEGGENDARIA スコア') String leggendariaExScore,
      @JsonKey(name: 'LEGGENDARIA PGreat') String leggendariaPgreat,
      @JsonKey(name: 'LEGGENDARIA Great') String leggendariaGreat,
      @JsonKey(name: 'LEGGENDARIA ミスカウント') String leggendariaMisscount,
      @JsonKey(name: 'LEGGENDARIA クリアタイプ') String leggendariaClearType,
      @JsonKey(name: 'LEGGENDARIA DJ LEVEL') String leggendariaDjlevel,
      @JsonKey(name: '最終プレー日時') String lastplayAt) = _CsvSinceHeroicVerse;

  factory CsvSinceHeroicVerse.fromJson(Map<String, dynamic> json) =>
      _$CsvSinceHeroicVerseFromJson(json);
}
