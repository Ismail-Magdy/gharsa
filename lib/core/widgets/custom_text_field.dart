import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gharsa/core/theming/app_colors.dart';
import 'package:gharsa/core/theming/app_fonts.dart';
import 'package:gharsa/core/theming/font_weight_helper.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    this.focusNode,
    this.hintText,
    this.labelText,
    this.validator,
    this.onChanged,
    this.isPassword = false,
    this.keyboardType,
    this.textInputAction,
    this.prefixIcon,
    this.suffixIcon,
    this.enabled = true,
    this.contentPadding,
    this.maxLines = 1,
    this.fillColor,
    this.borderRadius,
  });

  final TextEditingController controller;
  final FocusNode? focusNode;
  final String? hintText;
  final String? labelText;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final bool isPassword;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool enabled;
  final EdgeInsetsGeometry? contentPadding;
  final int maxLines;
  final Color? fillColor;
  final double? borderRadius;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _obscured;

  @override
  void initState() {
    super.initState();
    _obscured = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      focusNode: widget.focusNode,
      obscureText: _obscured,
      enabled: widget.enabled,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      maxLines: widget.isPassword ? 1 : widget.maxLines,
      onChanged: widget.onChanged,
      validator: widget.validator,
      style: TextStyle(
        fontFamily: AppFonts.cairo,
        fontSize: 14.sp,
        fontWeight: FontWeightHelper.regular,
        color: AppColors.black,
      ),
      decoration: InputDecoration(
        hintText: widget.hintText,
        labelText: widget.labelText,
        hintStyle: TextStyle(
          fontFamily: AppFonts.cairo,
          fontSize: 14.sp,
          fontWeight: FontWeightHelper.regular,
          color: AppColors.grey,
        ),
        filled: true,
        fillColor: widget.fillColor ?? AppColors.lightGrey,
        contentPadding: widget.contentPadding ??
            EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        border: _buildBorder(),
        enabledBorder: _buildBorder(),
        focusedBorder: _buildBorder(color: AppColors.primary),
        errorBorder: _buildBorder(color: AppColors.error),
        focusedErrorBorder: _buildBorder(color: AppColors.error),
        disabledBorder: _buildBorder(color: AppColors.grey),
        prefixIcon: widget.prefixIcon,
        suffixIcon:
            widget.isPassword ? _buildPasswordToggle() : widget.suffixIcon,
      ),
    );
  }

  OutlineInputBorder _buildBorder({Color? color}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(widget.borderRadius ?? 12.r),
      borderSide: BorderSide(
        color: color ?? AppColors.lightGrey,
        width: 1.0,
      ),
    );
  }

  Widget _buildPasswordToggle() {
    return IconButton(
      onPressed: () => setState(() => _obscured = !_obscured),
      icon: Icon(
        _obscured ? Icons.visibility_off_outlined : Icons.visibility_outlined,
        color: AppColors.grey,
        size: 22.r,
      ),
    );
  }
}
