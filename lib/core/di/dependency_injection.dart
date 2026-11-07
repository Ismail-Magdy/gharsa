import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> initGetIt() async {
  // /// Dio & ApiService
  // final dio = await DioFactory.getDio();
  // getIt.registerLazySingleton<ApiServices>(() => ApiServices(dio));

  /// SharedPreferences
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerSingleton<SharedPreferences>(sharedPreferences);

  /// Flutter Secure Storage
  const secureStorage = FlutterSecureStorage();
  getIt.registerLazySingleton<FlutterSecureStorage>(() => secureStorage);

  // /// Login
  // getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  // getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));

  // /// SignUp
  // getIt.registerLazySingleton<SignUpRepo>(() => SignUpRepo(getIt()));
  // getIt.registerFactory<SignUpCubit>(() => SignUpCubit(getIt()));
}
