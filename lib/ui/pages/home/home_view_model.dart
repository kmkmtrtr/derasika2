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
  int version = 29;

  List<ScoreData>? _scores;
  List<ScoreData> get scores => _scores ?? <ScoreData>[];
  String orderBy = 'title, difficulty_type_id';
  String? where;
  List<Object?>? whereArgs;

  Future<void> fetchScores() {
    return _repository
        .getVersionScores(version, where, whereArgs, orderBy)
        .then((value) => _scores = value)
        .whenComplete(notifyListeners);
  }

  void changeVersion() {
    where = 'difficulty_type_id = ?';
    whereArgs = [4];
    notifyListeners();
  }
}
