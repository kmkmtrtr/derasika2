import 'package:derasika2/data/db/score_data_source.dart';
import 'package:derasika2/data/model/csv/csv_since_heroic_verse.dart';
import 'package:derasika2/data/model/csv/csv_until_rootage.dart';
import 'package:derasika2/data/model/enum/play_mode.dart';
import 'package:derasika2/data/model/score_data.dart';
import 'package:derasika2/data/model/score_log.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final scoreRepositoryProvider = Provider((ref) => ScoreRepository(ref.read));

class ScoreRepository {
  ScoreRepository(this._reader);

  final Reader _reader;
  late final ScoreDataSource _scoreDataSource =
      _reader(scoreDataSourceProvider);

  Future<List<ScoreData>> getVersionScores(int version, String? where,
      List<Object?>? whereArgs, String orderBy, PlayMode playMode) {
    return _scoreDataSource.fetchVersionScores(
        version, where, whereArgs, orderBy, playMode);
  }

  Future<List<ScoreLog>> getChartScores(int chartId) {
    return _scoreDataSource.fetchChartScores(chartId);
  }

  Future<List<ScoreData>> getCurrentVersionScores(String? where,
      List<Object?>? whereArgs, String orderBy, PlayMode playMode) async {
    final version = await getCurrentVersionId();
    return await _scoreDataSource.fetchVersionScores(
        version, where, whereArgs, orderBy, playMode);
  }

  Future<List<ScoreData>> getCurrentVersionAllScores(PlayMode playMode) async {
    final version = await getCurrentVersionId();
    return await _scoreDataSource.fetchVersionAllScores(version, playMode);
  }

  Future<int> getCurrentVersionId() {
    return _scoreDataSource.fetchCurrentVersionId();
  }

  Future<void> importCsv(List<String> csvData, PlayMode playMode) async {
    if (csvData.length <= 1) {
      // ヘッダ行が存在するため1レコードの場合も更新をしない
      return;
    }
    final records = csvData.map((e) => e.split(','));
    final header = records.first;
    switch (header.length) {
      case 27:
        final csv = records
            .skip(1)
            .where((e) => e.length == 27)
            .map((e) => CsvUntilRootage.fromJson(Map.fromIterables(header, e)))
            .toList();
        await _scoreDataSource.upsertCsvUntilRootage(csv, playMode);
        break;
      case 41:
        final csv = records
            .skip(1)
            .where((e) => e.length == 41)
            .map((e) =>
                CsvSinceHeroicVerse.fromJson(Map.fromIterables(header, e)))
            .toList();
        await _scoreDataSource.upsertCsvSinceHeroicVerse(csv, playMode);
        break;
      default:
      // エラーとして扱う
    }
  }
}
