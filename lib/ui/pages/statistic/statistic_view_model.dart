import 'package:derasika2/data/model/enum/play_mode.dart';
import 'package:derasika2/data/model/score_data.dart';
import 'package:derasika2/data/model/version.dart';
import 'package:derasika2/data/repository/score_repository.dart';
import 'package:derasika2/data/repository/version_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final statisticViewModelProvider =
    ChangeNotifierProvider.autoDispose((ref) => StatisticViewModel(ref.read));

class StatisticViewModel extends ChangeNotifier {
  StatisticViewModel(this._reader);

  final Reader _reader;
  late final VersionRepository _version = _reader(versionRepositoryProvider);
  late final ScoreRepository _score = _reader(scoreRepositoryProvider);
  List<Version>? _versions;
  List<Version> get versions => _versions ?? [];
  List<ScoreData>? _scores;
  List<ScoreData> get scores => _scores ?? [];

  Future<void> loadData() async {
    Future.wait(
      [
        _version.getVersions(),
        _score.getCurrentVersionAllScores(PlayMode.sp),
      ],
    ).then((value) {
      _versions = value[0] as List<Version>;
      _scores = value[1] as List<ScoreData>;
    }).whenComplete(notifyListeners);
  }
}
