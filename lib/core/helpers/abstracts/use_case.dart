import "package:gharsa/core/networking/remote/api_result.dart";

abstract class UseCase<T, P> {
  Future<ApiResult<T>> call(P params);
}

class NoParams {
  const NoParams();
}
