import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/constants/colors.dart';

/// Returns a consistent [InputDecoration] for all auth screens.
InputDecoration authInputDecoration({
  required String hint,
  required IconData prefixIcon,
  Widget? suffixIcon,
}) {
  return InputDecoration(
    hintText: hint,
    hintStyle: const TextStyle(color: AppColors.textSecondary),
    prefixIcon: Icon(prefixIcon, color: AppColors.textSecondary),
    suffixIcon: suffixIcon,
    filled: true,
    fillColor: AppColors.primaryBackground,
    contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.r),
      borderSide: const BorderSide(color: AppColors.inputBorder),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.r),
      borderSide: const BorderSide(color: AppColors.inputBorder),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.r),
      borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.r),
      borderSide: const BorderSide(color: AppColors.error),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.r),
      borderSide: const BorderSide(color: AppColors.error, width: 1.5),
    ),
  );
}

/// A small label placed above each form field.
class AuthFieldLabel extends StatelessWidget {
  final String text;
  const AuthFieldLabel(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 13.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
      ),
    );
  }
}

/// Full-width primary action button used on all auth screens.
class AuthPrimaryButton extends StatelessWidget {
  final String label;
  final bool isLoading;
  final VoidCallback? onPressed;

  const AuthPrimaryButton({
    super.key,
    required this.label,
    required this.isLoading,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 52.h,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          disabledBackgroundColor: AppColors.primary.withOpacity(0.6),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14.r),
          ),
        ),
        child: isLoading
            ? SizedBox(
                height: 22.h,
                width: 22.h,
                child: const CircularProgressIndicator(
                  strokeWidth: 2.5,
                  color: Colors.white,
                ),
              )
            : Text(
                label,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
      ),
    );
  }
}

/// Gradient header used on all auth screens.
class AuthHeader extends StatelessWidget {
  final Widget child;
  const AuthHeader({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: AppColors.primaryGradient,
      ),
      child: SafeArea(
        bottom: false,
        child: child,
      ),
    );
  }
}
