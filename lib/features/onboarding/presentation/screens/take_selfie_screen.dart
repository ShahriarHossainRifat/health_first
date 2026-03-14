import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../main.dart';
import '../../../home/presentation/screens/home_screen.dart';

class TakeSelfieScreen extends StatefulWidget {
  const TakeSelfieScreen({super.key});

  @override
  State<TakeSelfieScreen> createState() => _TakeSelfieScreenState();
}

class _TakeSelfieScreenState extends State<TakeSelfieScreen> {
  late CameraController _controller;

  @override
  void initState() {
    super.initState();
    _controller = CameraController(cameras[0], ResolutionPreset.max);
    _controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            break;
          default:
            break;
        }
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_controller.value.isInitialized) {
      return Container();
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: const Icon(Icons.arrow_back_ios_new_rounded),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.flash_off_rounded),
          )
        ],
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: Stack(
          children: [
            SizedBox(
              height: Get.height,
              width: Get.width,
              child: CameraPreview(_controller),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 200,
                width: Get.width,
                color: Colors.black54,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text(
                      'Take a Selfie',
                      style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => const HomeScreen());
                      },
                      child: const CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.white,
                        child: Icon(Icons.camera_alt_rounded, size: 40, color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
