import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LetsStartForm extends StatelessWidget {
  final VoidCallback onNext;

  const LetsStartForm({super.key, required this.onNext});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 30.h),
          Text(
            'Let\'s start',
            style: TextStyle(
              fontSize: 28.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            'We need a few details to personalize your Vitalyze experience',
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.white70,
            ),
          ),
          SizedBox(height: 30.h),
          Text(
            'First Name:',
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.white70,
            ),
          ),
          SizedBox(height: 8.h),
          TextFormField(
            decoration: InputDecoration(
              hintText: 'e.g. Suraj',
              hintStyle: TextStyle(color: Colors.white38),
              filled: true,
              fillColor: const Color(0xFF1A1A1A),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide.none,
              ),
            ),
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(height: 20.h),
          Text(
            'Family Name:',
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.white70,
            ),
          ),
          SizedBox(height: 8.h),
          TextFormField(
            decoration: InputDecoration(
              hintText: 'e.g. Ashray',
              hintStyle: TextStyle(color: Colors.white38),
              filled: true,
              fillColor: const Color(0xFF1A1A1A),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide.none,
              ),
            ),
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(height: 40.h),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: onNext,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF0057FF),
                padding: EdgeInsets.symmetric(vertical: 16.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
              child: Text(
                'Next',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
