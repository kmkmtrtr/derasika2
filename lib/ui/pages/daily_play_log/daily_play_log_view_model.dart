import 'package:derasika2/data/model/daily_play_log.dart';
import 'package:derasika2/data/model/enum/play_log_order.dart';
import 'package:derasika2/data/repository/play_log_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final dailyPlayLogViewModelProvider = ChangeNotifierProvider.autoDispose.family(
    (ref, String dateString) => DailyPlayLogViewModel(ref.read, dateString));

class DailyPlayLogViewModel extends ChangeNotifier {
  DailyPlayLogViewModel(
    this._reader,
    this.updateDate,
  );

  final String updateDate;

  final Reader _reader;
  late final PlayLogRepository _playLogRepository =
      _reader(playLogRepositoryProvider);

  List<DailyPlayLog>? _dailyPlayLogs;
  List<DailyPlayLog> get dailyPlayLogs => _dailyPlayLogs ?? [];

  PlayLogOrder _playLogOrder = PlayLogOrder.songTitleAsc;
  PlayLogOrder get playLogOrder => _playLogOrder;
  int playLogSortCondition(DailyPlayLog a, DailyPlayLog b) {
    switch (_playLogOrder) {
      case PlayLogOrder.songTitleAsc:
        return a.title.compareTo(b.title);
      case PlayLogOrder.songTitleDesc:
        return b.title.compareTo(a.title);
      case PlayLogOrder.levelAsc:
        return a.level != b.level
            ? a.level.compareTo(b.level)
            : a.title.compareTo(b.title);
      case PlayLogOrder.levelDesc:
        return a.level != b.level
            ? b.level.compareTo(a.level)
            : a.title.compareTo(b.title);
      case PlayLogOrder.scoreAsc:
        return a.score != b.score
            ? a.score.compareTo(b.score)
            : a.title.compareTo(b.title);
      case PlayLogOrder.scoreDesc:
        return a.score != b.score
            ? b.score.compareTo(a.score)
            : a.title.compareTo(b.title);
      case PlayLogOrder.scoreDiffAsc:
        final diffA = a.score - a.beforeScore;
        final diffB = b.score - b.beforeScore;
        return diffA != diffB
            ? diffA.compareTo(diffB)
            : a.title.compareTo(b.title);
      case PlayLogOrder.scoreDiffDesc:
        final diffA = a.score - a.beforeScore;
        final diffB = b.score - b.beforeScore;
        return diffA != diffB
            ? diffB.compareTo(diffA)
            : a.title.compareTo(b.title);
      case PlayLogOrder.scoreRateAsc:
        return a.scoreRate != b.scoreRate
            ? a.scoreRate.compareTo(b.scoreRate)
            : a.title.compareTo(b.title);
      case PlayLogOrder.scoreRateDesc:
        return a.scoreRate != b.scoreRate
            ? b.scoreRate.compareTo(a.scoreRate)
            : a.title.compareTo(b.title);
      case PlayLogOrder.scoreRateDiffAsc:
        final diffA = a.scoreRate - a.beforeScoreRate;
        final diffB = b.scoreRate - b.beforeScoreRate;
        return diffA != diffB
            ? diffA.compareTo(diffB)
            : a.title.compareTo(b.title);
      case PlayLogOrder.scoreRateDiffDesc:
        final diffA = a.scoreRate - a.beforeScoreRate;
        final diffB = b.scoreRate - b.beforeScoreRate;
        return diffA != diffB
            ? diffB.compareTo(diffA)
            : a.title.compareTo(b.title);
      case PlayLogOrder.misscountAsc:
        return a.misscount != b.misscount
            ? (a.misscount ?? 9999).compareTo(b.misscount ?? 9999)
            : a.title.compareTo(b.title);
      case PlayLogOrder.misscountDesc:
        return a.misscount != b.misscount
            ? (b.misscount ?? 9999).compareTo(a.misscount ?? 9999)
            : a.title.compareTo(b.title);
      case PlayLogOrder.misscountDiffAsc:
        final diffA = a.misscount ?? 9999 - (a.beforeMisscount ?? 9999);
        final diffB = b.misscount ?? 9999 - (b.beforeMisscount ?? 9999);
        return diffA != diffB
            ? diffA.compareTo(diffB)
            : a.title.compareTo(b.title);
      case PlayLogOrder.misscountDiffDesc:
        final diffA = a.misscount ?? 9999 - (a.beforeMisscount ?? 9999);
        final diffB = b.misscount ?? 9999 - (b.beforeMisscount ?? 9999);
        return diffA != diffB
            ? diffB.compareTo(diffA)
            : a.title.compareTo(b.title);
      case PlayLogOrder.clearTypeAsc:
        return a.clearTypeId != b.clearTypeId
            ? a.clearTypeId.compareTo(b.clearTypeId)
            : a.title.compareTo(b.title);
      case PlayLogOrder.clearTypeDesc:
        return a.clearTypeId != b.clearTypeId
            ? b.clearTypeId.compareTo(a.clearTypeId)
            : a.title.compareTo(b.title);
      case PlayLogOrder.clearTypeDiffAsc:
        final diffA = a.clearTypeId - a.beforeClearTypeId;
        final diffB = b.clearTypeId - b.beforeClearTypeId;
        return diffA != diffB
            ? diffA.compareTo(diffB)
            : a.title.compareTo(b.title);
      case PlayLogOrder.clearTypeDiffDesc:
        final diffA = a.clearTypeId - a.beforeClearTypeId;
        final diffB = b.clearTypeId - b.beforeClearTypeId;
        return diffA != diffB
            ? diffB.compareTo(diffA)
            : a.title.compareTo(b.title);
    }
  }

  Future<void> getDialyPlayLogs() async {
    _playLogRepository
        .getDailyPlayLogs(DateTime.parse(updateDate))
        .then((value) => _dailyPlayLogs = value)
        .whenComplete(notifyListeners);
  }

  void changePlayLogOrder(PlayLogOrder order) {
    _playLogOrder = order;
    notifyListeners();
  }
}
