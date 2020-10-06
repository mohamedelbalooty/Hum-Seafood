import 'package:flutter/material.dart';

import '../constants.dart';

Widget snapshotErrorMessage(double width, snapshot){
  return Container(
    height: 50.0,
    width: width * 0.6,
    decoration: BoxDecoration(
      color: Colors.grey.shade300,
      borderRadius: BorderRadius.circular(25.0),
      border: Border.all(color: KBlackColor, width: 0.5),
    ),
    child: Center(
      child: Text(
        snapshot.error.toString(),
        style: TextStyle(
          color: KBlackColor,
          fontSize: 18.0,
        ),
      ),
    ),
  );
}