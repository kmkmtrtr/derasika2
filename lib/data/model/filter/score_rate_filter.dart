import 'package:derasika2/data/model/score_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'filter.dart';

part 'score_rate_filter.freezed.dart';
part 'score_rate_filter.g.dart';

enum ScoreRateCondition {
  aminus,
  aplus,
  aaminus,
  aaplus,
  aaaminus,
  aaaplus,
  maxminus,
  max,
}

extension ScoreRateConditionExt on ScoreRateCondition {
  double get lowerRate {
    switch (this) {
      case ScoreRateCondition.aminus:
        return 0;
      case ScoreRateCondition.aplus:
        return 12 / 18;
      case ScoreRateCondition.aaminus:
        return 13 / 18;
      case ScoreRateCondition.aaplus:
        return 14 / 18;
      case ScoreRateCondition.aaaminus:
        return 15 / 18;
      case ScoreRateCondition.aaaplus:
        return 16 / 18;
      case ScoreRateCondition.maxminus:
        return 17 / 18;
      case ScoreRateCondition.max:
        return 1;
      default:
        throw UnimplementedError();
    }
  }

  double get upperRate {
    switch (this) {
      case ScoreRateCondition.aminus:
        return 12 / 18;
      case ScoreRateCondition.aplus:
        return 13 / 18;
      case ScoreRateCondition.aaminus:
        return 14 / 18;
      case ScoreRateCondition.aaplus:
        return 15 / 18;
      case ScoreRateCondition.aaaminus:
        return 16 / 18;
      case ScoreRateCondition.aaaplus:
        return 17 / 18;
      case ScoreRateCondition.maxminus:
      case ScoreRateCondition.max:
        return 1;
      default:
        throw UnimplementedError();
    }
  }
}

@freezed
class ScoreRange with _$ScoreRange {
  const ScoreRange._();
  factory ScoreRange(
    @JsonKey(name: 'lower') ScoreRateCondition lower,
    @JsonKey(name: 'upper') ScoreRateCondition upper,
  ) = _ScoreRange;

  factory ScoreRange.fromJson(Map<String, dynamic> json) =>
      _$ScoreRangeFromJson(json);
}

@freezed
class ScoreRateFilter with _$ScoreRateFilter implements Filter<ScoreRange> {
  const ScoreRateFilter._();
  factory ScoreRateFilter(
    @JsonKey(name: 'use') bool use,
    @JsonKey(name: 'condition') ScoreRange condition,
  ) = _ScoreRateFilter;

  factory ScoreRateFilter.fromJson(Map<String, dynamic> json) =>
      _$ScoreRateFilterFromJson(json);

  @override
  bool Function(ScoreData) get filter {
    // TODO 情報が足りなくて正しい判定ができないのであくまでも目安
    return (ScoreData s) {
      return condition.lower.lowerRate <= s.scoreRate &&
          s.scoreRate <= condition.upper.upperRate;
    };
  }
}
