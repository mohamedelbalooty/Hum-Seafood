import 'package:flutter/material.dart';
import '../../constants.dart';

Widget adminPanelButton(context, double height, double width, bool isPortrait ,Color first, Color second,
    String title, String screen, IconData icon) {
  return GestureDetector(
    onTap: () {
      Navigator.pushNamed(context, screen);
    },
    child: Container(
      height: isPortrait ? height * 0.1 : height * 0.2,
      width: isPortrait ? width * 0.7 : width * 0.5,
      margin: EdgeInsets.symmetric(vertical: 10.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color>[first, second],
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            height: height > 360.0 ? height * 0.1 : height * 0.2,
            width: height > 360.0 ? width * 0.2 : width * 0.15,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.3),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Icon(
              icon,
              size: 33.0,
              color: KWhiteColor,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: width * 0.1),
            child: Text(
              title,
              style: TextStyle(
                color: KWhiteColor,
                fontSize: 22.0,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
