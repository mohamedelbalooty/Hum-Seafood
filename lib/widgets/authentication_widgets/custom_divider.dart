import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../constants.dart';

Widget customDivider() {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 25.0),
    child: Row(
      children: <Widget>[
        Expanded(
          child: Container(
            height: 1.0,
            margin: EdgeInsets.only(right: 5.0),
            color: KBlackColor,
          ),
        ),
        Text(
          'OR',
          style: TextStyle(
            color: Colors.black54,
            fontSize: 22.0,
            // fontWeight: FontWeight.bold,
          ),
        ),
        Expanded(
          child: Container(
            height: 1.0,
            margin: EdgeInsets.only(left: 5.0),
            color: KBlackColor,
          ),
        ),
      ],
    ),
  );
}
