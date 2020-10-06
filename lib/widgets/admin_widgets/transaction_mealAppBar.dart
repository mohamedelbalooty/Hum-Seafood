import 'package:flutter/material.dart';
import 'package:humseafood/constants.dart';

Widget transactionMealAppBar(context, String title, double height, isPortrait) {
  return Padding(
    padding: EdgeInsets.only(
      left: isPortrait ? 15.0 : 20.0,
      right: isPortrait ? 15.0 : 20.0,
      top: isPortrait ? height * 0.05 : height * 0.12,
      bottom: isPortrait ? 5.0 : 10.0,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: Icon(
              Icons.arrow_back,
              color: KWhiteColor,
            ),
          ),
        ),
        SizedBox(
          width: 20.0,
        ),
        Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 26.0,
          ),
        ),
        Expanded(
          child: SizedBox(),
        ),
        CircleAvatar(
          radius: 25.0,
          backgroundImage: AssetImage('assets/images/icons/admin.png'),
        ),
      ],
    ),
  );
}
