import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:humseafood/constants.dart';
import 'package:humseafood/model/meal.dart';
import 'package:humseafood/provider/cart_item.dart';
import 'package:humseafood/widgets/userView_widgets/cartScreen_widgets/cartItem.dart';
import 'package:humseafood/widgets/userView_widgets/cartScreen_widgets/cartScreenAppBar.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  static String id = 'CartScreen';

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
          bottomNavigationBar: Container(
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
          appBar: cartScreenAppBar(context, isPortrait, width),
          body: LayoutBuilder(
            builder: (context, constrains) {
              if(_meals.isNotEmpty){
                return ListView.builder(
                  itemCount: _meals.length,
                  itemBuilder: (context, index) {
                    return cartItem(isPortrait, height, width,
                        mealName: _meals[index].mealName,
                        mealPrice: _meals[index].mealPrice,
                        mealQuantity: _meals[index].mealQuantity,
                        mealURL: _meals[index].imageURL);
                  },
                );
              }else{
                return Center(
                  child: Image.asset('assets/images/icons/emptyCart.png'),
                );
              }
            },

          ),
        ),
      ],
    );
  }
}
