import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:gharsa/core/helpers/extensions/context_extension.dart";
import "package:gharsa/core/helpers/spacing/spacing.dart";
import "package:gharsa/core/theming/app_colors.dart";
import "package:gharsa/core/widgets/custom_button.dart";

/// Shown by AppRouter when a route has no matching case.
/// Texts and visuals are customized per project.
class UnknownRouteScreen extends StatelessWidget {
  const UnknownRouteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: .symmetric(horizontal: 24.w),
          child: Column(
            mainAxisAlignment: .center,
            children: [
              // Placeholder Until The App Animation Is Added
              // Lottie.asset(
              //   "assets/lottie/no_data.json",
              //   width: 250.w,
              //   height: 250.h,
              // ),
              Icon(
                Icons.explore_off_outlined,
                size: 100.sp,
                color: AppColors.primaryColor,
              ),
              //
              verticalSpace(0),
              //
              Text(
                "المكان ده مش على الخريطة",
                textAlign: .center,
                style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: .bold,
                  color: AppColors.primaryColor,
                ),
              ),
              //
              verticalSpace(12),
              //
              Text(
                "يبدو أن الصفحة التي تبحث عنها غير موجودة أو تم نقلها",
                textAlign: .center,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.secondaryColor,
                ),
              ),
              //
              verticalSpace(40),
              //
              CustomButton(
                text: "الرجوع للسابق",
                onPressed: () => context.pop(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
