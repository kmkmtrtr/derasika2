import 'package:derasika2/data/db/score_data_source.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final scoresRepositoryProvider = Provider((ref) => ScoresRepository(ref.read));

class ScoresRepository {
  ScoresRepository(this._reader);

  final Reader _reader;
  late final ScoreDataSource _scoreDataSource =
      _reader(scoreDataSourceProvider);

  Future<dynamic> getCurrentScores() async {
    return await _scoreDataSource.fetchCurrentScores(29);
  }
}
