import 'package:derasika2/data/model/enum/sort_element.dart';
import 'package:derasika2/data/model/enum/sort_order.dart';
import 'package:derasika2/data/model/sort_condition.dart';
import 'package:derasika2/data/provider/sort_condition_state_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final sortViewModelProvider =
    ChangeNotifierProvider.autoDispose((ref) => SortViewModel(ref.read));

class SortViewModel extends ChangeNotifier {
  SortViewModel(this._reader);

  final Reader _reader;
  late final StateController<List<SortCondition>> _sortConditionState =
      _reader(sortConditionProvider.state);
  late List<SortCondition> _sortCondition =
      _reader(sortConditionProvider.state).state.toList();

  List<SortCondition> get sortConditions => _sortCondition;

  void addCondition() {
    _sortCondition.add(SortCondition(SortElement.title, SortOrder.asc));
    notifyListeners();
  }

  void resetConditions() {
    _sortCondition = [
      SortCondition(SortElement.title, SortOrder.asc),
      SortCondition(SortElement.difficulty, SortOrder.asc),
    ];
    notifyListeners();
  }

  void changeElement(int index, SortElement element) {
    final condition = _sortCondition[index];
    _sortCondition[index] = condition.copyWith(sortElement: element);
    notifyListeners();
  }

  void changeOrder(int index, SortOrder order) {
    final condition = _sortCondition[index];
    _sortCondition[index] = condition.copyWith(sortOrder: order);
    notifyListeners();
  }

  void removeCondition(int index) {
    _sortCondition.removeAt(index);
    notifyListeners();
  }

  void reorder(int index1, int index2) {
    final condition = _sortCondition[index1];
    _sortCondition.insert(index2, condition);
    _sortCondition.removeAt(index1 > index2 ? index1 + 1 : index1);
    notifyListeners();
  }

  void save() {
    _sortConditionState.state = _sortCondition;
  }
}
