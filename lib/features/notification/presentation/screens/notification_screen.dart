
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D0D),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0D0D0D),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Notifications',
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.h),
            _buildNotificationSection('Today', [
              _buildNotificationItem('14 FEB', 'Account Settings', 'Your password has been updated successfully.', '12:02 pm', true),
              _buildNotificationItem('14 FEB', 'Subscription', 'Your pro subscription is about to finish.', '12:02 pm', true),
              _buildNotificationItem('12 FEB', 'Bio-Feedback', 'You didn't measure your HRV for 3 days.', '3:25pm', true),
              _buildNotificationItem('11 FEB', 'Sleep Hypnosis', 'Measure your sleep time to get healthier.', '3:25pm', false),
            ]),
            SizedBox(height: 30.h),
            _buildNotificationSection('Yesterday', [
              _buildNotificationItem('14 FEB', 'Subscription', 'Your pro subscription is about to finish.', '12:02 pm', false),
              _buildNotificationItem('12 FEB', 'Bio-Feedback', 'You didn't measure your HRV for 3 days.', '3:25pm', false),
            ]),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationSection(String title, List<Widget> notifications) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 16.h),
        ...notifications,
      ],
    );
  }

  Widget _buildNotificationItem(String date, String title, String subtitle, String time, bool isNew) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: const Color(0xFF1A1A1A),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Row(
              children: [
                Column(
                  children: [
                    Text(
                      date.split(' ')[0],
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      date.split(' ')[1],
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        subtitle,
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),
                if (isNew)
                  Container(
                    width: 8.w,
                    height: 8.w,
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                  ),
              ],
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            time,
            style: TextStyle(
              fontSize: 12.sp,
              color: Colors.white70,
            ),
          ),
        ],
      ),
    );
  }
}
