import 'package:flutter/cupertino.dart';
import '../constants.dart';

class MealCategoryName extends ChangeNotifier{
  String mealCategory = KSoupCategory;
  categoryChanging(String currentCategory){
    mealCategory = currentCategory;
    notifyListeners();
  }
}