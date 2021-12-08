import 'package:derasika2/data/model/enum/sort_element.dart';
import 'package:derasika2/data/model/enum/sort_order.dart';
import 'package:derasika2/data/model/score_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sort_condition.freezed.dart';
part 'sort_condition.g.dart';

@freezed
class SortCondition with _$SortCondition {
  const SortCondition._();
  factory SortCondition(
    @JsonKey(name: 'sort_element') SortElement sortElement,
    @JsonKey(name: 'sort_order') SortOrder sortOrder,
  ) = _SortCondition;

  factory SortCondition.fromJson(Map<String, dynamic> json) =>
      _$SortConditionFromJson(json);

  int Function(ScoreData, ScoreData) get ruleFunction {
    switch (sortElement) {
      case SortElement.title:
        switch (sortOrder) {
          case SortOrder.asc:
            return (ScoreData a, ScoreData b) => a.title.compareTo(b.title);
          case SortOrder.desc:
            return (ScoreData a, ScoreData b) => b.title.compareTo(a.title);
        }
      case SortElement.level:
        switch (sortOrder) {
          case SortOrder.asc:
            return (ScoreData a, ScoreData b) => a.level.compareTo(b.level);
          case SortOrder.desc:
            return (ScoreData a, ScoreData b) => b.level.compareTo(a.level);
        }
      case SortElement.difficulty:
        switch (sortOrder) {
          case SortOrder.asc:
            return (ScoreData a, ScoreData b) =>
                a.difficultyId.compareTo(b.difficultyId);
          case SortOrder.desc:
            return (ScoreData a, ScoreData b) =>
                b.difficultyId.compareTo(a.difficultyId);
        }
      case SortElement.scoreRate:
        switch (sortOrder) {
          case SortOrder.asc:
            return (ScoreData a, ScoreData b) =>
                a.scoreRate.compareTo(b.scoreRate);
          case SortOrder.desc:
            return (ScoreData a, ScoreData b) =>
                b.scoreRate.compareTo(a.scoreRate);
        }
      case SortElement.clearType:
        switch (sortOrder) {
          case SortOrder.asc:
            return (ScoreData a, ScoreData b) =>
                a.clearTypeId.compareTo(b.clearTypeId);
          case SortOrder.desc:
            return (ScoreData a, ScoreData b) =>
                b.clearTypeId.compareTo(a.clearTypeId);
        }
      case SortElement.djPoint:
        switch (sortOrder) {
          case SortOrder.asc:
            return (ScoreData a, ScoreData b) => a.djpoint.compareTo(b.djpoint);
          case SortOrder.desc:
            return (ScoreData a, ScoreData b) => b.djpoint.compareTo(a.djpoint);
        }
      case SortElement.maxBpm:
        // TODO maxBpmを取得するor条件から外す
        switch (sortOrder) {
          case SortOrder.asc:
            return (ScoreData a, ScoreData b) => a.title.compareTo(b.title);
          case SortOrder.desc:
            return (ScoreData a, ScoreData b) => b.title.compareTo(a.title);
        }
      case SortElement.notes:
        switch (sortOrder) {
          case SortOrder.asc:
            return (ScoreData a, ScoreData b) => a.notes.compareTo(b.notes);
          case SortOrder.desc:
            return (ScoreData a, ScoreData b) => b.notes.compareTo(a.notes);
        }
      case SortElement.version:
        switch (sortOrder) {
          case SortOrder.asc:
            return (ScoreData a, ScoreData b) =>
                a.versionId.compareTo(b.versionId);
          case SortOrder.desc:
            return (ScoreData a, ScoreData b) =>
                b.versionId.compareTo(a.versionId);
        }
      case SortElement.prevScoreDiff:
        switch (sortOrder) {
          case SortOrder.asc:
            return (ScoreData a, ScoreData b) => (a.score - (a.prevScore ?? 0))
                .compareTo(b.score - (b.prevScore ?? 0));
          case SortOrder.desc:
            return (ScoreData a, ScoreData b) => (b.score - (b.prevScore ?? 0))
                .compareTo(a.score - (a.prevScore ?? 0));
        }
      case SortElement.bestScoreDiff:
        switch (sortOrder) {
          case SortOrder.asc:
            return (ScoreData a, ScoreData b) => (a.score - (a.bestScore ?? 0))
                .compareTo(b.score - (b.bestScore ?? 0));
          case SortOrder.desc:
            return (ScoreData a, ScoreData b) => (b.score - (b.bestScore ?? 0))
                .compareTo(a.score - (a.bestScore ?? 0));
        }
      default:
        return (ScoreData a, ScoreData b) => a.title.compareTo(b.title);
    }
  }
}
