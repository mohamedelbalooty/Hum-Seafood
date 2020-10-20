import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:humseafood/constants.dart';
import 'package:humseafood/model/meal.dart';
import 'package:location/location.dart';

class MapScreen extends StatefulWidget {
  // static String id = 'MapScreen';
  String totalPrice;
  List<Meal> meals;

  MapScreen({@required this.totalPrice, @required this.meals});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MapScreen> {
  double latitude;
  double longitude;
  String address;
  bool loading = true;

  @override
  initState() {
    super.initState();
    loading = true;
    getLocation();
  }

  Future getLocation() async {
    final location = Location();
    LocationData currentLocation = await location.getLocation();
    setState(
      () {
        latitude = currentLocation.latitude;
        longitude = currentLocation.longitude;
        loading = false;
      },
    );
  }

  Future getCurrentAddress() async {
    List<Placemark> placemark =
        await Geolocator().placemarkFromCoordinates(latitude, longitude);
    setState(() {
      address =
          '${placemark[0].administrativeArea} ${placemark[0].locality} ${placemark[0].name}';
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    if (loading == false) {
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
                Container(
                  height: isPortrait ? height * 0.09 : height * 0.1,
                  width: width,
                  margin:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  decoration: BoxDecoration(
                    color: KSecondColor,
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
                  child: Center(
                    child: Text(
                      'Confirm Order',
                      style: TextStyle(
                          color: KWhiteColor,
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
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

/*onTap: () async {
          await getCurrentAddress();
          print(address);
        },*/
