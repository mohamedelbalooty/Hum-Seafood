import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:humseafood/constants.dart';
import 'package:humseafood/model/meal.dart';
import 'package:humseafood/provider/cart_item.dart';
import 'package:humseafood/services/store.dart';
import 'package:humseafood/widgets/userView_widgets/homeScreen_widgets/homeScreenAppBar.dart';
import 'package:humseafood/widgets/userView_widgets/homeScreen_widgets/mealCardItem.dart';
import 'package:humseafood/widgets/userView_widgets/homeScreen_widgets/tabItem.dart';
import 'package:provider/provider.dart';
import 'meal_screen.dart';

class HomeScreen extends StatefulWidget {
  static String id = 'HomeScreen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 6, initialIndex: 0, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  int _selectedIndex = 0;
  Store _store = Store();

  @override
  Widget build(BuildContext context) {
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: KSecondColor,
      drawer: Drawer(),
      bottomNavigationBar: CurvedNavigationBar(
        height: 50.0,
        // color: KSecondColor,
        backgroundColor: KSecondColor,
        items: <Widget>[
          Icon(Icons.add, size: 30, ),
          Icon(Icons.list, size: 30, ),
          Icon(Icons.compare_arrows, size: 30, ),
        ],
        onTap: (index) {
          // print(index);
        },
      ),
      appBar: homeScreenAppBar(context),
      body: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Color(0xFFECF0F1),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 20.0,
              width: width,
            ),
            TabBar(
              dragStartBehavior: DragStartBehavior.down,
              onTap: (int index) {
                setState(() {
                  _selectedIndex = _tabController.index;
                });
              },
              controller: _tabController,
              isScrollable: true,
              labelPadding:
                  EdgeInsets.symmetric(horizontal: isPortrait ? 20.0 : 30.0),
              labelColor: KSecondColor,
              unselectedLabelColor: Colors.grey.shade400,
              labelStyle: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
              unselectedLabelStyle: TextStyle(
                fontSize: 16.0,
              ),
              indicatorColor: Color(0xFFF1683C),
              indicatorWeight: 1.5,
              tabs: <Widget>[
                tabBarItem(isPortrait, 0),
                tabBarItem(isPortrait, 1),
                tabBarItem(isPortrait, 2),
                tabBarItem(isPortrait, 3),
                tabBarItem(isPortrait, 4),
                tabBarItem(isPortrait, 5),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: <Widget>[
                  _getMealByCategory(KPizzaCategory),
                  _getMealByCategory(KPastaCategory),
                  _getMealByCategory(KSeafoodCategory),
                  _getMealByCategory(KSoupCategory),
                  _getMealByCategory(KSteakCategory),
                  _getMealByCategory(KSaladCategory),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _getMealByCategory(String categoryName) {
    return StreamBuilder<QuerySnapshot>(
      stream: _store.loadMeals(),
      // ignore: missing_return
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          try {
            List<Meal> _meals = [];
            for (var document in snapshot.data.documents) {
              var data = document.data;
              if (document[KMealCategory] == categoryName) {
                _meals.add(
                  Meal(
                      mealName: data[KMealName],
                      mealPrice: data[KMealPrice],
                      mealCategory: data[KMealCategory],
                      mealDescription: data[KMealDescription],
                      imageURL: data[KMealImageURL],
                      mealId: document.documentID),
                );
              }
            }
            return Hero(
              tag: 'Hero',
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: _meals.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, MealScreen.id,
                          arguments: _meals[index]);
                    },
                    child: MealCardItem(
                      mealName: _meals[index].mealName,
                      mealPrice: _meals[index].mealPrice,
                      mealDescription: _meals[index].mealDescription,
                      imageURL: _meals[index].imageURL,
                    ),
                  );
                },
              ),
            );
          } catch (e) {
            return Center(
              child: Text(
                'Some thing went wrong',
                style: TextStyle(
                  color: KBlackColor,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          }
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
