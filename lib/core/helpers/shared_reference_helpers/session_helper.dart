import "dart:async";

import "package:gharsa/core/helpers/constants/storage_keys.dart";
import "package:gharsa/core/helpers/shared_reference_helpers/secure_storage_helper.dart";
import "package:gharsa/core/helpers/shared_reference_helpers/shared_pref_helper.dart";

class SessionHelper {
  SessionHelper._();

  static final StreamController<void> _sessionExpiredController =
      StreamController<void>.broadcast();

  static Stream<void> get sessionExpired => _sessionExpiredController.stream;

  static void notifySessionExpired() {
    _sessionExpiredController.add(null);
  }

  static Future<bool> get isLoggedIn async {
    final token = await SecureStorageHelper.getString(StorageKeys.userToken);
    return token.trim().isNotEmpty;
  }

  static bool get hasSeenOnboarding {
    return SharedPrefHelper.getBool(StorageKeys.hasSeenOnboarding);
  }

  static Future<void> setHasSeenOnboarding() async {
    await SharedPrefHelper.setData(StorageKeys.hasSeenOnboarding, true);
  }

  static Future<void> saveSession({required String token}) async {
    await SecureStorageHelper.setString(StorageKeys.userToken, token);
  }

  static Future<void> clearSession() async {
    await SecureStorageHelper.clearAll();
  }
}
