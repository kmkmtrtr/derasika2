import 'package:derasika2/data/db/score_data_source.dart';
import 'package:derasika2/data/model/play_mode.dart';
import 'package:derasika2/data/model/score_data.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final scoreRepositoryProvider = Provider((ref) => ScoreRepository(ref.read));

class ScoreRepository {
  ScoreRepository(this._reader);

  final Reader _reader;
  late final ScoreDataSource _scoreDataSource =
      _reader(scoreDataSourceProvider);

  Future<List<ScoreData>> getVersionScores(int version, String? where,
      List<Object?>? whereArgs, String orderBy, PlayMode playMode) async {
    return await _scoreDataSource.fetchVersionScores(
        version, where, whereArgs, orderBy, playMode);
  }
}
