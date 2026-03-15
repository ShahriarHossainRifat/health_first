import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FeelingSection extends StatefulWidget {
  const FeelingSection({super.key});

  @override
  State<FeelingSection> createState() => _FeelingSectionState();
}

class _FeelingSectionState extends State<FeelingSection> {
  final List<Map<String, String>> emojis = [
    {'emoji': '😄', 'label': 'Great'},
    {'emoji': '😊', 'label': 'Good'},
    {'emoji': '😐', 'label': 'Okay'},
    {'emoji': '😢', 'label': 'Sad'},
    {'emoji': '😠', 'label': 'Angry'},
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
                    CircleAvatar(
                      radius: 30.r,
                      backgroundColor: selectedIndex == index
                          ? const Color(0xFF0057FF)
                          : const Color(0xFF2A2A2A),
                      child: Text(
                        emojis[index]['emoji']!,
                        style: TextStyle(fontSize: 32.sp),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      emojis[index]['label']!,
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
