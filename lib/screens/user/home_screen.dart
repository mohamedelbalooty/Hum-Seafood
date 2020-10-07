// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:humseafood/constants.dart';
// import 'package:humseafood/model/meal.dart';
// import 'package:humseafood/provider/meal_categoryName.dart';
// import 'package:humseafood/services/store.dart';
// import 'package:humseafood/widgets/snapshot_errorMessage.dart';
// import 'package:humseafood/widgets/user_widgets/homeScreen_widgets/side_barIcon.dart';
// import 'package:humseafood/widgets/user_widgets/homeScreen_widgets/drawerIcon.dart';
// import 'package:humseafood/widgets/user_widgets/homeScreen_widgets/grid_cardItem.dart';
// import 'package:humseafood/widgets/user_widgets/homeScreen_widgets/home_appBar.dart';
// import 'package:humseafood/widgets/user_widgets/homeScreen_widgets/meal_cardItem.dart';
// import 'package:provider/provider.dart';
//
// import '../../side_barArrow.dart';
//
// class HomeScreen extends StatefulWidget {
//   static String id = 'HomeScreen';
//
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   int _currentIndexList = 0;
//   int _currentIndexGrid = 0;
//   Store _store = Store();
//
//   @override
//   Widget build(BuildContext context) {
//     String currentCategory =
//         Provider.of<MealCategoryName>(context).mealCategory;
//     bool isPortrait =
//         MediaQuery.of(context).orientation == Orientation.portrait;
//     double height = MediaQuery.of(context).size.height;
//     double width = MediaQuery.of(context).size.width;
//     return Scaffold(
//       drawer: Drawer(),
//       body: SingleChildScrollView(
//         child: Column(
//           children: <Widget>[
//             Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Container(
//                   height: height,
//                   width: 85.0,
//                   child: Stack(
//                     children: <Widget>[
//                       Container(
//                         height: height,
//                         width: 85.0,
//                         color: KWhiteColor,
//                       ),
//                       Container(
//                         height: height,
//                         width: 68.0,
//                         color: KSecondColor,
//                         // child: Padding(
//                         //   padding: EdgeInsets.only(
//                         //     top: isPortrait ? height * 0.05 : height * 0.09,
//                         //   ),
//                         //   child: Column(
//                         //     mainAxisAlignment: MainAxisAlignment.start,
//                         //     crossAxisAlignment: CrossAxisAlignment.center,
//                         //     children: <Widget>[
//                         //       drawerIcon(context),
//                         //       // Expanded(
//                         //       //   child: ListView.builder(
//                         //       //     scrollDirection: Axis.vertical,
//                         //       //     itemCount: 7,
//                         //       //     itemBuilder: (context, index) {
//                         //       //       return GestureDetector(
//                         //       //         onTap: () {
//                         //       //           defineCategoryName(index);
//                         //       //         },
//                         //       //         child: sideBarIcon(
//                         //       //             currentIndexList: _currentIndexList,
//                         //       //             index: index),
//                         //       //       );
//                         //       //     },
//                         //       //   ),
//                         //       // ),
//                         //     ],
//                         //   ),
//                         // ),
//                       ),
//                       ListView.builder(
//                         scrollDirection: Axis.vertical,
//                         itemCount: 7,
//                         itemBuilder: (context, index) {
//                           return GestureDetector(
//                             onTap: () {
//                               defineCategoryName(index);
//                             },
//                             child: sideBarIcon(
//                                 currentIndexList: _currentIndexList,
//                                 index: index),
//                           );
//                         },
//                       ),
//                     ],
//                   ),
//                 ),
//                 StreamBuilder<QuerySnapshot>(
//                   stream: _store.loadMeals(),
//                   // ignore: missing_return
//                   builder: (context, snapshot) {
//                     if (snapshot.hasData) {
//                       List<Meal> _meals = [];
//                       for (var document in snapshot.data.documents) {
//                         var data = document.data;
//                         if (document[KMealCategory] == currentCategory) {
//                           _meals.add(Meal(
//                             mealName: data[KMealName],
//                             mealPrice: data[KMealPrice],
//                             mealCategory: data[KMealCategory],
//                             mealDescription: data[KMealDescription],
//                             imageURL: data[KMealImageURL],
//                             mealId: document.documentID,
//                           ));
//                         }
//                       }
//                       return Container(
//                         height: height,
//                         width: isPortrait ? width * 0.8 : width * 0.88,
//                         color: KWhiteColor,
//                         child: Padding(
//                           padding: EdgeInsets.only(
//                             top: isPortrait ? height * 0.05 : height * 0.09,
//                           ),
//                           child: SingleChildScrollView(
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: <Widget>[
//                                 Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: <Widget>[
//                                     homeAppBar(isPortrait, 'Soup'),
//                                     Padding(
//                                       padding: EdgeInsets.only(
//                                           right: isPortrait ? 10.0 : 15.0),
//                                       child: Icon(
//                                         Icons.shopping_basket,
//                                         size: 30.0,
//                                         color: KSecondColor,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 Container(
//                                   height:
//                                       isPortrait ? height * 0.35 : height * 0.9,
//                                   width: width,
//                                   margin: EdgeInsets.fromLTRB(
//                                       isPortrait ? 15.0 : 20.0, 10.0, 0, 10.0),
//                                   child: GridView.builder(
//                                     gridDelegate:
//                                         SliverGridDelegateWithFixedCrossAxisCount(
//                                             crossAxisCount: 2,
//                                             childAspectRatio:
//                                                 isPortrait ? 1.1 : 1.0,
//                                             mainAxisSpacing: 5.0,
//                                             crossAxisSpacing: 5.0),
//                                     itemCount: _meals.length,
//                                     scrollDirection: Axis.horizontal,
//                                     itemBuilder: (context, index) {
//                                       return GestureDetector(
//                                         onTap: () {
//                                           setState(() {
//                                             _currentIndexGrid = index;
//                                           });
//                                         },
//                                         child: gridCardItem(
//                                             isPortrait,
//                                             _meals[index].imageURL,
//                                             index,
//                                             _currentIndexGrid),
//                                       );
//                                     },
//                                   ),
//                                 ),
//                                 mealCardItem(isPortrait, height, width,
//                                     mealName:
//                                         _meals[_currentIndexGrid].mealName,
//                                     mealPrice:
//                                         _meals[_currentIndexGrid].mealPrice,
//                                     imageURL:
//                                         _meals[_currentIndexGrid].imageURL),
//                               ],
//                             ),
//                           ),
//                         ),
//                       );
//                     } else if (snapshot.hasError) {
//                       snapshotErrorMessage(width, snapshot);
//                     } else {
//                       return Center(
//                         child: CircularProgressIndicator(),
//                       );
//                     }
//                   },
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: CurvedNavigationBar(
//         height: 50.0,
//         backgroundColor: KSecondColor,
//         items: <Widget>[
//           Icon(Icons.add, size: 30),
//           Icon(Icons.list, size: 30),
//           Icon(Icons.compare_arrows, size: 30),
//         ],
//         onTap: (index) {
//           print(index);
//         },
//       ),
//     );
//   }
//
//   defineCategoryName(int index) {
//     setState(() {
//       _currentIndexList = index;
//     });
//     setState(() {
//       _currentIndexGrid = 0;
//     });
//     MealCategoryName mealCategoryData =
//         Provider.of<MealCategoryName>(context, listen: false);
//     switch (_currentIndexList) {
//       case 0:
//         mealCategoryData.categoryChanging(KSoupCategory);
//         break;
//       case 1:
//         mealCategoryData.categoryChanging(KPastaCategory);
//         break;
//       case 2:
//         mealCategoryData.categoryChanging(KSaladCategory);
//         break;
//       case 3:
//         mealCategoryData.categoryChanging(KSoupCategory);
//         break;
//       case 4:
//         mealCategoryData.categoryChanging(KPastaCategory);
//         break;
//       case 5:
//         mealCategoryData.categoryChanging(KSaladCategory);
//         break;
//       case 6:
//         mealCategoryData.categoryChanging(KSoupCategory);
//         break;
//     }
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:humseafood/constants.dart';
import 'package:humseafood/model/meal.dart';
import 'package:humseafood/provider/meal_categoryName.dart';
import 'package:humseafood/services/store.dart';
import 'package:humseafood/widgets/user_widgets/homeScreen_widgets/drawerIcon.dart';
import 'package:humseafood/widgets/user_widgets/homeScreen_widgets/mealCardItem.dart';
import 'package:humseafood/widgets/user_widgets/homeScreen_widgets/tabItem.dart';
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
    String currentCategory =
        Provider.of<MealCategoryName>(context).mealCategory;
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: KSecondColor,
      drawer: Drawer(),
      bottomNavigationBar: CurvedNavigationBar(
        height: 50.0,
        backgroundColor: KSecondColor,
        items: <Widget>[
          Icon(Icons.add, size: 30),
          Icon(Icons.list, size: 30),
          Icon(Icons.compare_arrows, size: 30),
        ],
        onTap: (index) {
          print(index);
        },
      ),
      appBar: AppBar(
        backgroundColor: KSecondColor,
        elevation: 0.0,
        title: Text(
          'Discover meals',
          style: TextStyle(
            fontSize: 24.0,
            color: KWhiteColor,
          ),
        ),
        centerTitle: true,
        leading: drawerIcon(context),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.shopping_cart,
              size: 28.0,
              color: KWhiteColor,
            ),
            onPressed: () {},
          ),
        ],
      ),
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
        // switch(snapshot.connectionState){
        //   case ConnectionState.active:
        //     List<Meal> _meals = [];
        //     for (var document in snapshot.data.documents) {
        //       var data = document.data;
        //       if (document[KMealCategory] == categoryName) {
        //         _meals.add(
        //           Meal(
        //               mealName: data[KMealName],
        //               mealPrice: data[KMealPrice],
        //               mealCategory: data[KMealCategory],
        //               mealDescription: data[KMealDescription],
        //               imageURL: data[KMealImageURL],
        //               mealId: document.documentID),
        //         );
        //       }
        //     }
        //     return ListView.builder(
        //       scrollDirection: Axis.vertical,
        //       itemCount: _meals.length,
        //       itemBuilder: (context, index) {
        //         return GestureDetector(
        //           onTap: () {
        //             Navigator.pushNamed(context, MealScreen.id, arguments: _meals[index]);
        //           },
        //           child: MealCardItem(
        //             mealName: _meals[index].mealName,
        //             mealPrice: _meals[index].mealPrice,
        //             mealDescription: _meals[index].mealDescription,
        //             imageURL: _meals[index].imageURL,
        //           ),
        //         );
        //       },
        //     );
        //   case ConnectionState.waiting:
        //     return Center(
        //       child: CircularProgressIndicator(),
        //     );
        //   case ConnectionState.none:
        //     return Center(
        //       child: Text('No data'),
        //     );
        //   case ConnectionState.done:
        //     List<Meal> _meals = [];
        //     for (var document in snapshot.data.documents) {
        //       var data = document.data;
        //       if (document[KMealCategory] == categoryName) {
        //         _meals.add(
        //           Meal(
        //               mealName: data[KMealName],
        //               mealPrice: data[KMealPrice],
        //               mealCategory: data[KMealCategory],
        //               mealDescription: data[KMealDescription],
        //               imageURL: data[KMealImageURL],
        //               mealId: document.documentID),
        //         );
        //       }
        //     }
        //     return ListView.builder(
        //       scrollDirection: Axis.vertical,
        //       itemCount: _meals.length,
        //       itemBuilder: (context, index) {
        //         return GestureDetector(
        //           onTap: () {
        //             Navigator.pushNamed(context, MealScreen.id, arguments: _meals[index]);
        //           },
        //           child: MealCardItem(
        //             mealName: _meals[index].mealName,
        //             mealPrice: _meals[index].mealPrice,
        //             mealDescription: _meals[index].mealDescription,
        //             imageURL: _meals[index].imageURL,
        //           ),
        //         );
        //       },
        //     );
        // }
        if (snapshot.hasData) {
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
          return ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: _meals.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, MealScreen.id, arguments: _meals[index]);
                },
                child: MealCardItem(
                  mealName: _meals[index].mealName,
                  mealPrice: _meals[index].mealPrice,
                  mealDescription: _meals[index].mealDescription,
                  imageURL: _meals[index].imageURL,
                ),
              );
            },
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
