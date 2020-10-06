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
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              IconButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: KBlackColor,
                  size: 25.0,
                ),
              ),

              Expanded(
                child: Container(
                  height: isPortrait ? height*0.5 : height*0.55,
                  width: isPortrait ? width*0.8 : width*0.7,
                  color: Colors.pinkAccent,
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(
              // height: isPortrait ? height*0.4 : height*0.5,
              // width: isPortrait ? width*0.8 : width*0.7,
              margin: EdgeInsets.only(left: 15.0),
              color: Colors.greenAccent,
            ),
          ),
        ],
      ),
    );
  }


}
