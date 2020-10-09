import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:humseafood/model/meal.dart';
import 'package:humseafood/screens/adminView/adminTransactionScreens/edit_meal.dart';
import 'package:humseafood/services/store.dart';
import 'package:humseafood/widgets/adminView_widgets/editMeal/manage_mealAppBar.dart';
import 'package:humseafood/widgets/adminView_widgets/editMeal/mealCard.dart';
import 'package:humseafood/widgets/snapshot_errorMessage.dart';
import '../../../constants.dart';

class ManageMeals extends StatefulWidget {
  static String id = 'ManageMeals';

  @override
  _ManageMealsState createState() => _ManageMealsState();
}

class _ManageMealsState extends State<ManageMeals> {
  Store _store = Store();

  @override
  Widget build(BuildContext context) {
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: manageMealAppBar(),
      body: StreamBuilder<QuerySnapshot>(
        stream: _store.loadMeals(),
        // ignore: missing_return
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Meal> _meals = [];
            for (var document in snapshot.data.documents) {
              Map<String, dynamic> data = document.data;
              _meals.add(Meal(
                mealName: data[KMealName],
                mealPrice: data[KMealPrice],
                mealCategory: data[KMealCategory],
                mealDescription: data[KMealDescription],
                imageURL: data[KMealImageURL],
                mealId: document.documentID,
              ));
            }
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0),
              child: GridView.builder(
                scrollDirection: Axis.vertical,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: isPortrait ? 0.77 : 1.1),
                itemCount: _meals.length,
                itemBuilder: (context, index) {
                  return MealCard(
                    mealName: _meals[index].mealName,
                    mealPrice: _meals[index].mealPrice,
                    mealImage: _meals[index].imageURL,
                    onTap1: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditMeal(
                            meals: _meals[index],
                          ),
                        ),
                      );
                    },
                    onTap2: () {
                      _store.deleteMeal(_meals[index].mealId);
                      Navigator.pop(context);
                    },
                  );
                },
              ),
            );
          } else if (snapshot.hasError) {
            snapshotErrorMessage(width, snapshot);
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
