import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health_first/features/home/presentation/widgets/community_section.dart';
import 'package:health_first/features/home/presentation/widgets/feeling_section.dart';
import 'package:health_first/features/home/presentation/widgets/greeting_section.dart';
import 'package:health_first/features/home/presentation/widgets/upcoming_appointments_section.dart';
import 'package:health_first/features/home/presentation/widgets/wellness_score_section.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D0D),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h), 
            child: Column(
              children: [
                const GreetingSection(),
                const FeelingSection(),
                const WellnessScoreSection(),
                const UpcomingAppointmentsSection(),
                const CommunitySection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
