import 'package:freezed_annotation/freezed_annotation.dart';

part 'csv_until_rootage.freezed.dart';
part 'csv_until_rootage.g.dart';

@freezed
abstract class CsvUntilRootage with _$CsvUntilRootage {
  factory CsvUntilRootage(
      @JsonKey(name: 'バージョン') String version,
      @JsonKey(name: 'タイトル') String title,
      @JsonKey(name: 'ジャンル') String genre,
      @JsonKey(name: 'アーティスト') String artist,
      @JsonKey(name: 'プレー回数') String playcount,
      @JsonKey(name: 'NORMAL 難易度') String normalLevel,
      @JsonKey(name: 'NORMAL EXスコア') String normalExScore,
      @JsonKey(name: 'NORMAL PGreat') String normalPgreat,
      @JsonKey(name: 'NORMAL Great') String normalGreat,
      @JsonKey(name: 'NORMAL ミスカウント') String normalMisscount,
      @JsonKey(name: 'NORMAL クリアタイプ') String normalClearType,
      @JsonKey(name: 'NORMAL DJ LEVEL') String normalDjlevel,
      @JsonKey(name: 'HYPER 難易度') String hyperLevel,
      @JsonKey(name: 'HYPER EXスコア') String hyperExScore,
      @JsonKey(name: 'HYPER PGreat') String hyperPgreat,
      @JsonKey(name: 'HYPER Great') String hyperGreat,
      @JsonKey(name: 'HYPER ミスカウント') String hyperMisscount,
      @JsonKey(name: 'HYPER クリアタイプ') String hyperClearType,
      @JsonKey(name: 'HYPER DJ LEVEL') String hyperDjlevel,
      @JsonKey(name: 'ANOTHER 難易度') String anotherLevel,
      @JsonKey(name: 'ANOTHER EXスコア') String anotherExScore,
      @JsonKey(name: 'ANOTHER PGreat') String anotherPgreat,
      @JsonKey(name: 'ANOTHER Great') String anotherGreat,
      @JsonKey(name: 'ANOTHER ミスカウント') String anotherMisscount,
      @JsonKey(name: 'ANOTHER クリアタイプ') String anotherClearType,
      @JsonKey(name: 'ANOTHER DJ LEVEL') String anotherDjlevel,
      @JsonKey(name: '最終プレー日時') String lastplayAt) = _CsvUntilRootage;

  factory CsvUntilRootage.fromJson(Map<String, dynamic> json) =>
      _$CsvUntilRootageFromJson(json);
}
