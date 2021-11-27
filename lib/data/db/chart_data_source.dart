import 'package:derasika2/data/db/app_db.dart';
import 'package:derasika2/data/model/chart_detail.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final chartDataSourceProvider = Provider((ref) => ChartDataSource(ref.read));

class ChartDataSource {
  ChartDataSource(this._reader);

  final Reader _reader;
  late final AppDB _appDb = _reader(appDBProvider);

  Future<ChartDetail> fetchChartDetail(int chartId) async {
    final db = await _appDb.connection;
    final data = await db.query(
      'chart_detail_view',
      where: 'id=?',
      whereArgs: [chartId],
    );
    return ChartDetail.fromJson(data.first);
  }
}
