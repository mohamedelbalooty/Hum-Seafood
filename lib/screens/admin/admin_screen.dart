import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:humseafood/constants.dart';
import 'package:humseafood/screens/admin/adminTransactionScreens/add_meal.dart';
import 'package:humseafood/screens/admin/adminTransactionScreens/manage_meal.dart';
import 'package:humseafood/screens/admin/adminTransactionScreens/view_order.dart';
import 'package:humseafood/widgets/admin_widgets/admin_panelButton.dart';

class AdminPanel extends StatelessWidget {
  static String id = 'AdminScreen';

  @override
  Widget build(BuildContext context) {
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              height: isPortrait ? height * 0.15 : height * 0.25,
              width: width,
              decoration: BoxDecoration(
                color: KSecondColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0, 8),
                    blurRadius: 5.5,
                  ),
                ],
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                ),
              ),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 25.0),
                  child: Text(
                    'Admin Panel',
                    style: TextStyle(
                      fontSize: 26.0,
                      fontWeight: FontWeight.bold,
                      color: KWhiteColor,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: isPortrait ? height * 0.2 : height * 0.1,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                adminPanelButton(
                    context,
                    height,
                    width,
                    isPortrait,
                    Colors.deepOrangeAccent,
                    Colors.orangeAccent,
                    'Add a Meal',
                    AddMeal.id,
                    Icons.add),
                adminPanelButton(
                    context,
                    height,
                    width,
                    isPortrait,
                    Colors.indigoAccent,
                    Colors.cyan,
                    'Manage Meal',
                    ManageMeals.id,
                    Icons.edit),
                adminPanelButton(
                    context,
                    height,
                    width,
                    isPortrait,
                    Colors.lightGreen,
                    Colors.greenAccent,
                    'View Orders',
                    ViewOrder.id,
                    Icons.rate_review),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
