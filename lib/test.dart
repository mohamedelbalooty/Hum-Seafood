// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:humseafood/services/store.dart';
// import 'package:humseafood/widgets/user_widgets/homeScreen_widgets/drawerIcon.dart';
// import 'package:humseafood/widgets/user_widgets/homeScreen_widgets/home_appBar.dart';
// import 'package:humseafood/widgets/user_widgets/homeScreen_widgets/side_barIcon.dart';
// import '../../constants.dart';
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
//     bool isPortrait =
//         MediaQuery.of(context).orientation == Orientation.portrait;
//     double height = MediaQuery.of(context).size.height;
//     double width = MediaQuery.of(context).size.width;
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           children: <Widget>[
//             Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Expanded(
//                   child: Stack(
//                     children: <Widget>[
//                       Container(
//                         height: isPortrait ? height : height*2,
//                         width: isPortrait ? 85.0 : 90.0,
//                         color: Colors.white,
//                       ),
//                       Container(
//                         height: isPortrait ? height : height*2,
//                         width: isPortrait ? 70.0 : 75.0,
//                         decoration: BoxDecoration(
//                           color: KSecondColor,
//                           boxShadow: [
//                             BoxShadow(
//                                 color: Colors.black26,
//                                 offset: Offset(4, 0),
//                                 blurRadius: 1.5,),
//                           ],
//                         ),
//                       ),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: <Widget>[
//                           SizedBox(
//                             height: isPortrait ? height * 0.07 : height * 0.09,
//                           ),
//                           drawerIcon(context),
//                           ListView.builder(
//                             shrinkWrap: true,
//                             physics: AlwaysScrollableScrollPhysics(),
//                             scrollDirection: Axis.vertical,
//                             itemCount: 7,
//                             itemBuilder: (context, index) {
//                               return GestureDetector(
//                                   onTap: () {
//                                     setState(() {
//                                       _currentIndexList = index;
//                                     });
//                                   },
//                                   child: sideBarIcon(
//                                       currentIndexList: _currentIndexList,
//                                       index: index));
//                             },
//                           ),
//                         ],
//                       )
//                     ],
//                   ),
//                 ),
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     SizedBox(
//                       height: isPortrait ? height * 0.07 : height * 0.09,
//                     ),
//                     homeAppBar(isPortrait, 'Salad'),
//                     Container(
//                       height: isPortrait ? height * 0.35 : height * 0.6,
//                       width: isPortrait ? width - 85.0 : width - 90.0,
//                       color: Colors.brown,
//                       child: GridView.builder(
//                         scrollDirection: Axis.horizontal,
//                         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                           crossAxisCount: 2,
//                           childAspectRatio: isPortrait ? 1.1 : 0.8,
//                         ),
//                         itemCount: 7,
//                         itemBuilder: (context, index){
//                           return Container(
//                             margin: EdgeInsets.all(5.0),
//                             decoration: BoxDecoration(
//                               color: Colors.pinkAccent,
//                               borderRadius: BorderRadius.circular(15.0),
//                               boxShadow: [
//                                 BoxShadow(
//                                   color: Colors.black26,
//                                   offset: Offset(5, 5),
//                                   blurRadius: 3
//                                 ),
//                               ],
//                             ),
//                             child: Container(
//                               margin: EdgeInsets.all(5.0),
//                               decoration: BoxDecoration(
//                                 image: DecorationImage(
//                                   image: ExactAssetImage('assets/images/icons/salad.png'),
//                                   fit: BoxFit.fill,
//                                 ),
//                                 shape: BoxShape.circle,
//                                 boxShadow: [
//                                   BoxShadow(
//                                       color: Colors.black26,
//                                       offset: Offset(5, 8),
//                                       blurRadius: 3
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           );
//                         },
//                       ),
//                     ),
//                     Stack(
//                       children: <Widget>[
//                         Container(
//                           height: isPortrait ? height*0.4 : height*0.6,
//                           width: isPortrait ? width-100.0 : width-105.0,
//                           decoration: BoxDecoration(
//                             color: Colors.cyan,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
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
// }







// PageView(
// dragStartBehavior: DragStartBehavior.start,
// reverse: false,
// controller: _pageController,
// onPageChanged: (index) {
// setState(() {
// _currentIndex = index;
// });
// },
// children: <Widget>[
// Stack(
// children: <Widget>[
// Container(
//
// height: double.infinity,
// width: double.infinity,
// ),
// Container(
// height: double.infinity,
// width: double.infinity,
// color: Colors.red,
// ),
// ],
// ),
// Stack(
// children: <Widget>[
// Container(
// height: double.infinity,
// width: double.infinity,
// ),
// Container(
// height: double.infinity,
// width: 250,
// color: Colors.red,
// ),
// ],
// ),
// Stack(
// children: <Widget>[
// Container(
// height: double.infinity,
// width: double.infinity,
// ),
// Container(
// height: double.infinity,
// width: 200,
// color: Colors.red,
// ),
//
// ],
// ),
// ],
// ),











// TabBar(
// controller: _tabController,
// isScrollable: true,
// labelPadding: EdgeInsets.symmetric(horizontal: 5.0),
// // indicatorColor: Colors.deepOrangeAccent,
// indicator: BoxDecoration(
// color: Colors.deepOrangeAccent,
// // borderRadius: BorderRadius.only(
// //   topLeft: Radius.circular(20.0),
// //   topRight: Radius.circular(20.0),
// // ),
// borderRadius: BorderRadius.circular(20),
// ),
// labelColor: KWhiteColor,
// unselectedLabelColor: KGreyColor,
// onTap: (int index) {
// setState(() {
// _isSelected = false;
// _selectedIndex = _tabController.index;
// _isSelected = true;
// });
// },
// tabs: <Widget>[
// _tabItem(
// width,
// ),
// _tabItem(
// width,
// ),
// _tabItem(
// width,
// ),
// _tabItem(
// width,
// )
// ],
// ),





// Container(
// height: 40.0,
// width: width,
// margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
// child: ListView.builder(
// scrollDirection: Axis.horizontal,
// itemCount: 6,
// itemBuilder: (context, index) {
// return GestureDetector(
// onTap: () {
// setState(() {
// _selectedIndex = index;
// });
// },
// child: tabItem(width, isPortrait, index, _selectedIndex),
// );
// },
// ),
// ),



// Expanded(
// child: ListView.builder(
// scrollDirection: Axis.vertical,
// itemCount: 6,
// itemBuilder: (context, index) {
// return GestureDetector(
// onTap: (){
// Navigator.pushNamed(context, MealScreen.id);
// },
// child: MealCardItem(),
// );
// },
// ),
// ),


// Container(
// height: selectedIndex == index ? 40.0 : 35.0,
// width: selectedIndex == index ? width * 0.28 : width * 0.25,
// margin: EdgeInsets.symmetric(horizontal: 5.0),
// decoration: BoxDecoration(
// color:
// selectedIndex == index ? KSecondColor : Colors.grey.withOpacity(0.4),
// borderRadius: BorderRadius.circular(20.0),
// ),
// child: Center(
// child: Text(
// _tabsName[index],
// style: TextStyle(
// color: selectedIndex == index ? KWhiteColor : Colors.grey,
// fontSize: 18.0,
// fontWeight: selectedIndex == index ? FontWeight.bold : null,
// height: 1.8,
// ),
// ),
// ),
// );




// return Scaffold(
// backgroundColor: KSecondColor,
// body: CustomScrollView(
// slivers: <Widget>[
// SliverAppBar(
// pinned: true,
// floating: true,
// forceElevated: true,
// elevation: 0.0,
// backgroundColor: KSecondColor,
// leading: _appBarIcon(Icons.arrow_back, () {
// Navigator.pop(context);
// }),
// actions: <Widget>[
// _appBarIcon(Icons.shopping_cart, () {}),
// ],
// expandedHeight: isPortrait ? height * 0.5 : height * 0.6,
// flexibleSpace: FlexibleSpaceBar(
// background: Container(
// // margin: isPortrait
// //     ? EdgeInsets.fromLTRB(height * 0.06, height * 0.06,
// //         height * 0.06, height * 0.04)
// //     : EdgeInsets.fromLTRB(width * 0.35, height * 0.075,
// //         width * 0.35, height * 0.055),
// decoration: BoxDecoration(
// // shape: BoxShape.circle,
// // border: Border.all(color: KWhiteColor, width: 5.0),
// image: DecorationImage(
// image: NetworkImage(_meal.imageURL),
// fit: BoxFit.fill,
// ),
// boxShadow: [
// BoxShadow(
// color: Colors.black26,
// offset: Offset(5, 8),
// blurRadius: 2.5),
// ],
// ),
// ),
// ),
// ),
// SliverToBoxAdapter(
// child: Container(
// height: height,
// width: width,
// decoration: BoxDecoration(
// color: KWhiteColor,
// borderRadius: BorderRadius.only(
// topLeft: Radius.circular(30.0),
// topRight: Radius.circular(30.0),
// ),
// ),
// child: Padding(
// padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
// child: Column(
// mainAxisAlignment: MainAxisAlignment.start,
// crossAxisAlignment: CrossAxisAlignment.start,
// children: <Widget>[
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: <Widget>[
// SizedBox(
// width: width * 0.6,
// child: Column(
// mainAxisAlignment: MainAxisAlignment.start,
// crossAxisAlignment: CrossAxisAlignment.start,
// children: <Widget>[
// Text(
// _meal.mealCategory.toLowerCase(),
// style: TextStyle(
// color: KBlackColor,
// fontSize: 26.0,
// fontWeight: FontWeight.bold,
// ),
// maxLines: 2,
// ),
// Text(
// _meal.mealName,
// style: TextStyle(
// color: KBlackColor,
// fontSize: 26.0,
// fontWeight: FontWeight.bold,
// height: 1.1),
// maxLines: 2,
// ),
// ],
// ),
// ),
// customPriceCard(_meal.mealPrice),
// ],
// ),
// SizedBox(
// height: 20.0,
// ),
// Text(
// _meal.mealDescription,
// style: TextStyle(
// color: KBlackColor, fontSize: 18.0, height: 1.5),
// // textAlign: TextAlign.center,
// maxLines: 2,
// ),
// SizedBox(
// height: 10.0,
// ),
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: <Widget>[
// Text(
// '${_meal.mealPrice} L.E',
// style: TextStyle(
// color: KBlackColor,
// fontSize: 24.0,
// fontWeight: FontWeight.bold,
// ),
// ),
// Row(
// children: <Widget>[
// Container(
// height: 30.0,
// width: 30.0,
// decoration: BoxDecoration(
// color: Colors.deepOrangeAccent.withOpacity(0.8),
// borderRadius: BorderRadius.circular(5.0),
// ),
// child: Padding(
// padding: EdgeInsets.only(top: 10.0),
// child: Icon(
// Icons.maximize,
// color: KWhiteColor,
// ),
// ),
// ),
// Padding(
// padding: EdgeInsets.symmetric(horizontal: 5.0),
// child: Text(
// '1',
// style: TextStyle(
// color: KBlackColor,
// fontSize: 24.0,
// fontWeight: FontWeight.bold,
// ),
// ),
// ),
// Container(
// height: 30.0,
// width: 30.0,
// decoration: BoxDecoration(
// color: Colors.deepOrangeAccent.withOpacity(0.8),
// borderRadius: BorderRadius.circular(5.0),
// ),
// child: Center(
// child: Icon(
// Icons.add,
// color: KWhiteColor,
// ),
// ),
// ),
// ],
// ),
// ],
// ),
// ],
// ),
// ),
// ),
// ),
// ],
// ),
// );
// Widget _appBarIcon(IconData icon, Function onClick) {
// return GestureDetector(
// onTap: onClick,
// child: Container(
// height: 20.0,
// width: 40.0,
// margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
// decoration: BoxDecoration(
// color: Colors.white.withOpacity(0.2),
// borderRadius: BorderRadius.circular(5.0),
// ),
// child: Center(
// child: Icon(
// icon,
// size: 28.0,
// color: KWhiteColor,
// ),
// ),
// ),
// );
// }