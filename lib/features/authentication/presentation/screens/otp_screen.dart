import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:health_first/routes/app_routes.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String source = Get.arguments as String? ?? 'signup'; // default to signup

    return Scaffold(
      backgroundColor: const Color(0xFF0D0D0D),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Get.back(),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30.h),
            Text(
              'OTP Verification',
              style: TextStyle(
                fontSize: 28.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              'We have sent you a 4 digit OTP code, please check your email & verify.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.white70,
              ),
            ),
            SizedBox(height: 40.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildOTPBox(),
                _buildOTPBox(),
                _buildOTPBox(),
                _buildOTPBox(),
              ],
            ),
            SizedBox(height: 40.h),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (source == 'login') {
                    Get.offAllNamed(AppRoute.homeScreen);
                  } else {
                    if (kIsWeb) {
                      Get.toNamed(AppRoute.onboardingScreen);
                    } else {
                      Get.toNamed(AppRoute.takeSelfieScreen);
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0057FF),
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14.r),
                  ),
                ),
                child: Text(
                  'Verify',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 24.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Didn't receive the OTP? ",
                  style: TextStyle(color: Colors.white70),
                ),
                GestureDetector(
                  onTap: () {},
                  child: const Text(
                    'Resend OTP',
                    style: TextStyle(
                      color: Color(0xFF0057FF),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOTPBox() {
    return SizedBox(
      width: 60.w,
      height: 60.w,
      child: TextFormField(
        onChanged: (value) {
          if (value.length == 1) {
            Get.focusScope?.nextFocus();
          }
        },
        onSaved: (pin) {},
        style: const TextStyle(color: Colors.white, fontSize: 22),
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color(0xFF1A1A1A),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
