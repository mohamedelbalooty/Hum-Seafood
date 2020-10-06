import 'package:flutter/material.dart';
import '../constants.dart';

Widget customSnackBar(exception){
  return SnackBar(
    shape: OutlineInputBorder(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(0.0),
        bottomRight: Radius.circular(0.0),
        topLeft: Radius.circular(30.0),
        topRight: Radius.circular(30.0),
      ),
    ),
    content: Text(
      exception,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: KWhiteColor,
      ),
    ),
  );
}