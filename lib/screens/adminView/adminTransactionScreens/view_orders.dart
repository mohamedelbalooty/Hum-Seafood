import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:humseafood/constants.dart';
import 'package:humseafood/model/order.dart';
import 'package:humseafood/services/store.dart';
import 'package:humseafood/widgets/adminView_widgets/viewOrders/user_details.dart';

import 'order_details.dart';

class ViewOrders extends StatelessWidget {
  static String id = 'ViewOrder';

  Store _store = Store();

  @override
  Widget build(BuildContext context) {
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        centerTitle: true,
        backgroundColor: KSecondColor,
        title: Text(
          'Orders',
          style: TextStyle(
            color: KWhiteColor,
            fontSize: 25.0,
          ),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _store.loadOrders(),
        // ignore: missing_return
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(),
              );
            case ConnectionState.none:
              return Center(
                child: Image.asset(
                  'assets/images/nodata.jpg',
                  height: 500.0,
                  width: 500.0,
                ),
              );
            case ConnectionState.active:
            case ConnectionState.done:
              List<Order> _orders = [];
              for (var document in snapshot.data.documents) {
                var data = document.data;
                _orders.add(
                  Order(
                      userEmail: data[KUserEmail],
                      phoneNumber: data[KPhoneNumber],
                      totalPrice: data[KTotalPrice],
                      address: data[KAddress],
                      date: data[KCurrentDate]),
                );
              }
              return ListView.builder(
                itemCount: _orders.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: isPortrait ? height * 0.42 : height * 0.62,
                    width: width,
                    margin: EdgeInsets.symmetric(vertical: 10.0),
                    child: Column(
                      children: [
                        Container(
                          height: isPortrait ? height * 0.3 : height * 0.47,
                          width: width,
                          margin: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 5.0),
                          decoration: BoxDecoration(
                            color: KWhiteColor,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Order Date',
                                      style: TextStyle(
                                          color: KBlackColor,
                                          fontSize: 24.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      _orders[index].date,
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 18.0,
                                      ),
                                    ),
                                  ],
                                ),
                                userDetails(
                                    Icons.phone, _orders[index].phoneNumber),
                                userDetails(Icons.email_outlined,
                                    _orders[index].userEmail),
                                userDetails(Icons.location_on_outlined,
                                    _orders[index].address),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 0.0),
                            decoration: BoxDecoration(
                              color: KWhiteColor,
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Total Price',
                                    style: TextStyle(
                                        color: KBlackColor,
                                        fontSize: 28.0,
                                        fontWeight: FontWeight.bold,),
                                  ),
                                  Expanded(child: SizedBox()),
                                  Text(
                                    '${_orders[index].totalPrice} L.E',
                                    style: TextStyle(
                                      color: KBlackColor,
                                      fontSize: 19.0,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  SizedBox(width: 10.0,),
                                  InkWell(
                                    onTap: (){
                                      Navigator.pushNamed(context, OrderDetails.id);
                                    },
                                    child: Icon(
                                      Icons.keyboard_arrow_down,
                                      size: 26.0,
                                      color: KGreyColor,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
          }
        },
      ),
    );
  }
}
