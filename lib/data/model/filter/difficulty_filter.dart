import 'package:derasika2/data/model/enum/difficulty.dart';
import 'package:derasika2/data/model/score_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'filter.dart';

part 'difficulty_filter.freezed.dart';
part 'difficulty_filter.g.dart';

@freezed
class DifficultyFilter
    with _$DifficultyFilter
    implements Filter<Set<Difficulty>> {
  const DifficultyFilter._();
  factory DifficultyFilter(
    @JsonKey(name: 'use') bool use,
    @JsonKey(name: 'condition') Set<Difficulty> condition,
  ) = _DifficultyFilter;

  factory DifficultyFilter.fromJson(Map<String, dynamic> json) =>
      _$DifficultyFilterFromJson(json);

  @override
  bool Function(ScoreData) get filter {
    return (ScoreData s) =>
        condition.contains(Difficulty.values[s.difficultyId - 1]);
  }
}
