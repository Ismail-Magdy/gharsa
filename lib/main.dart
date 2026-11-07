import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gharsa/core/di/dependency_injection.dart';
import 'package:gharsa/gharsa.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //
  await SystemChrome.setPreferredOrientations([.portraitUp, .portraitDown]);
  //
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: .dark,
    ),
  );
  //
  await initGetIt();
  //
  await ScreenUtil.ensureScreenSize();
  //
  runApp(const Gharsa());
}
