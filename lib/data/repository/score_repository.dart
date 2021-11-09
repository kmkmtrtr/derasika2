import 'package:derasika2/data/db/score_data_source.dart';
import 'package:derasika2/data/model/score_data.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final scoreRepositoryProvider = Provider((ref) => ScoreRepository(ref.read));

class ScoreRepository {
  ScoreRepository(this._reader);

  final Reader _reader;
  late final ScoreDataSource _scoreDataSource =
      _reader(scoreDataSourceProvider);

  Future<List<ScoreData>> getCurrentScores() async {
    const currentVersion = 29;
    return await _scoreDataSource.fetchVersionScores(currentVersion);
  }

  Future<List<ScoreData>> getPrevScores() async {
    const currentVersion = 28;
    return await _scoreDataSource.fetchVersionScores(currentVersion);
  }
}
