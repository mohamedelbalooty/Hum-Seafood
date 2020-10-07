import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:humseafood/model/meal.dart';
import 'package:humseafood/widgets/user_widgets/homeScreen_widgets/priceCard.dart';
import '../../constants.dart';

class MealScreen extends StatelessWidget {
  static String id = 'MealScreen';

  @override
  Widget build(BuildContext context) {
    Meal _meal = ModalRoute.of(context).settings.arguments;
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      // bottomNavigationBar: Container(
      //   height: isPortrait ? height * 0.08 : height * 0.14,
      //   width: width,
      //   margin: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 15.0),
      //   decoration: BoxDecoration(
      //     color: KSecondColor,
      //     borderRadius: BorderRadius.circular(10.0),
      //     boxShadow: [
      //       BoxShadow(
      //         color: Colors.black26,
      //         offset: Offset(4, 4),
      //         blurRadius: 2.0,
      //       ),
      //     ],
      //   ),
      //   child: Center(
      //     child: Text(
      //       'Add To Cart',
      //       style: TextStyle(
      //         color: KWhiteColor,
      //         fontSize: 18.0,
      //         fontWeight: FontWeight.bold,
      //       ),
      //     ),
      //   ),
      // ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                Container(
                  height: isPortrait ? height*0.6 : height,
                  width: width,
                ),
                Container(
                  height: height*0.3,
                  width: width,
                  decoration: BoxDecoration(
                    color: KSecondColor,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40.0),
                        bottomRight: Radius.circular(40.0)
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(top: height*0.045),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        IconButton(
                          onPressed: (){
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.arrow_back, size: 25.0, color: KWhiteColor,),
                        ),
                        SizedBox(width: isPortrait ? width*0.14 : width*0.32,),
                        Text(_meal.mealName, style: TextStyle(
                          color: KWhiteColor,
                          fontSize: 25.0,
                          height: 2.0,
                        ),),
                        Expanded(child: SizedBox(),),
                        IconButton(
                          onPressed: (){
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.shopping_cart, size: 25.0, color: KWhiteColor,),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: height*0.15,
                  child: Container(
                    height: width*0.8,
                    width: width*0.85,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      image: DecorationImage(
                        image: NetworkImage(_meal.imageURL),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: isPortrait ? height*0.4 : height,
              width: width,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 28.0, vertical: 10.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          _meal.mealName,
                          style: TextStyle(
                            color: KBlackColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 24.0,
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              _meal.mealPrice,
                              style: TextStyle(
                                color: KBlackColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                              ),
                            ),
                            Text(
                              ' L.E',
                              style: TextStyle(
                                color: KSecondColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      width: width*0.7,
                      child: Text(
                        '${_meal.mealDescription}.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          height: 1.5,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        transactionIconButton(Icons.maximize, 12.0),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                          child: Text(
                            '1',
                            style: TextStyle(
                                color: KBlackColor,
                                fontSize: 26.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        transactionIconButton(Icons.add, 0.0),
                      ],
                    ),
                    Container(
                      height: isPortrait ? height * 0.08 : height * 0.14,
                      width: width,
                      margin: EdgeInsets.only(top: 5.0),
                      decoration: BoxDecoration(
                        color: KSecondColor,
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            offset: Offset(3, 4),
                            blurRadius: 2.5,
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
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }

  Widget transactionIconButton(IconData icon, double paddingValue) {
    return Container(
      height: 35.0,
      width: 35.0,
      decoration: BoxDecoration(
        color: Colors.deepOrangeAccent.withOpacity(0.4),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Center(
        child: Padding(
          padding: EdgeInsets.only(top: paddingValue),
          child: GestureDetector(
            child: Icon(
              icon,
              color: KSecondColor,
              size: 30.0,
            ),
          ),
        ),
      ),
    );
  }
}
