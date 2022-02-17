import 'package:derasika2/data/model/enum/clear_lamp.dart';
import 'package:derasika2/data/model/score_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'filter.dart';

part 'clear_filter.freezed.dart';
part 'clear_filter.g.dart';

@freezed
class ClearFilter with _$ClearFilter implements Filter<Set<ClearLamp>> {
  const ClearFilter._();
  factory ClearFilter(
    @JsonKey(name: 'use') bool use,
    @JsonKey(name: 'condition') Set<ClearLamp> condition,
  ) = _ClearFilter;

  factory ClearFilter.fromJson(Map<String, dynamic> json) =>
      _$ClearFilterFromJson(json);

  @override
  bool Function(ScoreData) get filter {
    return (ScoreData s) =>
        condition.contains(ClearLamp.values[s.clearTypeId - 1]);
  }
}
