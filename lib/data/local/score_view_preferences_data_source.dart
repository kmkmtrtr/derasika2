import 'package:derasika2/data/local/app_preferences.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final scoreViewPreferencesDataSourceProvider =
    Provider((ref) => ScoreViewPreferencesDataSource(ref.read));

class ScoreViewPreferencesDataSource {
  ScoreViewPreferencesDataSource(this._reader);

  final Reader _reader;
  late final AppPreferences _appPreferences = _reader(appPreferencesProvider);

  Future<dynamic> fetchHoge() async {
    final preferences = await _appPreferences.preferences;
    final hoge = preferences.get('hoge');
    return hoge;
  }
}
