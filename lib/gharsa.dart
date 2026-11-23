import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:gharsa/core/helpers/constants/app_constants.dart";
import "package:gharsa/core/routing/app_router.dart";
import "package:gharsa/core/theming/app_fonts.dart";

class Gharsa extends StatelessWidget {
  final String? initialRoute;

  const Gharsa({super.key, this.initialRoute});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(
        AppConstants.designWidth,
        AppConstants.designHeight,
      ),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: MaterialApp(
          navigatorKey: AppRouter.navigatorKey,
          title: AppConstants.appName,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(fontFamily: AppFonts.cairo),
          initialRoute: initialRoute,
          onGenerateRoute: AppRouter().onGenerateRoute,
        ),
      ),
    );
  }
}
