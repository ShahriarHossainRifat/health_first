
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health_first/features/home/presentation/widgets/greeting_section.dart';

class Appointment {
  final String date;
  final String month;
  final String type;
  final String doctorName;
  final String doctorSpecialty;
  final String time;
  final bool isVideoCall;

  Appointment({
    required this.date,
    required this.month,
    required this.type,
    required this.doctorName,
    required this.doctorSpecialty,
    required this.time,
    this.isVideoCall = false,
  });
}

final List<Appointment> upcomingAppointments = [
  Appointment(date: '02', month: 'FEB', type: 'Video Call', doctorName: 'Dr. Sarah Smith', doctorSpecialty: 'General Practitioner', time: '10:00 AM', isVideoCall: true),
  Appointment(date: '14', month: 'FEB', type: 'Video Call', doctorName: 'Dr. Sarah Smith', doctorSpecialty: 'General Practitioner', time: '11:00 AM', isVideoCall: true),
  Appointment(date: '28', month: 'FEB', type: 'In-Person', doctorName: 'Dr. Theresa Webb', doctorSpecialty: 'General Practitioner', time: '02:00 PM'),
  Appointment(date: '09', month: 'MAR', type: 'In-Person', doctorName: 'Dr. Theresa Webb', doctorSpecialty: 'General Practitioner', time: '05:00 PM'),
  Appointment(date: '15', month: 'MAR', type: 'In-Person', doctorName: 'Dr. Theresa Webb', doctorSpecialty: 'General Practitioner', time: '10:00 AM'),
];

class AppointmentTab extends StatelessWidget {
  const AppointmentTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D0D),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const GreetingSection(),
                SizedBox(height: 24.h),
                const BookNewAppointmentButton(),
                SizedBox(height: 24.h),
                const UpcomingAppointmentsList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BookNewAppointmentButton extends StatelessWidget {
  const BookNewAppointmentButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF3B82F6),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 20.w),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Book New Appointment',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Icon(Icons.add, color: Colors.white),
        ],
      ),
    );
  }
}

class UpcomingAppointmentsList extends StatelessWidget {
  const UpcomingAppointmentsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Upcoming',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 16.h),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: upcomingAppointments.length,
          separatorBuilder: (context, index) => SizedBox(height: 12.h),
          itemBuilder: (context, index) {
            final appointment = upcomingAppointments[index];
            return AppointmentCard(appointment: appointment);
          },
        ),
      ],
    );
  }
}

class AppointmentCard extends StatelessWidget {
  final Appointment appointment;
  const AppointmentCard({super.key, required this.appointment});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: const Color(0xFF27272A),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
            decoration: BoxDecoration(
              color: const Color(0xFF3F3F46),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Column(
              children: [
                Text(
                  appointment.date,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  appointment.month,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 16.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 8.w,
                    height: 8.h,
                    decoration: BoxDecoration(
                      color: appointment.isVideoCall ? const Color(0xFF3B82F6) : const Color(0xFF10B981),
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    appointment.type,
                    style: TextStyle(
                      fontSize: 14,
                      color: appointment.isVideoCall ? const Color(0xFF3B82F6) : const Color(0xFF10B981),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 4.h),
              Text(
                appointment.doctorName,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 4.h),
              Row(
                children: [
                  Text(
                    appointment.doctorSpecialty,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[400],
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Icon(Icons.circle, size: 4, color: Colors.grey[400]),
                  SizedBox(width: 8.w),
                  Text(
                    appointment.time,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[400],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
