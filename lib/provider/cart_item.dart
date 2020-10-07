import 'package:flutter/cupertino.dart';
import 'package:humseafood/model/meal.dart';

class CartItem extends ChangeNotifier{
  List<Meal> meals = [];
  addItemToCart(Meal meal){
    meals.add(meal);
    notifyListeners();
  }
}