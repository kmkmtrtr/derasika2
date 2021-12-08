import 'package:derasika2/data/model/enum/sort_element.dart';
import 'package:derasika2/data/model/enum/sort_order.dart';
import 'package:derasika2/data/model/sort_condition.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final sortConditionProvider = StateProvider<List<SortCondition>>((_) => [
      SortCondition(SortElement.title, SortOrder.asc),
      SortCondition(SortElement.difficulty, SortOrder.asc),
    ]);
