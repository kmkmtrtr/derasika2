import 'package:derasika2/data/model/enum/clear_lamp.dart';
import 'package:derasika2/data/model/score_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'filter.dart';

part 'special_filter.freezed.dart';
part 'special_filter.g.dart';

enum SpecialCondition {
  achievedAAA,
  higherThanHistoricalScore,
  lowerThanHistoricalScore,
}

extension SpecialConditionExt on SpecialCondition {
  String get text {
    switch (this) {
      case SpecialCondition.achievedAAA:
        return '過去にAAAを達成した譜面';
      case SpecialCondition.higherThanHistoricalScore:
        return '自己ベストが過去作よりも高い譜面';
      case SpecialCondition.lowerThanHistoricalScore:
        return '自己ベストが過去作よりも低い譜面';
      default:
        throw UnimplementedError();
    }
  }

  bool Function(ScoreData) get filter {
    switch (this) {
      case SpecialCondition.achievedAAA:
        // TODO 過去のDJLEVELを取得してきていないので、今作しか判定できない
        return (ScoreData s) => s.djLevel == 'AAA';
      case SpecialCondition.higherThanHistoricalScore:
        return (ScoreData s) => s.bestScore != null && s.bestScore! < s.score;
      case SpecialCondition.lowerThanHistoricalScore:
        return (ScoreData s) => s.bestScore != null && s.score < s.bestScore!;
      default:
        throw UnimplementedError();
    }
  }
}

@freezed
class ClearFilter with _$ClearFilter implements Filter<Set<SpecialCondition>> {
  const ClearFilter._();
  factory ClearFilter(
    @JsonKey(name: 'use') bool use,
    @JsonKey(name: 'condition') Set<SpecialCondition> condition,
  ) = _ClearFilter;

  factory ClearFilter.fromJson(Map<String, dynamic> json) =>
      _$ClearFilterFromJson(json);

  @override
  bool Function(ScoreData) get filter {
    return (ScoreData s) =>
        !(condition.map((e) => e.filter(s)).any((e) => e == false));
  }
}
