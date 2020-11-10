import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'login_screen.dart';

class OnboardingScreen extends StatefulWidget {
  static String id = 'OnboardingScreen';

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _selectedPageIndex = 0;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: isPortrait ? height * 0.7 : height * 1.5,
              child: PageView(
                controller: _pageController,
                onPageChanged: (int index) {
                  setState(() {
                    _selectedPageIndex = index;
                  });
                },
                children: _pages(height, width),
              ),
            ),
            Container(
              height: isPortrait ? height * 0.3 : height * 0.5,
              color: Colors.transparent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SmoothPageIndicator(
                      controller: _pageController,
                      count: 3,
                      axisDirection: Axis.horizontal,
                      effect: WormEffect(
                        spacing: 20.0,
                        dotHeight: 12.0,
                        dotWidth: 12.0,
                        activeDotColor: Colors.orange.shade700,
                      ),
                      onDotClicked: (index) {
                        _pageController.animateToPage(index,
                            duration: Duration(milliseconds: 400),
                            curve: Curves.easeInOut);
                      }),
                  GestureDetector(
                    onTap: () {
                      if (_selectedPageIndex < 2) {
                        setState(() {
                          _selectedPageIndex++;
                        });
                        _pageController.animateToPage(_selectedPageIndex++,
                            duration: Duration(milliseconds: 400),
                            curve: Curves.easeInOut);
                      } else {
                        Navigator.pushReplacementNamed(context, LoginScreen.id);
                      }
                    },
                    child: Container(
                      height: 45.0,
                      width: width - 20.0,
                      margin: EdgeInsets.symmetric(vertical: 35.0),
                      decoration: BoxDecoration(
                        color: Colors.orange.shade700,
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      child: Center(
                        child: Text(
                          _selectedPageIndex == 2 ? 'Done' : 'Next',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, LoginScreen.id);
                    },
                    child: Text(
                      'Skip',
                      style: TextStyle(
                        color: Colors.blueGrey.withOpacity(0.9),
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _pages(height, width) {
    List<Widget> pageViewItems = [];
    return pageViewItems = [
      _customPageViewItem(height, width,
          title: 'Food You Love', imageName: 'food'),
      _customPageViewItem(height, width,
          title: 'Delivered To You', imageName: 'deliver'),
      _customPageViewItem(height, width,
          title: 'To Your Location', imageName: 'location'),
    ];
  }

  Widget _customPageViewItem(double height, double width,
      {@required String title, @required String imageName}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: height * 0.2,
        ),
        Image.asset(
          'assets/images/onboarding_images/$imageName.png',
          height: width * 0.6,
          width: width * 0.6,
        ),
        Padding(
          padding: EdgeInsets.only(top: 20.0),
          child: Text(
            title,
            style: TextStyle(
              color: Colors.blueGrey.withOpacity(0.9),
              fontSize: 26.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
