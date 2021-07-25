import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutterfbauth/login_page.dart';
import 'package:flutterfbauth/models/Product.dart';

import 'package:flutterfbauth/services/authservice.dart';
import 'package:flutterfbauth/splash.dart';
import 'package:flutterfbauth/screens/shop_screen/widgets/exclusive_offers.dart';

List<CameraDescription> cameras;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  cameras = await availableCameras();
  ReadProductForExcluesive_offer();
  ReadProductForProduct();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: splashScreen(),
    );
  }
}
