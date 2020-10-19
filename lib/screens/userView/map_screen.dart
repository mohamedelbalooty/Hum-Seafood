import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:humseafood/constants.dart';
import 'package:location/location.dart';

class MapScreen extends StatefulWidget {
  static String id = 'MapScreen';

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
    setState(() {
        latitude = currentLocation.latitude;
        longitude = currentLocation.longitude;
        loading = false;
      },
    );
  }
  getCurrentAddress() async{
    List<Placemark> placemark = await Geolocator().placemarkFromCoordinates(latitude, longitude);
    setState(() {
      address = '${placemark[0].administrativeArea} ${placemark[0].locality} ${placemark[0].name}';
    });
  }

  @override
  Widget build(BuildContext context) {
    // print(address);
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: KSecondColor,
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: Text(
          'My Location',
          style: TextStyle(
            color: KWhiteColor,
            fontSize: 24.0,
          ),
        ),
      ),
      body: loading == false
          ? GoogleMap(
        mapType: MapType.normal,
        myLocationButtonEnabled: true,
        myLocationEnabled: true,
        initialCameraPosition: CameraPosition(
          target: LatLng(latitude, longitude),
          zoom: 17.0,
        ),
      )
          : Center(
        child: Image.asset('assets/images/loading.gif'),
      ),
      bottomSheet: GestureDetector(
        onTap: () async{
          await getCurrentAddress();
          print(address);
        },
        child: Container(
          height: height*0.4,
          width: width,
          margin: EdgeInsets.only(left: 30.0),
          decoration: BoxDecoration(
            color: KSecondColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
            // boxShadow: [
            //   BoxShadow(
            //     color: Colors.black26,
            //     offset: Offset(3, 4),
            //     blurRadius: 2.5,
            //   ),
            // ],
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Icon(Icons.location_on, size: 50.0, )
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
