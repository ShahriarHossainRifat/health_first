import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onNotificationPressed;

  const CustomAppBar({super.key, this.onNotificationPressed});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFF0D0D0D),
      elevation: 0,
      leading: const Padding(
        padding: EdgeInsets.all(8.0),
        child: CircleAvatar(
          backgroundImage: NetworkImage(
              'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'),
        ),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text('Hi Suraj', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          Text('Welcome!', style: TextStyle(color: Colors.grey, fontSize: 12)),
        ],
      ),
      actions: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.qr_code_scanner, color: Colors.white)),
        IconButton(onPressed: onNotificationPressed, icon: const Icon(Icons.notifications_none, color: Colors.white)),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
