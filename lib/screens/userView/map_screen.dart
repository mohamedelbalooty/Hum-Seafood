import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:humseafood/constants.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  static String id = 'MapScreen';

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   getUserLocation();
  // }
  // double latitude;
  // double longitude;
  // Future getUserLocation() async{
  //   Position currentPosition = await Geolocator()
  //       .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  //   setState(() {
  //     latitude = currentPosition.latitude;
  //     longitude = currentPosition.longitude;
  //   });
  //   print(latitude);
  //   print(longitude);
  // }




  // static var currentLocation = LocationData;
  //
  // var location = new Location();
  //
  // Future _getLocation() async {
  //   try {
  //     location.onLocationChanged.listen((LocationData currentLocation) {
  //       print('Latitude:${currentLocation.latitude}');
  //       print('Longitude:${currentLocation.longitude}');
  //       return LatLng(currentLocation.latitude, currentLocation.longitude);
  //     });
  //   } catch (e) {
  //     print('ERROR:$e');
  //     currentLocation = null;
  //   }
  //
  // }
  // @override
  // void initState() {
  //   _getLocation();
  //   super.initState();
  // }
  //
  // static final CameraPosition _currentPosition = CameraPosition(
  //   target: LatLng(currentLocation.latitude  ,  currentLocation.longitude),
  //   zoom: 14.4746,
  // );


  final Key _mapKey = UniqueKey();

  Completer<GoogleMapController> _googleMapController = Completer();


  Completer<GoogleMapController> controller1;


  static LatLng _initialPosition;
  final Set<Marker> _markers = {};
  static  LatLng _lastMapPosition = _initialPosition;

  @override
  void initState() {
    super.initState();
    _getUserLocation();
  }
  void _getUserLocation() async {
    Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    List<Placemark> placemark = await Geolocator().placemarkFromCoordinates(position.latitude, position.longitude);
    setState(() {
      _initialPosition = LatLng(position.latitude, position.longitude);
      print('${placemark[0].subLocality} ${placemark[0].name}');
    });
  }


  _onMapCreated(GoogleMapController controller) {
    setState(() {
      controller1.complete(controller);
    });
  }






  // CameraPosition _currentCameraPosition = CameraPosition(
  //   target: LatLng(30.97063, 31.1669),
  //   zoom: 20.0,
  // );

  @override
  Widget build(BuildContext context) {
    // getUserLocation();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: KSecondColor,
        automaticallyImplyLeading: true,
        title: Text(
          'Map View',
          style: TextStyle(
            fontSize: 24.0,
            color: KWhiteColor,
          ),
        ),
      ),
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(
          target: _initialPosition,
          zoom: 14.4746,
        ),
        onMapCreated: (GoogleMapController controller){
          _googleMapController.complete(controller);
        },
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
//
//
// class MapScreen extends StatefulWidget
// {
//   static String id = 'MapScreen';
//   ///key is required, otherwise map crashes on hot reload
//   MapScreen({ @required Key key})
//       :
//         super(key:key);
//
//   @override
//   _MyAppState createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MapScreen>
// {
//   GoogleMapController _mapController ;
//
//   void _onMapCreated(GoogleMapController controller) {
//     _mapController = controller;
//   }
//   @override
//   Widget build(BuildContext context)
//   {
//     return Scaffold(
//       //also this avoids it crashing/breaking when the keyboard is up
//         resizeToAvoidBottomInset: false,
//         body: GoogleMap(
//           onMapCreated: _onMapCreated,
//           initialCameraPosition: CameraPosition(
//             target: const LatLng(30.0925973,31.3219982),
//             zoom: 11.0,
//           ),
//         )
//     );
//   }
// }

















