import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../constants.dart';

Widget authenticationButton(
    double width, double height, String title, Function onClick) {
  return GestureDetector(
    onTap: onClick,
    child: Center(
      child: Container(
        height: height,
        width: width * 0.42,
        margin: EdgeInsets.fromLTRB(25.0, 20.0, 25.0, 20.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          border: Border.all(
            color: KMainColor,
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 4),
              blurRadius: 3,
            ),
          ],
          color: KSecondColor,
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: KWhiteColor,
              fontSize: 20.0,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    ),
  );
}
