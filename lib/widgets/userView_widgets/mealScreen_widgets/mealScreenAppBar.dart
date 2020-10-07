import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:humseafood/screens/userView/cart_screen.dart';
import '../../../constants.dart';

Widget mealScreenAppBar(context, String mealName) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0.0,
    centerTitle: true,
    automaticallyImplyLeading: true,
    title: Text(
      mealName,
      softWrap: false,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        color: KWhiteColor,
        fontSize: 24.0,
        height: 2.0,
      ),
    ),
    actions: <Widget>[
      IconButton(
        onPressed: () {
          Navigator.pushNamed(context, CartScreen.id);
        },
        icon: Icon(
          Icons.shopping_cart,
          size: 25.0,
          color: KWhiteColor,
        ),
      ),
    ],
  );
}
