import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ActivityForm extends StatefulWidget {
  final VoidCallback onFinish;

  const ActivityForm({super.key, required this.onFinish});

  @override
  State<ActivityForm> createState() => _ActivityFormState();
}

class _ActivityFormState extends State<ActivityForm> {
  String? _selectedActivity;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 30.h),
          Text(
            'Activity',
            style: TextStyle(
              fontSize: 28.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 30.h),
          Text(
            'Select your preferred sports.',
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.white70,
            ),
          ),
          SizedBox(height: 16.h),
          Wrap(
            spacing: 16.w,
            runSpacing: 12.h,
            children: [
              _buildActivityChip('Yoga'),
              _buildActivityChip('Running'),
              _buildActivityChip('Gym'),
              _buildActivityChip('Cricket'),
              _buildActivityChip('Swimming'),
              _buildActivityChip('Cycling'),
              _buildActivityChip('Tennis'),
              _buildActivityChip('Football'),
              _buildActivityChip('Chess'),
              _buildActivityChip('Volleyball'),
            ],
          ),
          SizedBox(height: 20.h),
          Text(
            'Others:',
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.white70,
            ),
          ),
          SizedBox(height: 8.h),
          TextFormField(
            decoration: InputDecoration(
              hintText: 'Write here...',
              hintStyle: TextStyle(color: Colors.white38),
              filled: true,
              fillColor: const Color(0xFF1A1A1A),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide.none,
              ),
            ),
            style: TextStyle(color: Colors.white),
            maxLines: 3,
          ),
          SizedBox(height: 40.h),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: widget.onFinish,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF0057FF),
                padding: EdgeInsets.symmetric(vertical: 16.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
              child: Text(
                'Finish',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActivityChip(String label) {
    final isSelected = _selectedActivity == label;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedActivity = label;
        });
      },
      child: Chip(
        label: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.white70,
          ),
        ),
        backgroundColor:
            isSelected ? const Color(0xFF0057FF) : const Color(0xFF1A1A1A),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),
          side: BorderSide.none,
        ),
      ),
    );
  }
}
