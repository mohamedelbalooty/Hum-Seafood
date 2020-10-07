import 'package:flutter/material.dart';
import 'package:humseafood/screens/userView/cart_screen.dart';
import '../../../constants.dart';
import 'drawerIcon.dart';

Widget homeScreenAppBar(context){
  return AppBar(
    backgroundColor: KSecondColor,
    elevation: 0.0,
    title: Text(
      'Discover meals',
      style: TextStyle(
        fontSize: 24.0,
        color: KWhiteColor,
      ),
    ),
    centerTitle: true,
    leading: drawerIcon(context),
    actions: <Widget>[
      IconButton(
        onPressed: () {
          Navigator.pushNamed(context, CartScreen.id);
        },
        icon: Icon(
          Icons.shopping_cart,
          size: 28.0,
          color: KWhiteColor,
        ),
      ),
    ],
  );
}