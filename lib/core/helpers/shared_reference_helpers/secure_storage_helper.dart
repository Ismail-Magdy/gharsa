import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

class SecureStorageHelper {
  SecureStorageHelper._();

  static FlutterSecureStorage get _secureStorage =>
      GetIt.instance<FlutterSecureStorage>();

  static Future<void> setString(String key, String value) async {
    await _secureStorage.write(key: key, value: value);
  }

  static Future<String> getString(String key) async {
    return await _secureStorage.read(key: key) ?? "";
  }

  static Future<void> removeData(String key) async {
    await _secureStorage.delete(key: key);
  }

  static Future<void> clearAll() async {
    await _secureStorage.deleteAll();
  }
}
