import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget navigatorToSignUp(context, String title, String buttonName, String screen){
  return Padding(
    padding: EdgeInsets.only(bottom: 10.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(title, style: TextStyle(
          color: Colors.black54,
          fontSize: 16.0,
        ),),
        SizedBox(width: 4.0,),
        GestureDetector(
          onTap: (){
            Navigator.pushNamed(context, screen);
          },
          child: Text(buttonName, style: TextStyle(
            color: Colors.indigo,
            fontSize: 16.0,
          ),),
        ),
      ],
    ),
  );
}