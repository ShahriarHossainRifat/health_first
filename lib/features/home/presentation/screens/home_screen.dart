import 'package:flutter/material.dart';
import 'package:health_first/features/home/presentation/screens/tabs/appointment_tab.dart';
import 'package:health_first/features/home/presentation/screens/tabs/chat_tab.dart';

import 'tabs/home_tab.dart';
import '../widgets/custom_bottom_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final List<Widget> _tabs = [
    const HomeTab(),
    const Scaffold(body: Center(child: Text("Mental"))),
    const Scaffold(body: Center(child: Text("Community"))),
    const AppointmentTab(),
    const ChatTab(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D0D),
      body: IndexedStack(
        index: _currentIndex,
        children: _tabs,
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onTap: onTabTapped,
      ),
    );
  }
}
