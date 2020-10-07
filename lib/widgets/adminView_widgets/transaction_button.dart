import 'package:flutter/material.dart';
import '../../constants.dart';

Widget transactionButton(IconData icon) {
  return Container(
    height: 30.0,
    width: 30.0,
    decoration: BoxDecoration(
      color: Colors.white.withOpacity(0.4),
      borderRadius: BorderRadius.circular(10.0),
    ),
    child: Center(
      child: Icon(
        icon,
        color: KWhiteColor,
      ),
    ),
  );
}
