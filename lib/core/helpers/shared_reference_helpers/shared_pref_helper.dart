import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefHelper {
  SharedPrefHelper._();

  static SharedPreferences get _prefs => GetIt.instance<SharedPreferences>();

  static Future<void> setData(String key, dynamic value) async {
    if (value is String) {
      await _prefs.setString(key, value);
    } else if (value is int) {
      await _prefs.setInt(key, value);
    } else if (value is bool) {
      await _prefs.setBool(key, value);
    } else if (value is double) {
      await _prefs.setDouble(key, value);
    } else if (value is List<String>) {
      await _prefs.setStringList(key, value);
    } else {
      throw Exception(
        "Type ${value.runtimeType} is not supported by SharedPreferences",
      );
    }
  }

  static String getString(String key) => _prefs.getString(key) ?? "";
  static int getInt(String key) => _prefs.getInt(key) ?? 0;
  static double getDouble(String key) => _prefs.getDouble(key) ?? 0.0;
  static bool getBool(String key) => _prefs.getBool(key) ?? false;
  static List<String> getStringList(String key) =>
      _prefs.getStringList(key) ?? [];

  static Future<void> removeData(String key) async {
    await _prefs.remove(key);
  }

  static Future<void> clearAll() async {
    await _prefs.clear();
  }
}
