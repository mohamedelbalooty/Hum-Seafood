import 'package:flutter/cupertino.dart';

class Order {
  String address;
  String totalPrice;
  String phoneNumber;
  String date;
  String userEmail;

  Order(
      {@required this.address,
      @required this.totalPrice,
      @required this.phoneNumber,
      @required this.date,
      @required this.userEmail});
}
