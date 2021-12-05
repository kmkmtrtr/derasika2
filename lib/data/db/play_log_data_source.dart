import 'package:derasika2/data/db/app_db.dart';
import 'package:derasika2/data/model/daily_play_log.dart';
import 'package:derasika2/data/model/play_log.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

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

  Future<List<DailyPlayLog>> fetchDailyPlayLogs(DateTime updateDate) async {
    final db = await _appDb.connection;
    final data = await db.query(
      'play_log_detail_view',
      where: 'updated_at=?',
      whereArgs: [DateFormat('yyyy-MM-dd').format(updateDate)],
    );
    return data.map((e) => DailyPlayLog.fromJson(e)).toList();
  }
}
