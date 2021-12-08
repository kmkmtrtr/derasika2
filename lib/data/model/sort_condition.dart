import 'package:derasika2/data/model/enum/sort_element.dart';
import 'package:derasika2/data/model/enum/sort_order.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sort_condition.freezed.dart';
part 'sort_condition.g.dart';

@freezed
class SortCondition with _$SortCondition {
  factory SortCondition(
    @JsonKey(name: 'sort_element') SortElement sortElement,
    @JsonKey(name: 'sort_order') SortOrder sortOrder,
  ) = _SortCondition;

  factory SortCondition.fromJson(Map<String, dynamic> json) =>
      _$SortConditionFromJson(json);
}
