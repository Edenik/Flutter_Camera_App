import 'package:camera/camera.dart';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_camera_screen/screens/camera_screen.dart';
import 'package:flutter_camera_screen/screens/home_screen.dart';

import 'screens/splash_screen.dart';

List<CameraDescription> cameras;

Future<Null> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    cameras = await availableCameras();
  } on CameraException catch (e) {
    //logError(e.code, e.description);
  }

  runApp(
    MaterialApp(
      title: "Camera App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
      routes: <String, WidgetBuilder>{
        'HOME_SCREEN': (BuildContext context) => HomeScreen(),
        'CAMERA_SCREEN': (BuildContext context) => CameraScreen(cameras),
      },
    ),
  );
}
