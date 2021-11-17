import 'package:freezed_annotation/freezed_annotation.dart';

part 'chart_detail.freezed.dart';
part 'chart_detail.g.dart';

@freezed
abstract class ChartDetail with _$ChartDetail {
  factory ChartDetail(
    @JsonKey(name: 'title') String title,
    @JsonKey(name: 'artist') String artist,
    @JsonKey(name: 'genre') String genre,
    @JsonKey(name: 'min_bpm') int minBpm,
    @JsonKey(name: 'max_bpm') int maxBpm,
    @JsonKey(name: 'notes') int notes,
    @JsonKey(name: 'max') int max,
    @JsonKey(name: 'max_minus') int maxMinus,
    @JsonKey(name: 'rank_aaa') int rankAAA,
    @JsonKey(name: 'rank_aaa_minus') int rankAAAMinus,
    @JsonKey(name: 'rank_aa') int rankAA,
    @JsonKey(name: 'rank_aa_minus') int rankAAMinus,
    @JsonKey(name: 'rank_a') int rankA,
    @JsonKey(name: 'difficulty') String difficulty,
    @JsonKey(name: 'level') int level,
    @JsonKey(name: 'textage_url') String? textageUrl,
  ) = _ChartDetail;

  factory ChartDetail.fromJson(Map<String, dynamic> json) =>
      _$ChartDetailFromJson(json);
}
