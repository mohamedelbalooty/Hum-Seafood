import 'package:flutter/cupertino.dart';

class Meal {
  String mealName, mealPrice, mealCategory, mealDescription, imageURL, mealId;

  Meal(
      {@required this.mealName,
      @required this.mealPrice,
      @required this.mealCategory,
      @required this.mealDescription,
      @required this.imageURL,
      @required this.mealId});
}
