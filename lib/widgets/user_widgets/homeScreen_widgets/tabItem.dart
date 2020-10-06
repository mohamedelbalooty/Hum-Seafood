import 'package:flutter/material.dart';
import '../../../constants.dart';

Widget tabBarItem(bool isPortrait, int index) {
  List<Map<String, String>> _tabsName = [
    {
      'name': 'Pizza',
      'image': 'assets/images/icons/pizza.png',
    },
    {
      'name': 'Pasta',
      'image': 'assets/images/icons/pasta.png',
    },
    {
      'name': 'Seafood',
      'image': 'assets/images/icons/seafood.png',
    },
    {
      'name': 'Soup',
      'image': 'assets/images/icons/soup.png',
    },
    {
      'name': 'Steak',
      'image': 'assets/images/icons/steak.png',
    },
    {
      'name': 'Salad',
      'image': 'assets/images/icons/salad.png',
    },
  ];
  return Column(
    children: <Widget>[
      Image.asset(
        _tabsName[index]['image'],
        height: isPortrait ? 35.0 : 45.0,
        width: isPortrait ? 35.0 : 45.0,
      ),
      SizedBox(
        height: 8.0,
      ),
      Text(_tabsName[index]['name']),
    ],
  );
}
