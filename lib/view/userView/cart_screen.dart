import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:humseafood/SharedFunctions/customShowMenu.dart';
import 'package:humseafood/constants.dart';
import 'package:humseafood/model/meal.dart';
import 'package:humseafood/provider/cart_item.dart';
import 'package:humseafood/widgets/userView_widgets/cartScreen_widgets/cartItem.dart';
import 'package:humseafood/widgets/userView_widgets/cartScreen_widgets/cartScreenAppBar.dart';
import 'package:provider/provider.dart';
import 'map_screen.dart';
import 'meal_screen.dart';

class CartScreen extends StatelessWidget {
  static String id = 'CartScreen';
  GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  String _phoneNumber;

  @override
  Widget build(BuildContext context) {
    List<Meal> _meals = Provider.of<CartItem>(context).meals;
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Stack(
      children: <Widget>[
        Container(
          height: double.infinity,
          width: double.infinity,
          color: Color(0xFFECF0F1),
        ),
        Container(
          height: double.infinity,
          width: isPortrait ? width * 0.3 : width * 0.2,
          color: KSecondColor,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: cartScreenAppBar(context, isPortrait, width),
          body: LayoutBuilder(
            builder: (context, constrains) {
              if (_meals.isNotEmpty) {
                return ListView.builder(
                  itemCount: _meals.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTapUp: (TapUpDetails details) async {
                        customShowMenu(
                          context,
                          width,
                          details,
                          () {
                            Navigator.pop(context);
                            Navigator.pushNamed(context, MealScreen.id,
                                arguments: _meals[index]);
                            Provider.of<CartItem>(context, listen: false)
                                .deleteItemFromCart(_meals[index]);
                          },
                          () {
                            Navigator.pop(context);
                            Provider.of<CartItem>(context, listen: false)
                                .deleteItemFromCart(_meals[index]);
                          },
                        );
                      },
                      child: cartItem(isPortrait, height, width,
                          mealName: _meals[index].mealName,
                          mealPrice: _meals[index].mealPrice,
                          mealQuantity: _meals[index].mealQuantity,
                          mealURL: _meals[index].imageURL),
                    );
                  },
                );
              } else {
                return Center(
                  child: Image.asset(
                    'assets/images/icons/emptyCart.png',
                    height: width * 0.8,
                    width: width * 0.8,
                  ),
                );
              }
            },
          ),
          bottomNavigationBar: InkWell(
            onTap: () {
              customShowDialog(_meals, context, width);
            },
            child: Container(
              height: isPortrait ? height * 0.08 : height * 0.14,
              width: width,
              decoration: BoxDecoration(
                color: KSecondColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40.0),
                ),
              ),
              child: Center(
                child: Text(
                  'Order Now',
                  style: TextStyle(
                    color: KWhiteColor,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void customShowDialog(List<Meal> meals, context, width) async {
    String price = getTotalPrice(meals);
    AlertDialog alertDialog = AlertDialog(
      content: SizedBox(
        height: 110.0,
        width: width,
        child: Column(
          children: [
            Expanded(
              child: Form(
                key: _globalKey,
                child: phoneNumberTextField(),
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  if (_globalKey.currentState.validate()) {
                    _globalKey.currentState.save();
                    _globalKey.currentState.reset();
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MapScreen(
                          phoneNumber: _phoneNumber,
                          totalPrice: price,
                          meals: meals,
                        ),
                      ),
                    );
                  }
                },
                child: Container(
                  width: width,
                  decoration: BoxDecoration(
                    color: KSecondColor,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.add_location,
                        color: KWhiteColor,
                      ),
                      Text(
                        'Select your location',
                        style: TextStyle(color: KWhiteColor, fontSize: 18.0),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(color: KWhiteColor),
      ),
    );
    await showDialog(
        context: context,
        builder: (context) {
          return alertDialog;
        });
  }

  Widget phoneNumberTextField() {
    OutlineInputBorder textFieldBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: BorderSide(color: KSecondColor, width: 1.0),
    );
    return TextFormField(
      validator: (String value) {
        if (value.isEmpty) {
          return 'Enter phone number';
        } else {
          return null;
        }
      },
      onSaved: (String value) {
        _phoneNumber = value;
      },
      cursorColor: KSecondColor,
      style: TextStyle(color: Colors.blueGrey),
      decoration: InputDecoration(
        labelText: 'Phone Number',
        labelStyle: TextStyle(
          color: Colors.blueGrey.withOpacity(0.9),
        ),
        enabledBorder: textFieldBorder,
        focusedBorder: textFieldBorder,
        errorBorder: textFieldBorder,
        focusedErrorBorder: textFieldBorder,
      ),
    );
  }

  getTotalPrice(List<Meal> meals) {
    var price = 0.0;
    for (var meal in meals) {
      price += double.parse(meal.mealPrice) * meal.mealQuantity;
    }
    return price.toString();
  }
}
