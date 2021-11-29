import 'package:derasika2/data/model/daily_play_log.dart';
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

  Future<void> getDialyPlayLogs() async {
    _playLogRepository
        .getDailyPlayLogs(DateTime.parse(updateDate))
        .then((value) => _dailyPlayLogs = value)
        .whenComplete(notifyListeners);
  }
}
