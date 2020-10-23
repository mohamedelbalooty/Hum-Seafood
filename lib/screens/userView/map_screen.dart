import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:humseafood/constants.dart';
import 'package:humseafood/model/meal.dart';
import 'package:humseafood/services/auth.dart';
import 'package:humseafood/services/store.dart';
import 'package:humseafood/widgets/userView_widgets/mapScreen_widgets/confirmationOrderButton.dart';
import 'package:intl/intl.dart';
import 'package:location/location.dart';
import 'package:toast/toast.dart';

class MapScreen extends StatefulWidget {
  String phoneNumber;
  String totalPrice;
  List<Meal> meals;

  MapScreen(
      {@required this.totalPrice,
      @required this.meals,
      @required this.phoneNumber});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MapScreen> {
  double latitude;
  double longitude;
  String _address;
  String _date;
  bool _loading = true;

  @override
  initState() {
    super.initState();
    _loading = true;
    getLocation();
  }

  Future getLocation() async {
    final location = Location();
    LocationData currentLocation = await location.getLocation();
    setState(
      () {
        latitude = currentLocation.latitude;
        longitude = currentLocation.longitude;
        _loading = false;
      },
    );
  }

  Future getCurrentAddress() async {
    List<Placemark> placemark =
        await Geolocator().placemarkFromCoordinates(latitude, longitude);
    setState(() {
      _address =
          '${placemark[0].administrativeArea} ${placemark[0].locality} ${placemark[0].name}';
    });
  }

  Auth _auth = Auth();
  FirebaseUser _loggedUser;
  String _userEmail;

  getCurrentUser() async {
    _loggedUser = await _auth.getUser();
    setState(() {
      _userEmail = _loggedUser.email;
    });
  }

  currentDate() {
    var now = new DateTime.now();
    var formatter = new DateFormat('yyyy-MM-dd');
    String formattedDate = formatter.format(now);
    setState(() {
      _date = formattedDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    if (_loading == false) {
      return Stack(
        children: [
          Container(
            height: height,
            width: width,
            color: Colors.transparent,
          ),
          GoogleMap(
            mapType: MapType.normal,
            myLocationButtonEnabled: true,
            myLocationEnabled: true,
            initialCameraPosition: CameraPosition(
              target: LatLng(latitude, longitude),
              zoom: 17.0,
            ),
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              leading: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  margin: EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    color: KSecondColor.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.arrow_back,
                      color: KWhiteColor,
                      size: 20.0,
                    ),
                  ),
                ),
              ),
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: isPortrait ? height * 0.15 : height * 0.25,
                  width: width,
                  margin: EdgeInsets.symmetric(horizontal: 20.0),
                  decoration: BoxDecoration(
                    color: KWhiteColor,
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(2, 3),
                        blurRadius: 2.0,
                      ),
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(-2, -1),
                        blurRadius: 2.0,
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Total Price',
                        style: TextStyle(
                          color: KBlackColor,
                          fontSize: 35.0,
                        ),
                      ),
                      Text(
                        '${widget.totalPrice} L.E',
                        style: TextStyle(
                            color: Colors.blueGrey.withOpacity(0.9),
                            fontSize: 22.0,
                            height: 1.0),
                      ),
                    ],
                  ),
                ),
                confirmationOrderButton(
                  isPortrait,
                  height,
                  width,
                  () async {
                    try {
                      await getCurrentAddress();
                      currentDate();
                      getCurrentUser();
                      Store _store = Store();
                      _store.viewStoreOrders(
                        data: <String, dynamic>{
                          KUserEmail: _userEmail,
                          KPhoneNumber: widget.phoneNumber,
                          KTotalPrice: widget.totalPrice,
                          KAddress: _address,
                          KCurrentDate: _date,
                        },
                        meals: widget.meals,
                      );
                      Toast.show("Ordered Successfully", context,
                          duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
                    } catch (e) {
                      print(e.toString());
                    }
                  },
                )
              ],
            ),
          ),
        ],
      );
    } else {
      return Material(
        child: Center(
          child: Image.asset('assets/images/loading.gif'),
        ),
      );
    }
  }
}
