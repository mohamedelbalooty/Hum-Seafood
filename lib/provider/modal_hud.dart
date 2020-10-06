import 'package:flutter/cupertino.dart';
class ModalHud extends ChangeNotifier{
  bool loading = false;
  loadChanging(bool value){
    loading = value;
    notifyListeners();
  }
}