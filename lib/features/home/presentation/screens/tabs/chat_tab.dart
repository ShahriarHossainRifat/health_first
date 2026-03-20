import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health_first/features/home/presentation/widgets/greeting_section.dart';

class ChatTab extends StatelessWidget {
  const ChatTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D0D),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const GreetingSection(),
            SizedBox(height: 24.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Your Assistant',
                    style: TextStyle(
                      color: Color(0xFF9E9E9E), // Used const value
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  const Text(
                    'Veda',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.h),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                children: [
                  ActionButton(text: 'Scan Meal', onPressed: () {}),
                  SizedBox(width: 12.w),
                  ActionButton(
                      text: 'Check-in', onPressed: () {}, isPrimary: true),
                  SizedBox(width: 12.w),
                  ActionButton(text: 'Book Appointment', onPressed: () {}),
                ],
              ),
            ),
            SizedBox(height: 24.h),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: ListView(
                  children: [
                    ChatMessage(
                      text:
                          'Hello Suraj. How can I help you today? Remember: seek medical advice with GPs.',
                      isUser: false,
                    ),
                    ChatMessage(
                      text: 'How are you feeling today?',
                      isUser: true,
                    ),
                    ChatMessage(
                      text:
                          'I\'m here to listen. Would you like to try a breathing exercise?',
                      isUser: false,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.w),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF27272A),
                      borderRadius: BorderRadius.circular(12.w),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.add, color: Colors.white),
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: TextField(
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: 'How can I help?',
                        hintStyle: const TextStyle(color: Color(0xFF9E9E9E)), // Used const value
                        filled: true,
                        fillColor: const Color(0xFF27272A),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.w),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 16.h, horizontal: 16.w),
                        suffixIcon: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.mic_none, color: Color(0xFF9E9E9E)), // Used const value
                            SizedBox(width: 8.w),
                            const Icon(Icons.send, color: Color(0xFF3B82F6)),
                            SizedBox(width: 12.w),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ActionButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isPrimary;

  const ActionButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isPrimary = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor:
            isPrimary ? const Color(0xFF3B82F6) : const Color(0xFF27272A),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.w),
        ),
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 20.w),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 14,
        ),
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  final String text;
  final bool isUser;

  const ChatMessage({
    super.key,
    required this.text,
    required this.isUser,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        constraints:
            BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.7),
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
        margin: EdgeInsets.symmetric(vertical: 4.h),
        decoration: BoxDecoration(
          color: isUser ? const Color(0xFF3B82F6) : const Color(0xFF27272A),
          borderRadius: BorderRadius.circular(12.w),
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
