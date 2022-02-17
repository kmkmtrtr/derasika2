import 'package:derasika2/data/model/score_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'filter.dart';

part 'level_filter.freezed.dart';
part 'level_filter.g.dart';

@freezed
class LevelFilter with _$LevelFilter implements Filter<Set<int>> {
  const LevelFilter._();
  factory LevelFilter(
    @JsonKey(name: 'use') bool use,
    @JsonKey(name: 'condition') Set<int> condition,
  ) = _LevelFilter;

  factory LevelFilter.fromJson(Map<String, dynamic> json) =>
      _$LevelFilterFromJson(json);

  @override
  bool Function(ScoreData) get filter {
    return (ScoreData s) => condition.contains(s.level);
  }
}
