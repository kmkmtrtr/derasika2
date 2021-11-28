import 'package:derasika2/data/model/play_log.dart';
import 'package:derasika2/data/repository/play_log_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final playLogViewModelProvider =
    ChangeNotifierProvider.autoDispose((ref) => PlayLogViewModel(ref.read));

class PlayLogViewModel extends ChangeNotifier {
  PlayLogViewModel(this._reader);

  final Reader _reader;
  late final PlayLogRepository _playLogRepository =
      _reader(playLogRepositoryProvider);

  List<PlayLog>? _playLogs;
  List<PlayLog> get playLogs => _playLogs ?? [];

  Future<void> getPlayLogs() async {
    _playLogRepository
        .getPlayLogs()
        .then((value) => _playLogs = value)
        .whenComplete(notifyListeners);
  }
}
