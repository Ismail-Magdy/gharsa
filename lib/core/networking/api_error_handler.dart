import 'package:dio/dio.dart';
import 'package:gharsa/core/networking/failure.dart';

abstract class ApiErrorHandler {
  ApiErrorHandler._();

  static Failure handle(Object error) {
    if (error is DioException) {
      return _handleDioException(error);
    }
    return UnknownFailure(error.toString());
  }

  static Failure _handleDioException(DioException error) {
    return switch (error.type) {
      DioExceptionType.connectionTimeout => const TimeoutFailure(
        'Connection timed out',
      ),
      DioExceptionType.sendTimeout => const TimeoutFailure('Send timed out'),
      DioExceptionType.receiveTimeout => const TimeoutFailure(
        'Receive timed out',
      ),
      DioExceptionType.connectionError => const NetworkFailure(
        'No internet connection',
      ),
      DioExceptionType.cancel => const NetworkFailure('Request was cancelled'),
      DioExceptionType.badCertificate => const ServerFailure(
        'Invalid certificate',
      ),
      DioExceptionType.badResponse => _handleBadResponse(error),
      _ => UnknownFailure(error.message ?? 'An unexpected error occurred'),
    };
  }

  static Failure _handleBadResponse(DioException error) {
    final statusCode = error.response?.statusCode;
    final data = error.response?.data;

    String message = 'An unexpected error occurred';

    if (data is Map<String, dynamic>) {
      if (data['errors'] is List && (data['errors'] as List).isNotEmpty) {
        message = (data['errors'] as List).join('\n');
      } else if (data['message'] is String) {
        message = data['message'] as String;
      }
    }

    if (statusCode == 401) {
      return UnauthorizedFailure(message, statusCode: statusCode);
    }

    return ServerFailure(message, statusCode: statusCode);
  }
}
