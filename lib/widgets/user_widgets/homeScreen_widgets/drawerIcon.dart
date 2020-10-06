import 'package:flutter/material.dart';
import 'package:humseafood/constants.dart';

Widget drawerIcon(context){
  return Builder(
    builder: (context) => GestureDetector(
      onTap: () => Scaffold.of(context).openDrawer(),
      child: Padding(
        padding: EdgeInsets.only(left: 15.0),
        child: Icon(
          Icons.sort,
          size: 34.0,
          color: KWhiteColor,
        ),
      ),
    ),
  );
}