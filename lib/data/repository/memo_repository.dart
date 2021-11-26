import 'package:derasika2/data/db/memo_data_source.dart';
import 'package:derasika2/data/model/memo.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final memoRepositoryProvider = Provider((ref) => MemoRepository(ref.read));

class MemoRepository {
  MemoRepository(this._reader);

  final Reader _reader;
  late final MemoDataSource _memoDataSource = _reader(memoDataSourceProvider);

  Future<List<Memo>> getMemo(int chartId) {
    return _memoDataSource.fetchMemo(chartId);
  }

  Future<void> updateMemo(Memo memo) {
    return _memoDataSource.upsertMemo(memo);
  }

  Future<void> deleteMemo(int id) {
    return _memoDataSource.deleteMemo(id);
  }
}
