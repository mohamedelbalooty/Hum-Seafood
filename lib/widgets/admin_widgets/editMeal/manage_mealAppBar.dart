import 'package:flutter/material.dart';
import '../../../constants.dart';

Widget manageMealAppBar() {
  return AppBar(
    elevation: 15.0,
    title: Text(
      'Manage MeaL',
      style: TextStyle(
        fontSize: 22.0,
        fontWeight: FontWeight.w500,
        color: KWhiteColor,
      ),
    ),
    automaticallyImplyLeading: true,
    flexibleSpace: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.redAccent, Colors.orange],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
    ),
  );
}