import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:humseafood/SharedFunctions/addMealInCart.dart';
import '../../../constants.dart';

class MealCardItem extends StatelessWidget {
  String mealName, mealPrice, mealDescription, imageURL;

  MealCardItem(
      {@required this.mealName,
      @required this.mealPrice,
      @required this.mealDescription,
      @required this.imageURL});

  @override
  Widget build(BuildContext context) {
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: isPortrait ? height * 0.32 : height * 0.5,
      width: width,
      margin: EdgeInsets.only(
          right: isPortrait ? width * 0.1 : width * 0.2, top: 15.0),
      decoration: BoxDecoration(
        color: KWhiteColor,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0),
        ),
        boxShadow: [
          BoxShadow(
              color: Colors.black26, offset: Offset(4, 5), blurRadius: 2.5),
        ],
      ),
      child: Column(
        children: <Widget>[
          Container(
            height: isPortrait ? height * 0.22 : height * 0.35,
            width: width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(imageURL),
                fit: BoxFit.fill,
              ),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20.0),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    // addMealInCart(context, );
                  },
                  // child: Padding(
                  //   padding: EdgeInsets.all(10.0),
                  //   child: Icon(
                  //     Icons.favorite,
                  //     size: 28.0,
                  //     color: Colors.redAccent,
                  //   ),
                  // ),
                  child: Container(
                    height: 40.0,
                    width: 50.0,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.8),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                      ),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.favorite,
                        size: 28.0,
                        color: Colors.redAccent,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: isPortrait ? height * 0.1 : height * 0.15,
            width: width,
            decoration: BoxDecoration(
              color: KWhiteColor,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(20.0),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: isPortrait ? 10.0 : 2.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          mealName,
                          style: TextStyle(
                            color: KBlackColor,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            height: 1.2,
                          ),
                        ),
                        SizedBox(
                          width: width * 0.65,
                          child: Text(
                            mealDescription,
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: KBlackColor,
                              fontSize: 13.0,
                              height: 1.2,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 35.0,
                    width: 35.0,
                    decoration: BoxDecoration(
                      color: KSecondColor,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black26,
                            offset: Offset(4, 5),
                            blurRadius: 2.5),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        mealPrice,
                        style: TextStyle(
                          color: KWhiteColor,
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
