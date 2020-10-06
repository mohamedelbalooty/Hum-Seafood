import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:humseafood/widgets/admin_widgets/editMeal/popupMenuItem/modifiedPopupMenuItemWidget.dart';
import 'package:humseafood/widgets/admin_widgets/transaction_button.dart';
import '../../../constants.dart';

class MealCard extends StatelessWidget {
  String mealImage, mealName, mealPrice;
  Function onTap1, onTap2;

  MealCard(
      {@required this.mealName,
      @required this.mealPrice,
      @required this.mealImage,
      @required this.onTap1,
      @required this.onTap2});

  @override
  Widget build(BuildContext context) {
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: height * 0.35,
      width: width * 0.5,
      margin: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(color: KWhiteColor, width: 0.5),
        gradient: LinearGradient(
          colors: [Colors.redAccent, Colors.orange],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(-5, 5),
            blurRadius: 2.5,
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              height: isPortrait ? height * 0.22 : height * 0.5,
              width: isPortrait ? height * 0.22 : height * 0.5,
              margin: EdgeInsets.only(top: 8.0),
              decoration: BoxDecoration(
                color: Colors.deepOrangeAccent,
                shape: BoxShape.circle,
              ),
              child: Transform.translate(
                offset: Offset(4, -3),
                child: Container(
                  margin: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: KWhiteColor, width: 0.5),
                    image: DecorationImage(
                      image: mealImage != null
                          ? NetworkImage(mealImage)
                          : ExactAssetImage(
                              'assets/images/icons/emptyImage.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SizedBox(
                      width: isPortrait
                          ? height * 0.22 - 30.0
                          : height * 0.5 - 30.0,
                      child: Text(
                        mealName,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        style: TextStyle(
                          color: KWhiteColor,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTapUp: (details) async {
                        double dxLeft = details.globalPosition.dx;
                        double dyTop = details.globalPosition.dy;
                        double dxRight = width - dxLeft;
                        double dyBottom = width - dyTop;
                        await showMenu(
                            context: context,
                            shape: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            position: RelativeRect.fromLTRB(
                                dxLeft, dyTop, dxRight, dyBottom),
                            items: [
                              modifiedPopupMenuItemWidget(
                                  width,
                                  Colors.indigoAccent,
                                  Colors.cyan,
                                  'Edit',
                                  onTap1),
                              modifiedPopupMenuItemWidget(
                                width,
                                Colors.redAccent,
                                Colors.pinkAccent,
                                'Delete',
                                onTap2,
                              ),
                            ]);
                      },
                      child: transactionButton(Icons.mode_edit),
                    ),
                  ],
                ),
                Text(
                  '\$ $mealPrice',
                  style: TextStyle(
                    color: KWhiteColor,
                    fontSize: 18.0,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
