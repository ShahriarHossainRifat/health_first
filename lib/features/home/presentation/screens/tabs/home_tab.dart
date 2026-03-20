import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health_first/features/home/presentation/widgets/community_section.dart';
import 'package:health_first/features/home/presentation/widgets/feeling_section.dart';
import 'package:health_first/features/home/presentation/widgets/upcoming_appointments_section.dart';
import 'package:health_first/features/home/presentation/widgets/wellness_score_section.dart';
import '../../widgets/custom_app_bar.dart';

class HomeTab extends StatelessWidget {
  final VoidCallback? onNotificationPressed;

  const HomeTab({super.key, this.onNotificationPressed});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D0D),
      appBar: CustomAppBar(onNotificationPressed: onNotificationPressed),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h), 
          child: Column(
            children: const [
              FeelingSection(),
              WellnessScoreSection(),
              UpcomingAppointmentsSection(),
              CommunitySection(),
            ],
          ),
        ),
      ),
    );
  }
}
