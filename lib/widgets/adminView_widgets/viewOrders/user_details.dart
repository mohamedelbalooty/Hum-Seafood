import 'package:flutter/material.dart';
import 'package:humseafood/constants.dart';

Widget userDetails(IconData icon, String title){
  return Padding(
    padding: EdgeInsets.only(top: 10.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          size: 25.0,
          color: KSecondColor,
        ),
        SizedBox(width: 15.0,),
        Expanded(
          child: Text(
            title,
            softWrap: true,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: KGreyColor,
              fontSize: 16.0,
              height: 1.5
            ),
            maxLines: 2,
          ),
        ),
      ],
    ),
  );
}