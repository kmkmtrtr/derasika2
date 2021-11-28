import 'package:derasika2/data/db/app_db.dart';
import 'package:derasika2/data/model/chart_detail.dart';
import 'package:derasika2/data/model/play_log.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final playLogDataSourceProvider =
    Provider((ref) => PlayLogDataSource(ref.read));

class PlayLogDataSource {
  PlayLogDataSource(this._reader);

  final Reader _reader;
  late final AppDB _appDb = _reader(appDBProvider);

  Future<List<PlayLog>> fetchPlayLogs() async {
    final db = await _appDb.connection;
    final data = await db.query('play_log_view');
    return data.map((e) => PlayLog.fromJson(e)).toList();
  }

  Future<ChartDetail> fetchDailyPlayLogs(int chartId) async {
    final db = await _appDb.connection;
    final data = await db.query(
      '',
      where: 'id=?',
      whereArgs: [chartId],
    );
    return ChartDetail.fromJson(data.first);
  }
}
