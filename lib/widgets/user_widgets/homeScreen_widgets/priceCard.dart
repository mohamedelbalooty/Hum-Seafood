import 'package:flutter/material.dart';
import 'package:humseafood/constants.dart';


class BackgroundClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(size.width / 2, size.height);
    path.lineTo(size.width, 0.0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

Widget customPriceCard(String price) {
  return Padding(
    padding: EdgeInsets.only(top: 10.0),
    child: Column(
      children: <Widget>[
        Container(
          height: 50.0,
          width: 60.0,
          color: KSecondColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                price,
                style: TextStyle(
                  color: KWhiteColor,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,

                ),
              ),
              Text(
                'L.E',
                style: TextStyle(
                    color: KWhiteColor,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    height: 0.8
                ),
              ),
            ],
          ),
        ),
        ClipPath(
          clipper: BackgroundClipper(),
          child: Container(
            height: 20.0,
            width: 60.0,
            color: KSecondColor,
          ),
        ),
      ],
    ),
  );
}

