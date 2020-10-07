import 'package:flutter/material.dart';
import '../../../../constants.dart';
import 'modifiedPopupMenuItem.dart';

PopupMenuEntry modifiedPopupMenuItemWidget(double width, Color first,
    Color second, String buttonName, Function onTap) {
  return ModifiedPopupMenuItem(
    child: Container(
      height: 40.0,
      width: width / 2,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color>[first, second],
        ),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Center(
        child: Text(
          buttonName,
          style: TextStyle(
            color: KWhiteColor,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
    onClick: onTap,
  );
}
