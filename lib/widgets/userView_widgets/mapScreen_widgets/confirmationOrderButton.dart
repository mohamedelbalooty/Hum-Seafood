import 'package:flutter/material.dart';
import '../../../constants.dart';

Widget confirmationOrderButton(
    bool isPortrait, double height, double width, Function onClick) {
  return InkWell(
    onTap: onClick,
    child: Container(
      height: isPortrait ? height * 0.09 : height * 0.1,
      width: width,
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      decoration: BoxDecoration(
        color: KSecondColor,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(2, 3),
            blurRadius: 2.0,
          ),
          BoxShadow(
            color: Colors.black26,
            offset: Offset(-2, -1),
            blurRadius: 2.0,
          ),
        ],
      ),
      child: Center(
        child: Text(
          'Confirm Order',
          style: TextStyle(
              color: KWhiteColor, fontSize: 22.0, fontWeight: FontWeight.bold),
        ),
      ),
    ),
  );
}
