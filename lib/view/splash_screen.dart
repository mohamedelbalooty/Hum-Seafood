import 'dart:async';
import 'package:flutter/material.dart';
import 'onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  static String id = 'SplashScreen';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, OnboardingScreen.id);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Stack(
      children: <Widget>[
        Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/onboarding_images/splash.png'),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.red.withOpacity(0.85),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Image.asset(
              'assets/images/icons/logo.png',
              height: width * 0.7,
              width: width * 0.7,
            ),
          ),
        ),
      ],
    );
  }
}