import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gharsa/core/theming/app_colors.dart';
import 'package:gharsa/core/theming/app_fonts.dart';
import 'package:gharsa/core/theming/font_weight_helper.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.isEnabled = true,
    this.backgroundColor,
    this.textColor,
    this.borderRadius,
    this.height,
    this.width,
    this.textStyle,
    this.borderColor,
    this.borderWidth,
  });

  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final bool isEnabled;
  final Color? backgroundColor;
  final Color? textColor;
  final double? borderRadius;
  final double? height;
  final double? width;
  final TextStyle? textStyle;
  final Color? borderColor;
  final double? borderWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 52.h,
      width: width ?? .infinity,
      child: TextButton(
        onPressed: isLoading || !isEnabled ? null : onPressed,
        style: TextButton.styleFrom(
          backgroundColor: isEnabled
              ? (backgroundColor ?? AppColors.primary)
              : AppColors.grey,
          shape: RoundedRectangleBorder(
            borderRadius: .circular(borderRadius ?? 16.r),
            side: borderColor != null
                ? BorderSide(color: borderColor!, width: borderWidth ?? 1)
                : .none,
          ),
        ),
        child: isLoading
            ? const CupertinoActivityIndicator(color: AppColors.white)
            : Text(
                text,
                style:
                    textStyle ??
                    TextStyle(
                      fontFamily: AppFonts.cairo,
                      fontSize: 16.sp,
                      fontWeight: FontWeightHelper.semiBold,
                      color: textColor ?? AppColors.white,
                    ),
              ),
      ),
    );
  }
}
