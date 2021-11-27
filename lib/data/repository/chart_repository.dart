import 'package:derasika2/data/db/chart_data_source.dart';
import 'package:derasika2/data/model/chart_detail.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final chartRepositoryProvider = Provider((ref) => ChartRepository(ref.read));

class ChartRepository {
  ChartRepository(this._reader);

  final Reader _reader;
  late final ChartDataSource _chartDataSource =
      _reader(chartDataSourceProvider);

  Future<ChartDetail> getChartDetail(int chartId) {
    return _chartDataSource.fetchChartDetail(chartId);
  }
}
