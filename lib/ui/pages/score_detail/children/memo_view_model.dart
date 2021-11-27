import 'package:derasika2/data/model/memo.dart';
import 'package:derasika2/data/repository/memo_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final memoViewModelProvider = ChangeNotifierProvider.autoDispose
    .family((ref, int chartId) => MemoViewModel(ref.read, chartId));

class MemoViewModel extends ChangeNotifier {
  MemoViewModel(this._reader, this._chartId);

  final Reader _reader;
  final int _chartId;
  late final MemoRepository _memoRepository = _reader(memoRepositoryProvider);

  int get chartId => _chartId;
  List<Memo>? _memo;
  List<Memo> get memo => _memo ?? <Memo>[];

  Future<void> getMemo() {
    return _memoRepository.getMemo(chartId).then((memoList) {
      _memo = memoList;
    }).whenComplete(notifyListeners);
  }

  Future<void> upsertMemo(
      int? id, DateTime createdAt, String text, String title) async {
    final memo = Memo(id, createdAt, text, title, chartId);
    _memoRepository.updateMemo(memo).whenComplete(getMemo);
  }

  Future<void> deleteMemo(int id) async {
    _memoRepository.deleteMemo(id).whenComplete(getMemo);
  }
}
