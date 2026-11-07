import 'package:dio/dio.dart';
import 'package:gharsa/core/helpers/shared_pref_helpers.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../helpers/constants.dart';

class DioFactory {
  /// private constructor to prevent creating an instance of this class
  DioFactory._();

  static Dio? dio;

  static Future<Dio> getDio() async {
    Duration timeOut = const Duration(seconds: 30);

    if (dio == null) {
      dio = Dio();
      dio!
        ..options.connectTimeout = timeOut
        ..options.receiveTimeout = timeOut;

      await addDioHeaders();
      addDioInterceptor();
      return dio!;
    } else {
      return dio!;
    }
  }

  static Future<void> addDioHeaders() async {
    dio?.options.headers = {
      "Accept": "application/json",
      "Content-Type": "application/json",
      "Authorization":
          "Bearer ${await SharedPrefHelper.getSecuredString(StorageKeys.userToken)}",
    };
  }

  static void setTokenIntoHeaderAfterLogin(String token) {
    dio?.options.headers['Authorization'] = "Bearer $token";
  }

  static void addDioInterceptor() {
    dio?.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
    );
  }
}
