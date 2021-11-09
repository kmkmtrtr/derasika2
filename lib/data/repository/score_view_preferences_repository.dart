import 'package:derasika2/data/local/score_view_preferences_data_source.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final scoreViewPreferencesDataSourceProvider =
    Provider((ref) => ScoreViewPreferencesDataSource(ref.read));

class ScoreViewPreferencesRepository {
  ScoreViewPreferencesRepository(this._reader);

  final Reader _reader;
  late final ScoreViewPreferencesDataSource _scoreViewPreferencesDataSource =
      _reader(scoreViewPreferencesDataSourceProvider);

  Future<dynamic> getHoge() async {
    return await _scoreViewPreferencesDataSource.fetchHoge();
  }
}
