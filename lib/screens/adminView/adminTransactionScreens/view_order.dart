import 'package:flutter/material.dart';

class ViewOrder extends StatelessWidget {
  static String id = 'ViewOrder';
  @override
  Widget build(BuildContext context) {
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Container(color: Colors.blueGrey,);
  }
}
