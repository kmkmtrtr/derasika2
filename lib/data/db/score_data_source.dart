import 'package:derasika2/data/db/app_db.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final scoreDataSourceProvider = Provider((ref) => ScoreDataSource(ref.read));

class ScoreDataSource {
  ScoreDataSource(this._reader);

  final Reader _reader;
  late final AppDB _appDb = _reader(appDBProvider);

  Future<dynamic> fetchCurrentScores(int version) async {
    final db = await _appDb.connection;
    return await db.query(
      'version_score_view',
      where: 'version_id=?',
      whereArgs: [version],
    );
  }
}
