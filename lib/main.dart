import 'package:camera/camera.dart';
import 'package:health_first/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

late List<CameraDescription> cameras;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if(!kIsWeb) {
 cameras = await availableCameras();
  }
  runApp(const MyApp());
}
