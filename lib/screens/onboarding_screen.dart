import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:gradient_text/gradient_text.dart';
import '../constants.dart';
import 'login_screen.dart';

// ignore: must_be_immutable
class OnboardingScreen extends StatelessWidget {
  static String id = 'OnboardingScreen';
  List<PageViewModel> pages = [
    _pageViewItem(
        "Title of first page",
        "Here you can write the description of the page, to explain someting...",
        'menu'),
    _pageViewItem(
        "Title of first page",
        "Here you can write the description of the page, to explain someting...",
        'service'),
    _pageViewItem(
        "Title of first page",
        "Here you can write the description of the page, to explain someting...",
        'payment'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        pages: pages,
        onDone: () {
          Navigator.pushReplacementNamed(context, LoginScreen.id);
        },
        onSkip: () {
          Navigator.pushReplacementNamed(context, LoginScreen.id);
        },
        showSkipButton: true,
        skip: Icon(
          Icons.skip_next,
          size: 30.0,
          color: Colors.black54,
        ),
        next: Icon(
          Icons.arrow_forward,
          size: 26.0,
          color: Colors.black54,
        ),
        done: Text(
            'Done',
            style: TextStyle(
              color: KSecondColor,
              fontSize: 17.0,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center),
        dotsDecorator: DotsDecorator(
          size: Size.square(10.0),
          activeSize: Size(20.0, 10.0),
          activeColor: KSecondColor,
          color: Colors.black26,
          spacing: EdgeInsets.symmetric(horizontal: 3.0),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
        ),
      ),
    );
  }

  static _pageViewItem(String title, String content, String imageName) {
    return PageViewModel(
      // title: title,
      titleWidget: GradientText(title,
          gradient: LinearGradient(
            colors: [Colors.deepOrange, Colors.orange.shade600],
          ),
          style: TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center),
      body: content,
      image: Center(
        child: Image.asset(
          'assets/images/onboarding_images/$imageName.png',
          height: 200.0,
          width: 200.0,
        ),
      ),
      decoration: PageDecoration(
        pageColor: KWhiteColor,
        bodyTextStyle: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 20.0,
          letterSpacing: 0.8,
        ),
      ),
    );
  }
}
