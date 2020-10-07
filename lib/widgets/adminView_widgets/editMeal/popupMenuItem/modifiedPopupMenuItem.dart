import 'package:flutter/material.dart';

class ModifiedPopupMenuItem<T> extends PopupMenuItem<T> {
  final Widget child;
  final Function onClick;
  ModifiedPopupMenuItem({@required this.child, @required this.onClick}) :
      super(child: child);
  @override
  PopupMenuItemState<T, PopupMenuItem<T>> createState() {
    return ModifiedPopupMenuItemState();
  }
}

class ModifiedPopupMenuItemState<T, PopMenuItem>
    extends PopupMenuItemState<T, ModifiedPopupMenuItem<T>> {

  @override
  void handleTap() {
    widget.onClick();
  }
}
