import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Gharsa extends StatelessWidget {
  const Gharsa({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: MaterialApp(
          title: "Gharsa",
          debugShowCheckedModeBanner: false,
          theme: ThemeData(fontFamily: "Cairo"),
          //  onGenerateRoute: ,
          // initialRoute: ,
        ),
      ),
    );
  }
}
