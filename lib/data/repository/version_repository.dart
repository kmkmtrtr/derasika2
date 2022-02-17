import 'package:derasika2/data/db/version_data_source.dart';
import 'package:derasika2/data/model/version.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final versionRepositoryProvider =
    Provider((ref) => VersionRepository(ref.read));

class VersionRepository {
  VersionRepository(this._reader);

  final Reader _reader;
  late final VersionDataSource _versionDataSource =
      _reader(versionDataSourceProvider);

  Future<List<Version>> getVersions() {
    return _versionDataSource.fetchVersions();
  }

  Future<Version> getCurrentVersion() {
    return _versionDataSource.fetchCurrentVersion(DateTime.now());
  }
}
