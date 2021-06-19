import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutterfbauth/services/authservice.dart';
import 'package:splashscreen/splashscreen.dart';

import 'login_page.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({key}) : super(key: key);

  @override
  _splashScreenState createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  final Widget logoyodeasvg = SvgPicture.asset(
    "assets/logo.svg",
    semanticsLabel: 'Logo',
  );
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 2,
      navigateAfterSeconds: AuthService().handleAuth(),
      title: Text(
        "YODEA IS MY LIFE",
        textAlign: TextAlign.center,
      ),
      image: Image.asset("assets/YODEA.gif"),
      backgroundColor: Colors.white,
      styleTextUnderTheLoader: TextStyle(color: Colors.deepPurple),
      photoSize: 100.0,
    );
  }
}
