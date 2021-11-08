import 'package:derasika2/data/db/app_db.dart';
import 'package:derasika2/data/model/score_data.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final scoreDataSourceProvider = Provider((ref) => ScoreDataSource(ref.read));

class ScoreDataSource {
  ScoreDataSource(this._reader);

  final Reader _reader;
  late final AppDB _appDb = _reader(appDBProvider);

  Future<List<ScoreData>> fetchVersionScores(int version) async {
    final db = await _appDb.connection;
    final data = await db.query('version_score_view',
        where: 'score_version_id=?',
        whereArgs: [version],
        orderBy: 'title, difficulty_type_id');
    return data
        .map(
          (e) => ScoreData(
            e['chart_id'] as int,
            e['title'] as String,
            e['level'] as int,
            e['difficulty'] as String,
            e['mode_type_id'] as int,
            e['score'] as int,
            e['djlevel_type'] as String,
            e['score_rate'] as double,
            e['score_pace'] as String,
            e['next_score_pace'] as String,
            e['prev_score'] as int?,
            e['best_score'] as int?,
            e['clear_type'] as String,
            e['misscount'].toString(),
            e['prev_misscount']?.toString(),
            e['best_misscount']?.toString(),
          ),
        )
        .toList();
  }
}
