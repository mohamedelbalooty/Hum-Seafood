import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

Widget cartItem(
  bool isPortrait,
  double height,
  double width, {
  @required String mealName,
  @required String mealPrice,
  @required String mealURL,
  @required int mealQuantity,
}) {
  return Stack(
    children: <Widget>[
      Container(
        height: isPortrait ? height * 0.2 : height * 0.35,
        width: width,
        margin: EdgeInsets.symmetric(vertical: 10.0),
      ),
      Container(
        height: isPortrait ? height * 0.2 : height * 0.35,
        width: width,
        margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 35.0),
        decoration: BoxDecoration(
          color: KWhiteColor,
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(4, 4),
              blurRadius: 2.5,
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(75.0, 25.0, 5.0, 25.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    width: width * 0.5,
                    child: Text(
                      '$mealName',
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: KBlackColor,
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        '$mealPrice',
                        style: TextStyle(
                          color: KGreyColor,
                          fontSize: 18.0,
                        ),
                      ),
                      Text(
                        ' L.E',
                        style: TextStyle(
                          color: KSecondColor,
                          fontSize: 18.0,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      Container(
        height: isPortrait ? height * 0.2 : height * 0.35,
        width: width,
        margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 90.0,
              width: 90.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                border: Border.all(color: KWhiteColor, width: 2.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(4, 4),
                    blurRadius: 2.5,
                  ),
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(-2, 2),
                    blurRadius: 2.5,
                  ),
                ],
                image: DecorationImage(
                  image: NetworkImage(mealURL),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Container(
              height: 50.0,
              width: 50.0,
              decoration: BoxDecoration(
                color: KWhiteColor,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(4, 4),
                    blurRadius: 2.5,
                  ),
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(-2, 2),
                    blurRadius: 2.5,
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  '$mealQuantity',
                  style: TextStyle(
                    color: KSecondColor,
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
