import 'package:derasika2/data/db/play_log_data_source.dart';
import 'package:derasika2/data/model/play_log.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final playLogRepositoryProvider =
    Provider((ref) => PlayLogRepository(ref.read));

class PlayLogRepository {
  PlayLogRepository(this._reader);

  final Reader _reader;
  late final PlayLogDataSource _playLogDataSource =
      _reader(playLogDataSourceProvider);

  Future<List<PlayLog>> getPlayLogs() {
    return _playLogDataSource.fetchPlayLogs();
  }
}
