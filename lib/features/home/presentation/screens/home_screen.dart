import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/utils/constants/app_texts.dart';
import '../../../../core/utils/constants/colors.dart';
import '../../../../routes/app_routes.dart';
import '../../controllers/home_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());

    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => IndexedStack(
            index: controller.currentIndex.value,
            children: const [
              _DashboardTab(),
              _AppointmentsTab(),
              _ProfileTab(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.currentIndex.value,
          onTap: controller.changeTab,
          selectedItemColor: AppColors.primary,
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard_outlined),
              activeIcon: Icon(Icons.dashboard),
              label: AppText.dashboard,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today_outlined),
              activeIcon: Icon(Icons.calendar_today),
              label: AppText.appointments,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              activeIcon: Icon(Icons.person),
              label: AppText.profile,
            ),
          ],
        ),
      ),
    );
  }
}

class _DashboardTab extends StatelessWidget {
  const _DashboardTab();

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 24.h),
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Good Morning! 👋',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.textSecondary,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    'Stay Healthy Today',
                    style: TextStyle(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ],
              ),
              CircleAvatar(
                radius: 24.r,
                backgroundColor: AppColors.primary,
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 28.sp,
                ),
              ),
            ],
          ),
          SizedBox(height: 24.h),
          // Daily summary card
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20.w),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [AppColors.primary, Color(0xFF2E5B96)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Daily Health Summary',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 13.sp,
                  ),
                ),
                SizedBox(height: 8.h),
                Obx(
                  () => Text(
                    '${controller.steps.value} Steps',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 8.h),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.r),
                  child: LinearProgressIndicator(
                    value: 0.78,
                    backgroundColor: Colors.white30,
                    valueColor: const AlwaysStoppedAnimation<Color>(
                      AppColors.secondary,
                    ),
                    minHeight: 8.h,
                  ),
                ),
                SizedBox(height: 6.h),
                Text(
                  '78% of daily goal',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 12.sp,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 24.h),
          // Stats grid
          Text(
            "Today's Stats",
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          SizedBox(height: 12.h),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            crossAxisSpacing: 12.w,
            mainAxisSpacing: 12.h,
            childAspectRatio: 1.3,
            children: [
              Obx(
                () => _StatCard(
                  icon: Icons.local_fire_department,
                  label: 'Calories',
                  value: '${controller.calories.value} kcal',
                  color: Colors.orange,
                ),
              ),
              Obx(
                () => _StatCard(
                  icon: Icons.favorite,
                  label: 'Heart Rate',
                  value: '${controller.heartRate.value} bpm',
                  color: Colors.red,
                ),
              ),
              Obx(
                () => _StatCard(
                  icon: Icons.bedtime,
                  label: 'Sleep',
                  value: '${controller.sleepHours.value} hrs',
                  color: Colors.indigo,
                ),
              ),
              const _StatCard(
                icon: Icons.water_drop,
                label: 'Hydration',
                value: '1.8 / 2.5 L',
                color: Colors.blue,
              ),
            ],
          ),
          SizedBox(height: 24.h),
          // Upcoming appointments section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Upcoming Appointments',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              TextButton(
                onPressed: () => controller.changeTab(1),
                child: Text(
                  'See all',
                  style: TextStyle(
                    color: AppColors.primary,
                    fontSize: 13.sp,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Obx(
            () => Column(
              children: controller.appointments
                  .take(2)
                  .map((appt) => _AppointmentCard(appointment: appt))
                  .toList(),
            ),
          ),
          SizedBox(height: 24.h),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color color;

  const _StatCard({
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: color.withOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(icon, color: color, size: 28.sp),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                value,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              Text(
                label,
                style: TextStyle(
                  fontSize: 11.sp,
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _AppointmentCard extends StatelessWidget {
  final Map<String, String> appointment;

  const _AppointmentCard({required this.appointment});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 48.w,
            height: 48.w,
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Icon(
              Icons.local_hospital,
              color: AppColors.primary,
              size: 24.sp,
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  appointment['title'] ?? '',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp,
                    color: AppColors.textPrimary,
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  appointment['specialty'] ?? '',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                appointment['date'] ?? '',
                style: TextStyle(
                  fontSize: 11.sp,
                  color: AppColors.textSecondary,
                ),
              ),
              SizedBox(height: 4.h),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Text(
                  appointment['status'] ?? '',
                  style: TextStyle(
                    fontSize: 10.sp,
                    color: Colors.green,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _AppointmentsTab extends StatelessWidget {
  const _AppointmentsTab();

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 24.h),
          Text(
            AppText.appointments,
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          SizedBox(height: 16.h),
          Obx(
            () => Column(
              children: controller.appointments
                  .map((appt) => _AppointmentCard(appointment: appt))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProfileTab extends StatelessWidget {
  const _ProfileTab();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          SizedBox(height: 40.h),
          CircleAvatar(
            radius: 50.r,
            backgroundColor: AppColors.primary,
            child: Icon(
              Icons.person,
              color: Colors.white,
              size: 56.sp,
            ),
          ),
          SizedBox(height: 16.h),
          Text(
            'John Doe',
            style: TextStyle(
              fontSize: 22.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            'john.doe@example.com',
            style: TextStyle(
              fontSize: 14.sp,
              color: AppColors.textSecondary,
            ),
          ),
          SizedBox(height: 32.h),
          _ProfileOption(
            icon: Icons.person_outline,
            title: 'Personal Information',
            onTap: () {},
          ),
          _ProfileOption(
            icon: Icons.medical_information_outlined,
            title: 'Medical Records',
            onTap: () {},
          ),
          _ProfileOption(
            icon: Icons.notifications_outlined,
            title: 'Notifications',
            onTap: () {},
          ),
          _ProfileOption(
            icon: Icons.privacy_tip_outlined,
            title: 'Privacy & Security',
            onTap: () {},
          ),
          _ProfileOption(
            icon: Icons.help_outline,
            title: 'Help & Support',
            onTap: () {},
          ),
          SizedBox(height: 16.h),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: () => Get.offAllNamed(AppRoute.getLoginScreen()),
              icon: const Icon(Icons.logout, color: Colors.red),
              label: const Text(
                'Log Out',
                style: TextStyle(color: Colors.red),
              ),
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.red),
                padding: EdgeInsets.symmetric(vertical: 14.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14.r),
                ),
              ),
            ),
          ),
          SizedBox(height: 32.h),
        ],
      ),
    );
  }
}

class _ProfileOption extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const _ProfileOption({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        margin: EdgeInsets.only(bottom: 8.h),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        decoration: BoxDecoration(
          color: Colors.grey.shade50,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Row(
          children: [
            Icon(icon, color: AppColors.primary, size: 22.sp),
            SizedBox(width: 12.w),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.textPrimary,
                ),
              ),
            ),
            Icon(Icons.arrow_forward_ios, size: 14.sp, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
