import 'package:derasika2/data/db/app_db.dart';
import 'package:derasika2/data/model/memo.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sqflite/sqflite.dart';

final memoDataSourceProvider = Provider((ref) => MemoDataSource(ref.read));

class MemoDataSource {
  MemoDataSource(this._reader);

  final Reader _reader;
  late final AppDB _appDb = _reader(appDBProvider);

  Future<List<Memo>> fetchMemo(int chartId) async {
    final db = await _appDb.connection;
    final data = await db.query(
      'memo',
      where: 'chart_id=?',
      whereArgs: [chartId],
      orderBy: 'created_at desc',
    );
    return data.map((e) => Memo.fromJson(e)).toList();
  }

  Future<void> upsertMemo(Memo memo) async {
    final db = await _appDb.connection;
    final values = memo.toJson();
    values['created_at'] = values['created_at'].toString();
    await db.insert('memo', values,
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> deleteMemo(int id) async {
    final db = await _appDb.connection;
    await db.delete(
      'memo',
      where: 'id=?',
      whereArgs: [id],
    );
  }
}
