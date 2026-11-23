import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:gharsa/core/helpers/spacing/spacing.dart";
import "package:gharsa/core/theming/app_colors.dart";
import "package:gharsa/core/widgets/custom_button.dart";

/// Shown for any error state in any feature.
/// Features never build their own error screen.
class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key, this.onRetry});

  /// Shows a retry button when provided.
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: .symmetric(horizontal: 20.w, vertical: 10.h),
        child: Column(
          mainAxisAlignment: .center,
          crossAxisAlignment: .center,
          children: [
            // Placeholder Until The App Image Is Added
            // Center(
            //   child: Image.asset(
            //     "assets/images/error-404.png",
            //     height: 100.h,
            //     width: 100.w,
            //     color: AppColors.primaryColor,
            //   ),
            // ),
            Icon(
              Icons.error_outline,
              size: 80.sp,
              color: AppColors.primaryColor,
            ),
            //
            verticalSpace(30),
            //
            Text(
              "حدث خطأ",
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: .bold,
                color: Colors.black,
              ),
            ),
            //
            verticalSpace(16),
            //
            Text(
              "حدث خطأ أثناء تحميل الصفحة.\nبرجاء المحاولة لاحقاً",
              textAlign: .center,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: .bold,
                height: 1.5.h,
                color: AppColors.primaryColor,
              ),
            ),
            //
            if (onRetry != null) ...[
              verticalSpace(24),
              CustomButton(text: "إعادة المحاولة", onPressed: onRetry),
            ],
          ],
        ),
      ),
    );
  }
}
