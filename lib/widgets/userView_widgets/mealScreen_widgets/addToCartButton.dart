import 'package:flutter/material.dart';
import 'package:humseafood/model/meal.dart';
import 'package:humseafood/provider/cart_item.dart';
import 'package:provider/provider.dart';
import '../../../constants.dart';
import 'package:toast/toast.dart';

Widget addToCartButton(context, double height, double width, bool isPortrait,
    {@required Meal meal, @required int quantity}) {
  return InkWell(
    onTap: () {
      CartItem cartItem = Provider.of<CartItem>(context, listen: false);
      meal.mealQuantity = quantity;
      cartItem.addItemToCart(meal);
      Toast.show("Added to cart", context,
          duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
    },
    child: Container(
      height: isPortrait ? height * 0.08 : height * 0.14,
      width: width,
      margin: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 15.0),
      decoration: BoxDecoration(
        color: KSecondColor,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(4, 4),
            blurRadius: 2.0,
          ),
        ],
      ),
      child: Center(
        child: Text(
          'Add To Cart',
          style: TextStyle(
            color: KWhiteColor,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
  );
}
