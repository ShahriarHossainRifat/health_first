import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:animated_emoji/animated_emoji.dart';

class FeelingSection extends StatefulWidget {
  const FeelingSection({super.key});

  @override
  State<FeelingSection> createState() => _FeelingSectionState();
}

class _FeelingSectionState extends State<FeelingSection> {
  final List<Map<String, dynamic>> emojis = [
    {'emoji': AnimatedEmojis.smile, 'label': 'Great'},
    {'emoji': AnimatedEmojis.grin, 'label': 'Good'},
    {'emoji': AnimatedEmojis.neutralFace, 'label': 'Okay'},
    {'emoji': AnimatedEmojis.pensive, 'label': 'Sad'},
    {'emoji': AnimatedEmojis.angry, 'label': 'Angry'},
  ];

  int? selectedIndex;

  void _onTap(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'How are you feeling Today?',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(
              emojis.length,
              (index) => GestureDetector(
                onTap: () => _onTap(index),
                child: Column(
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      padding: EdgeInsets.all(selectedIndex == index ? 16.sp : 12.sp),
                      decoration: BoxDecoration(
                        color: selectedIndex == index
                            ? const Color(0xFF0057FF)
                            : const Color(0xFF2A2A2A),
                        shape: BoxShape.circle,
                      ),
                      child: AnimatedEmoji(
                        emojis[index]['emoji'],
                        size: selectedIndex == index ? 40.sp : 32.sp,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      emojis[index]['label'],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
