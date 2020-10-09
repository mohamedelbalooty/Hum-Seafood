import 'package:flutter/material.dart';
import 'package:humseafood/widgets/adminView_widgets/editMeal/popupMenuItem/modifiedPopupMenuItemWidget.dart';

customShowMenu(context, double width, TapUpDetails details, Function onTap1,
    Function onTap2) async {
  double dxLeft = details.globalPosition.dx;
  double dyTop = details.globalPosition.dy;
  double dxRight = width - dxLeft;
  double dyBottom = width - dyTop;
  await showMenu(
    context: context,
    shape: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15.0),
    ),
    position: RelativeRect.fromLTRB(dxLeft, dyTop, dxRight, dyBottom),
    items: [
      modifiedPopupMenuItemWidget(
          width, Colors.indigoAccent, Colors.cyan, 'Edit', onTap1),
      modifiedPopupMenuItemWidget(
        width,
        Colors.redAccent,
        Colors.pinkAccent,
        'Delete',
        onTap2,
      ),
    ],
  );
}
