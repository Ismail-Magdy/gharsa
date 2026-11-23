import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter_dotenv/flutter_dotenv.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:gharsa/core/di/dependency_injection.dart";
import "package:gharsa/core/helpers/shared_reference_helpers/session_helper.dart";
import "package:gharsa/core/routing/routes.dart";
import "package:gharsa/gharsa.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load();

  await SystemChrome.setPreferredOrientations([.portraitUp, .portraitDown]);

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: .dark,
    ),
  );

  await setupDependencies();

  await ScreenUtil.ensureScreenSize();

  // Resolve initial route once per session rules
  final String initialRoute;
  if (await SessionHelper.isLoggedIn) {
    initialRoute = Routes.homeScreen;
  } else if (!SessionHelper.hasSeenOnboarding) {
    initialRoute = Routes.splashScreen;
  } else {
    initialRoute = Routes.loginScreen;
  }

  runApp(Gharsa(initialRoute: initialRoute));
}
