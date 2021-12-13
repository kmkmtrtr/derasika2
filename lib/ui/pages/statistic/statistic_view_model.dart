import 'package:derasika2/data/model/version.dart';
import 'package:derasika2/data/repository/version_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final statisticViewModelProvider =
    ChangeNotifierProvider.autoDispose((ref) => StatisticViewModel(ref.read));

class StatisticViewModel extends ChangeNotifier {
  StatisticViewModel(this._reader);

  final Reader _reader;
  late final VersionRepository _version = _reader(versionRepositoryProvider);
  List<Version>? _versions;
  List<Version> get versions => _versions ?? [];

  Future<void> loadData() async {
    _version.getVersions().then((value) {
      _versions = value;
    }).whenComplete(notifyListeners);
  }
}
