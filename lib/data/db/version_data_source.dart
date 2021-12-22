import 'package:derasika2/data/db/app_db.dart';
import 'package:derasika2/data/model/version.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

final versionDataSourceProvider =
    Provider((ref) => VersionDataSource(ref.read));

class VersionDataSource {
  VersionDataSource(this._reader);

  final Reader _reader;
  late final AppDB _appDb = _reader(appDBProvider);

  Future<List<Version>> fetchVersions() async {
    final db = await _appDb.connection;
    final data = await db.query('version_master', orderBy: 'rank desc');
    return data.map((e) => Version.fromJson(e)).toList();
  }

  Future<Version> fetchCurrentVersion(DateTime date) async {
    final db = await _appDb.connection;
    final data = await db.query('version_master',
        where: 'start_at <= ?',
        whereArgs: [DateFormat('yyyy-MM-dd').format(date)],
        orderBy: 'start_at desc');
    return data.map((e) => Version.fromJson(e)).first;
  }
}
