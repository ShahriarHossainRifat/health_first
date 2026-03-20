import 'package:flutter/material.dart';
import 'package:health_first/features/home/presentation/screens/notifications_screen.dart';
import 'package:health_first/features/home/presentation/screens/tabs/appointment_tab.dart';
import 'package:health_first/features/home/presentation/screens/tabs/chat_tab.dart';
import 'package:health_first/features/home/presentation/screens/tabs/community_tab.dart';
import 'package:health_first/features/home/presentation/screens/tabs/mental_tab.dart';

import 'tabs/home_tab.dart';
import '../widgets/custom_bottom_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _navigateToNotifications() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const NotificationsScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> tabs = [
      HomeTab(onNotificationPressed: _navigateToNotifications),
      MentalTab(onNotificationPressed: _navigateToNotifications),
      const CommunityTab(),
      AppointmentTab(onNotificationPressed: _navigateToNotifications),
      ChatTab(onNotificationPressed: _navigateToNotifications),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF0D0D0D),
      body: IndexedStack(
        index: _currentIndex,
        children: tabs,
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onTap: onTabTapped,
      ),
    );
  }
}
