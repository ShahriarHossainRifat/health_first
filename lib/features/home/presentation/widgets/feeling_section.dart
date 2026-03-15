import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FeelingSection extends StatefulWidget {
  const FeelingSection({super.key});

  @override
  State<FeelingSection> createState() => _FeelingSectionState();
}

class _FeelingSectionState extends State<FeelingSection> with TickerProviderStateMixin {
  final List<Map<String, dynamic>> emojis = [
    {'emoji': '😄', 'label': 'Great'},
    {'emoji': '😊', 'label': 'Good'},
    {'emoji': '😐', 'label': 'Okay'},
    {'emoji': '😢', 'label': 'Sad'},
    {'emoji': '😠', 'label': 'Angry'},
  ];

  int? selectedIndex;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _animation = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.elasticOut,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTap(int index) {
    setState(() {
      selectedIndex = index;
    });
    _controller.forward(from: 0.0);
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
                child: AnimatedBuilder(
                  animation: _animation,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: selectedIndex == index ? _animation.value : 1.0,
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(12.sp),
                            decoration: BoxDecoration(
                              color: selectedIndex == index
                                  ? const Color(0xFF0057FF)
                                  : const Color(0xFF2A2A2A),
                              borderRadius: BorderRadius.circular(16.r),
                            ),
                            child: Text(
                              emojis[index]['emoji'],
                              style: TextStyle(fontSize: 32.sp),
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
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
