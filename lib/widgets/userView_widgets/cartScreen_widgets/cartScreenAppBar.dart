import 'package:flutter/material.dart';
import '../../../constants.dart';

Widget cartScreenAppBar(context, bool isPortrait, double width) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0.0,
    centerTitle: true,
    title: Text(
      'My Cart',
      style: TextStyle(
        color: KSecondColor,
        fontSize: 26.0,
        fontWeight: FontWeight.bold,
      ),
    ),
    leading: Padding(
      padding: EdgeInsets.only(left: isPortrait ? width * 0.08 : width * 0.06),
      child: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.arrow_back,
          color: KWhiteColor,
          size: 28.0,
        ),
      ),
    ),
  );
}
