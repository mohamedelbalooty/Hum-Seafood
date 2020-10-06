import 'package:flutter/material.dart';

Widget addMealBackground(double height, double width, isPortrait){
  return Container(
    height: isPortrait ? height * 0.35 : height * 0.6,
    width: width,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.only(
        bottomRight: Radius.circular(15.0),
        bottomLeft: Radius.circular(15.0),
      ),
      gradient: LinearGradient(
        colors: [Colors.deepOrange, Colors.orange.shade600],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
    ),
  );
}