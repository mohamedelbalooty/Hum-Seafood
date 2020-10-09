import 'package:humseafood/model/meal.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';
import '../provider/cart_item.dart';

void addMealInCart(context, Meal meal, int quantity) {
  CartItem cartItem = Provider.of<CartItem>(context, listen: false);
  meal.mealQuantity = quantity;
  bool exist = false;
  var mealsInCart = cartItem.meals;
  for (var mealCartItem in mealsInCart) {
    if (mealCartItem.mealName == meal.mealName) {
      exist = true;
    }
  }
  if (exist) {
    Toast.show("You\'ve add this item before", context,
        duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
  } else {
    cartItem.addItemToCart(meal);
    Toast.show("Added to cart", context,
        duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
  }
}
