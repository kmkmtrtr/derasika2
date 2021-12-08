import 'package:derasika2/data/model/enum/sort_element.dart';
import 'package:derasika2/data/model/enum/sort_order.dart';
import 'package:derasika2/data/model/sort_condition.dart';
import 'package:derasika2/data/provider/sort_condition_state_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final sortViewModelProvider =
    ChangeNotifierProvider((ref) => SortViewModel(ref.read));

class SortViewModel extends ChangeNotifier {
  SortViewModel(this._reader);

  final Reader _reader;
  late final StateController<List<SortCondition>> _sortConditionState =
      _reader(sortConditionProvider.state);

  List<SortCondition> get sortConditions => _sortConditionState.state;

  void addCondition() {
    _sortConditionState.state
        .add(SortCondition(SortElement.title, SortOrder.asc));
    notifyListeners();
  }

  void resetConditions() {
    _sortConditionState.state = [
      SortCondition(SortElement.title, SortOrder.asc),
      SortCondition(SortElement.difficulty, SortOrder.asc),
    ];
    notifyListeners();
  }

  void changeElement(int index, SortElement element) {
    final condition = _sortConditionState.state[index];
    _sortConditionState.state[index] = condition.copyWith(sortElement: element);
    notifyListeners();
  }

  void changeOrder(int index, SortOrder order) {
    final condition = _sortConditionState.state[index];
    _sortConditionState.state[index] = condition.copyWith(sortOrder: order);
    notifyListeners();
  }

  void removeCondition(int index) {
    _sortConditionState.state.removeAt(index);
    notifyListeners();
  }

  void reorder(int index1, int index2) {
    final condition = _sortConditionState.state[index1];
    _sortConditionState.state.insert(index2, condition);
    _sortConditionState.state.removeAt(index1 > index2 ? index1 + 1 : index1);
    notifyListeners();
  }
}
