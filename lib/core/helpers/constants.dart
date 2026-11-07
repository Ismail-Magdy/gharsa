class StorageKeys {
  // Private constructor to prevent instantiation
  StorageKeys._();

  // Keys for Shared Preferences (Non-sensitive data)
  static const String userName = "userName";
  static const String userEmail = "userEmail";

  // Keys for Secure Storage (Sensitive data)
  static const String userToken = "userToken";
}
