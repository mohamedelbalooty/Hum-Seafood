import 'package:flutter/material.dart';
class UserAddress extends ChangeNotifier{
  String currentAddress ;
  userCurrentAddress(String address){
    currentAddress = address;
    notifyListeners();
  }
}