import 'package:derasika2/data/model/enum/sort_element.dart';
import 'package:derasika2/data/model/enum/sort_order.dart';
import 'package:derasika2/data/model/sort_condition.dart';
import 'package:derasika2/data/provider/filter_condition_state_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final filterViewModelProvider =
    ChangeNotifierProvider.autoDispose((ref) => FilterViewModel(ref.read));

class FilterViewModel extends ChangeNotifier {
  FilterViewModel(this._reader);

  final Reader _reader;
  late final StateController<List<SortCondition>> _filterConditionState =
      _reader(filterConditionProvider.state);
  late List<SortCondition> _filterCondition =
      _reader(filterConditionProvider.state).state.toList();

  List<SortCondition> get filterConditions => _filterCondition;

  void addCondition() {
    _filterCondition.add(SortCondition(SortElement.title, SortOrder.asc));
    notifyListeners();
  }

  void resetConditions() {
    _filterCondition = [
      SortCondition(SortElement.title, SortOrder.asc),
      SortCondition(SortElement.difficulty, SortOrder.asc),
    ];
    notifyListeners();
  }

  void changeElement(int index, SortElement element) {
    final condition = _filterCondition[index];
    _filterCondition[index] = condition.copyWith(sortElement: element);
    notifyListeners();
  }

  void changeOrder(int index, SortOrder order) {
    final condition = _filterCondition[index];
    _filterCondition[index] = condition.copyWith(sortOrder: order);
    notifyListeners();
  }

  void removeCondition(int index) {
    _filterCondition.removeAt(index);
    notifyListeners();
  }

  void reorder(int index1, int index2) {
    final condition = _filterCondition[index1];
    _filterCondition.insert(index2, condition);
    _filterCondition.removeAt(index1 > index2 ? index1 + 1 : index1);
    notifyListeners();
  }

  void save() {
    _filterConditionState.state = _filterCondition;
  }
}
