import 'dart:async';
import 'package:flashtrip/utils/constant.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapsScreen extends StatefulWidget {
  const MapsScreen({Key? key}) : super(key: key);

  @override
  State<MapsScreen> createState() => _MapsScreenState();
}

class _MapsScreenState extends State<MapsScreen> {
  final Completer<GoogleMapController> _controller = Completer();

  static const LatLng sourceLocation =
  LatLng(-7.435252484460562, 109.24909620641054);
  static const LatLng destination =
  LatLng(-7.439679918537893, 109.24428543094908);

  List<LatLng> polyCoordinates = [];
  LocationData? currentLocation;

  BitmapDescriptor sourceIcon = BitmapDescriptor.defaultMarker;

  // BitmapDescriptor destinationIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor currentLocationIcon = BitmapDescriptor.defaultMarker;

  void getCurrentLocation() async {
    // Location? location = (await Location().changeSettings(accuracy: LocationAccuracy.high, interval: 1, distanceFilter: 0.1)) as Location?;
    Location location = Location();
    if (kDebugMode) {
      print('===============================');
      print(location.getLocation());
      print(location.requestService());
      print(location.isBackgroundModeEnabled());
      print('===============================');
    }
    location.getLocation().then(
          (location) {
        currentLocation = location;
      },
    );
    GoogleMapController googleMapController = await _controller.future;

    location.onLocationChanged.listen((newLoc) {
      currentLocation = newLoc;

      googleMapController.animateCamera(CameraUpdate.newCameraPosition(
          CameraPosition(
              zoom: 13.5,
              target: LatLng(newLoc.latitude!, newLoc.longitude!))));
      setState(() {});
    });
  }

  void getPolyPoints() async {
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      'google_api_key',
      PointLatLng(sourceLocation.latitude, sourceLocation.longitude),
      // PointLatLng(currentLocation!.latitude!, currentLocation!.longitude!),
      PointLatLng(destination.latitude, destination.longitude),
    );
    if (result.points.isNotEmpty) {
      result.points.forEach(
            (PointLatLng point) => polyCoordinates.add(
          LatLng(point.latitude, point.longitude),
        ),
      );
      setState(() {});
    }
  }

  void setCustomMarkerIcon() {
    BitmapDescriptor.fromAssetImage(
        ImageConfiguration.empty, 'assets/naruto.png')
        .then((icon) {
      sourceIcon = icon;
    });
    // BitmapDescriptor.fromAssetImage(
    //         ImageConfiguration.empty, 'assets/naruto.png')
    //     .then((icon) {
    //   destinationIcon = icon;
    // });
    BitmapDescriptor.fromAssetImage(
        ImageConfiguration.empty, 'assets/naruto.png')
        .then((icon) {
      currentLocationIcon = icon;
    });
  }

  @override
  void initState() {
    // getCurrentLocation();
    setCustomMarkerIcon();
    getPolyPoints();
    super.initState();
  }

  @override
  void dispose() {
    _controller;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Trial Map Screen"),
      ),
      body:
      // (currentLocation == null)
      //     ?
      // Column(
      //   children: [
      //     TextButton(
      //         onPressed: () {
      //           setState(() {});
      //         },
      //         child: const Text('Loading'))
      //   ],
      // )
      //     :
      Stack(
        children: [
          GoogleMap(
            initialCameraPosition: const CameraPosition(
              // target: LatLng(
                  // currentLocation!.latitude!, currentLocation!.longitude!),
              target: sourceLocation,
              zoom: 13.5,
            ),
            polylines: {
              Polyline(
                polylineId: const PolylineId("route"),
                points: polyCoordinates,
                color: const Color(Constant.mainColor),
                width: 6,
              )
            },
            markers: {
              // Marker(
              //     markerId: const MarkerId("currentLocation"),
              //     icon: currentLocationIcon,
              //     position: LatLng(currentLocation!.latitude!,
              //         currentLocation!.longitude!)),
              Marker(
                  markerId: const MarkerId("source"),
                  icon: sourceIcon,
                  position: sourceLocation),
              // position: LatLng(currentLocation!.latitude!, currentLocation!.longitude!)),
              const Marker(
                  markerId: MarkerId("destination"),
                  // icon: destinationIcon,
                  position: destination),
            },
            onMapCreated: (mapController) {
              _controller.complete(mapController);
            },
          ),
          Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(20),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text("Total Distance: " ),
                Text("Total Time: "),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
