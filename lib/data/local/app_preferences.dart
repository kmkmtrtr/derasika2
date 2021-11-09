import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final appPreferencesProvider = Provider((_) => AppPreferences());

class AppPreferences {
  AppPreferences._internal();
  SharedPreferences? _preferences;
  bool _initialized = false;

  static final AppPreferences _appPreferences = AppPreferences._internal();

  factory AppPreferences() {
    return _appPreferences;
  }

  Future<SharedPreferences> get preferences async {
    if (_preferences == null || !_initialized) {
      await _initialize();
    }
    return _preferences!;
  }

  Future _initialize() async {
    _preferences = await SharedPreferences.getInstance();
    _initialized = true;
  }
}
