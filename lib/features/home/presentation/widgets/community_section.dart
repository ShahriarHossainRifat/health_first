import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommunitySection extends StatelessWidget {
  const CommunitySection({super.key});

  @override
  Widget build(BuildContext context) {
    const formattedDate = 'Sun, 15 Mar';

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Community',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16.h),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(16.sp),
            decoration: BoxDecoration(
              color: const Color(0xFF2A2A2A),
              borderRadius: BorderRadius.circular(16.r),
              image: DecorationImage(
                image: const NetworkImage(
                    'https://picsum.photos/800/600'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.5),
                  BlendMode.darken,
                ),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'LIVE SESSION',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 12.sp,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  'Mental Wellness Circle',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  '$formattedDate • 45 min',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 14.sp,
                  ),
                ),
                SizedBox(height: 16.h),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24.r),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 12.h),
                  ),
                  child: const Text('Join Now'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
