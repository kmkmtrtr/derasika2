import 'dart:math';

import 'package:derasika2/data/model/chart_detail.dart';
import 'package:derasika2/data/model/memo.dart';
import 'package:derasika2/data/model/score_log.dart';
import 'package:derasika2/data/repository/chart_repository.dart';
import 'package:derasika2/data/repository/memo_repository.dart';
import 'package:derasika2/data/repository/score_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final scoreViewModelProvider = ChangeNotifierProvider.autoDispose
    .family((ref, int chartId) => ScoreViewModel(ref.read, chartId));

class ScoreViewModel extends ChangeNotifier {
  ScoreViewModel(this._reader, this._chartId);

  final Reader _reader;
  final int _chartId;
  late final ScoreRepository _scoreRepository =
      _reader(scoreRepositoryProvider);
  late final ChartRepository _chartRepository =
      _reader(chartRepositoryProvider);
  late final MemoRepository _memoRepository = _reader(memoRepositoryProvider);

  int get chartId => _chartId;
  List<ScoreLog>? _scores;
  List<ScoreLog> get scores => _scores ?? <ScoreLog>[];
  ScoreLog? _currentRecord;
  ScoreLog? get currentRecord => _currentRecord;
  ScoreLog? _prevScoreRecord;
  ScoreLog? get prevScoreRecord => _prevScoreRecord;
  ScoreLog? _prevMissCountRecord;
  ScoreLog? get prevMissCountRecord => _prevMissCountRecord;
  ScoreLog? _historicalScoreRecord;
  ScoreLog? get historicalScoreRecord => _historicalScoreRecord;
  ScoreLog? _historicalMissCountRecord;
  ScoreLog? get historicalMissCountRecord => _historicalMissCountRecord;
  List<Memo>? _memo;
  List<Memo> get memo => _memo ?? <Memo>[];

  ChartDetail? _chartDetail;
  ChartDetail? get chartDetail => _chartDetail;
  int? _versionId;
  int? get versionId => _versionId;

  Future<void> getChartDetail() {
    return Future.wait([
      _scoreRepository.getChartScores(_chartId),
      _chartRepository.getChartDetail(_chartId),
      _scoreRepository.getCurrentVersionId(),
      _memoRepository.getMemo(chartId),
    ]).then((value) {
      final scores = value[0] as List<ScoreLog>;
      _scores = scores;
      _chartDetail = value[1] as ChartDetail;
      _versionId = value[2] as int;
      _memo = value[3] as List<Memo>;
      if (scores.any((e) => e.versionId == (_versionId ?? 0))) {
        _currentRecord =
            scores.firstWhere((e) => e.versionId == (_versionId ?? 0));
      }
      if (scores.any((e) => e.versionId == (_versionId ?? 0) - 1)) {
        final maxScore = scores
            .where((e) => e.versionId == (_versionId ?? 0) - 1)
            .map((e) => e.score)
            .reduce(max);
        final minMissCount = scores
                .where((e) => e.versionId == (_versionId ?? 0) - 1)
                .any((e) => e.misscount != null)
            ? scores
                .where((e) => e.versionId == (_versionId ?? 0) - 1)
                .map((e) => e.misscount ?? 9999)
                .reduce(min)
            : null;
        _prevScoreRecord = scores.firstWhere((e) => e.score == maxScore);
        _prevMissCountRecord =
            scores.firstWhere((e) => e.misscount == minMissCount);
      }
      if (scores.any((e) => e.versionId < (_versionId ?? 0))) {
        final maxScore = scores
            .where((e) => e.versionId < (_versionId ?? 0))
            .map((e) => e.score)
            .reduce(max);
        final minMissCount = scores
                .where((e) => e.versionId < (_versionId ?? 0))
                .any((e) => e.misscount != null)
            ? scores
                .where((e) => e.versionId < (_versionId ?? 0))
                .map((e) => e.misscount ?? 9999)
                .reduce(min)
            : null;
        _historicalScoreRecord = scores
            .where((e) => e.versionId < (_versionId ?? 0))
            .firstWhere((e) => e.score == maxScore);
        _historicalMissCountRecord = scores
            .where((e) => e.versionId < (_versionId ?? 0))
            .firstWhere((e) => e.misscount == minMissCount);
      }
    }).whenComplete(notifyListeners);
  }

  Future<void> upsertMemo(
      int? id, DateTime createdAt, String text, String title) async {
    final memo = Memo(id, createdAt, text, title, chartId);
    _memoRepository.updateMemo(memo).whenComplete(notifyListeners);
  }

  Future<void> deleteMemo(int id) async {
    _memoRepository.deleteMemo(id).whenComplete(notifyListeners);
  }
}
