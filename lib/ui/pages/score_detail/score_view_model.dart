import 'package:derasika2/data/model/chart_detail.dart';
import 'package:derasika2/data/model/score_log.dart';
import 'package:derasika2/data/repository/chart_repository.dart';
import 'package:derasika2/data/repository/score_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final scoreViewModelProvider =
    ChangeNotifierProvider((ref) => ScoreViewModel(ref.read));

class ScoreViewModel extends ChangeNotifier {
  ScoreViewModel(this._reader);

  final Reader _reader;
  late final ScoreRepository _scoreRepository =
      _reader(scoreRepositoryProvider);
  late final ChartRepository _chartRepository =
      _reader(chartRepositoryProvider);

  int? _chartId;
  List<ScoreLog>? _scores;
  List<ScoreLog> get scores => _scores ?? <ScoreLog>[];
  ChartDetail? _chartDetail;
  ChartDetail? get chartDetail => _chartDetail;

  int _currentIndex = 0;

  Future<void> fetchChartDetail() {
    _currentIndex = 0;
    return Future.wait([
      _scoreRepository.getChartScores(_chartId ?? 1),
      _chartRepository.getChartDetail(_chartId ?? 1),
    ]).then((value) {
      _scores = value[0] as List<ScoreLog>;
      _chartDetail = value[1] as ChartDetail;
    }).whenComplete(notifyListeners);
  }

  void setChartId(int chartId) {
    _chartId = chartId;
  }

  set currentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  int get currentIndex => _currentIndex;
}
