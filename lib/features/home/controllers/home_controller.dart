import 'package:get/get.dart';

class HomeController extends GetxController {
  var currentIndex = 0.obs;

  // Health stats
  var steps = 7842.obs;
  var calories = 1240.obs;
  var heartRate = 72.obs;
  var sleepHours = 7.5.obs;

  // Appointments
  var appointments = <Map<String, String>>[].obs;

  @override
  void onInit() {
    super.onInit();
    _loadAppointments();
  }

  void _loadAppointments() {
    appointments.assignAll([
      {
        'title': 'Dr. Sarah Johnson',
        'specialty': 'Cardiologist',
        'date': 'Today, 3:00 PM',
        'status': 'Upcoming',
      },
      {
        'title': 'Dr. Michael Lee',
        'specialty': 'General Practitioner',
        'date': 'Tomorrow, 10:30 AM',
        'status': 'Upcoming',
      },
      {
        'title': 'Dr. Emily Chen',
        'specialty': 'Nutritionist',
        'date': 'Mar 20, 2:00 PM',
        'status': 'Scheduled',
      },
    ]);
  }

  void changeTab(int index) {
    currentIndex.value = index;
  }
}
