import 'package:flutter/material.dart';
import 'package:humseafood/model/meal.dart';
import 'package:humseafood/provider/cart_item.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {

  static String id = 'CartScreen';
  @override
  Widget build(BuildContext context) {
    List<Meal> _meals = Provider.of<CartItem>(context).meals;
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: _meals.length,
        itemBuilder: (context, index){
          return Text(_meals[index].mealName);
        },
      ),
    );
  }
}
