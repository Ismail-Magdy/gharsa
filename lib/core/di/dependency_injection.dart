import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:gharsa/core/networking/remote/dio_factory.dart';
import 'package:gharsa/core/networking/remote/network_info.dart';

final getIt = GetIt.instance;

Future<void> setupDependencies() async {
  // Core Services
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerSingleton<SharedPreferences>(sharedPreferences);

  getIt.registerLazySingleton<FlutterSecureStorage>(
    () => const FlutterSecureStorage(),
  );

  // Networking
  final dio = await DioFactory.getDio();
  getIt.registerSingleton<Dio>(dio);

  getIt.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(InternetConnection()),
  );
}
