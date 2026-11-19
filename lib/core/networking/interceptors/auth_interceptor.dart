import 'package:dio/dio.dart';
import 'package:gharsa/core/helpers/constants/storage_keys.dart';
import 'package:gharsa/core/helpers/shared_reference_helpers/secure_storage_helper.dart';

class AuthInterceptor extends QueuedInterceptorsWrapper {
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await SecureStorageHelper.getString(StorageKeys.userToken);
    if (token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401) {
      _handleUnauthorized();
    }
    handler.next(err);
  }

  Future<void> _handleUnauthorized() async {
    await SecureStorageHelper.clearAll();
  }
}
