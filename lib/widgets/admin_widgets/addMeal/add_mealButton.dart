import 'package:flutter/material.dart';
import 'package:humseafood/constants.dart';

Widget addMealButton(double height, double width, bool isPortrait, String title){
  return Container(
    height: isPortrait ? height * 0.1 : height * 0.15,
    width: width,
    margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [KSecondColor, Colors.orange.shade600],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
      borderRadius: BorderRadius.circular(15.0),
      border: Border.all(color: Colors.blueGrey, width: 1.0),
    ),
    child: Center(
      child: Text(
        title,
        style: TextStyle(
          color: KWhiteColor,
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}