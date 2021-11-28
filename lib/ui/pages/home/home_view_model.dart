import 'package:derasika2/data/model/enum/play_mode.dart';
import 'package:derasika2/data/model/score_data.dart';
import 'package:derasika2/data/repository/score_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final homeViewModelProvider =
    ChangeNotifierProvider((ref) => HomeViewModel(ref.read));

class HomeViewModel extends ChangeNotifier {
  HomeViewModel(this._reader);

  final Reader _reader;
  late final ScoreRepository _repository = _reader(scoreRepositoryProvider);
  String orderBy = 'title, difficulty_type_id';
  String? where;
  List<Object?>? whereArgs;
  String? _filter;
  PlayMode playMode = PlayMode.sp;
  DateTime? importDateTime;

  List<ScoreData>? _scores;
  List<ScoreData> get scores {
    final scores = (_scores ?? <ScoreData>[]);
    final filter = _filter;
    if (filter == null || filter == '') {
      return scores;
    }
    return scores.where((e) => e.title.toLowerCase().contains(filter)).toList();
  }

  Future<void> fetchScores() {
    return _repository
        .getCurrentVersionScores(where, whereArgs, orderBy, playMode)
        .then((value) => _scores = value)
        .whenComplete(notifyListeners);
  }

  Future<int> getCurrentVersionId() {
    return _repository.getCurrentVersionId();
  }

  void changeFilterQuery(String filter) {
    _filter = filter.toLowerCase();
    notifyListeners();
  }

  void changeMode(PlayMode mode) {
    playMode = mode;
    notifyListeners();
  }

  Future<void> importCsv(List<String> csvData) async {
    await _repository.importCsv(csvData, playMode);
    importDateTime = DateTime.now();
    notifyListeners();
  }
}
