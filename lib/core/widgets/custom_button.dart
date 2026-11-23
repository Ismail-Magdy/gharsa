import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:gharsa/core/theming/app_colors.dart";

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.width,
    this.height,
    this.color,
    this.textColor,
    this.borderRadius,
    this.isLoading = false,
  });

  final String text;
  final VoidCallback? onPressed;

  /// Minimum width. Full width when null.
  final double? width;

  /// Button height. Default height when null.
  final double? height;
  final Color? color;
  final Color? textColor;
  final double? borderRadius;

  /// Shows a small indicator and disables the button while true.
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final buttonColor = color ?? AppColors.primaryColor;

    return MaterialButton(
      onPressed: isLoading ? null : onPressed,
      minWidth: width ?? .infinity,
      height: height ?? 50.h,
      color: buttonColor,
      disabledColor: buttonColor.withValues(alpha: 0.6),
      elevation: 0,
      highlightElevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: .circular(borderRadius ?? 14.r),
      ),
      child: isLoading
          ? const CupertinoActivityIndicator(color: Colors.white)
          : Text(
              text,
              style: TextStyle(
                color: textColor ?? AppColors.white,
                fontSize: 16.sp,
                fontWeight: .bold,
              ),
            ),
    );
  }
}
