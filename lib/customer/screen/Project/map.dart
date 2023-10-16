import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:location/location.dart' as loc;
import 'package:location/location.dart';
import 'package:untitled5/customer/screen/Booking/booking.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:math' show cos, sqrt, asin;

import 'display.dart';

class NavigationScreen extends StatefulWidget {
  // final double lat;
  // final double lng;
  // NavigationScreen(this.lat, this.lng);

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  final Completer<GoogleMapController?> _controller = Completer();
  Map<PolylineId, Polyline> polylines = {};
  PolylinePoints polylinePoints = PolylinePoints();
  Location location = Location();
  Marker? sourcePosition, destinationPosition;
  loc.LocationData? _currentPosition;
  LatLng curLocation = LatLng(23.0525, 72.5667);
  StreamSubscription<loc.LocationData>? locationSubscription;
  late double a;
  bool _added=false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNavigation();
    addMarker();
  }

  @override
  void dispose() {
    locationSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: sourcePosition == null
          ? Center(child: CircularProgressIndicator())
          : Stack(
        children: [
           StreamBuilder(
            stream: FirebaseFirestore.instance.collection('location').snapshots(),
             builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
               if (_added) {
                 getDirections(snapshot);
                 // mymap(snapshot);
               }
               if (!snapshot.hasData) {
                 return Center(child: CircularProgressIndicator());
               }
               return GoogleMap(
            zoomControlsEnabled: false,
            polylines: Set<Polyline>.of(polylines.values),
            initialCameraPosition: CameraPosition(
              target: curLocation,
              zoom: 16,
            ),
            markers: {sourcePosition!,  Marker(
               markerId: MarkerId('destination'),
               position: LatLng(snapshot.data!.docs.singleWhere(
                       (element) => element.id == 'user1')['latitude'],
                 snapshot.data!.docs.singleWhere(
                         (element) => element.id == 'user1')['longitude'],),
               icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
               )},
            onTap: (latLng) {
              // print(latLng);
            },
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
              _added=true;
            },
          );
             }),
          Positioned(
            top: 30,
            left: 15,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => Booking()),
                        (route) => false);
              },
              child: Icon(Icons.arrow_back),
            ),
          ),
          Positioned(
              bottom: 10,
              right: 10,
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Colors.blue),
                child: Center(
                  child: IconButton(
                    icon: Icon(
                      Icons.navigation_outlined,
                      color: Colors.white,
                    ),
                    onPressed: () async {
                      // await launchUrl(Uri.parse(
                      //     'google.navigation:q=${widget.lat}, ${widget.lng}&key=AIzaSyDVIgdjd9DLmCCh5Dn-c8tcFpvp-j5u6aU'));
                    },
                  ),
                ),
              ))
        ],
      ),
    );
  }

  getNavigation() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    final GoogleMapController? controller = await _controller.future;
    location.changeSettings(accuracy: loc.LocationAccuracy.high);
    _serviceEnabled = await location.serviceEnabled();

    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    if (_permissionGranted == loc.PermissionStatus.granted) {
      _currentPosition = await location.getLocation();
      await FirebaseFirestore.instance.collection('location').doc('user2').set({
        'latitude': _currentPosition?.latitude,
        'longitude': _currentPosition?.longitude,
        'name': 'Shahid'
      }, SetOptions(merge: true));
      curLocation =
          LatLng(_currentPosition!.latitude!, _currentPosition!.longitude!);
      locationSubscription =
          location.onLocationChanged.listen((LocationData currentLocation) async {
            await FirebaseFirestore.instance.collection('location').doc('user2').set({
              'latitude': currentLocation.latitude,
              'longitude': currentLocation.longitude,
              'name': 'Shahid'
            }, SetOptions(merge: true));
            controller?.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
              target: LatLng(currentLocation.latitude!, currentLocation.longitude!),
              zoom: 16,
            )));
            if (mounted) {
              controller
                  ?.showMarkerInfoWindow(MarkerId(sourcePosition!.markerId.value));
              setState(() {
                curLocation =
                    LatLng(currentLocation.latitude!, currentLocation.longitude!);
                sourcePosition = Marker(
                  markerId: MarkerId(currentLocation.toString()),
                  icon: BitmapDescriptor.defaultMarkerWithHue(
                      BitmapDescriptor.hueBlue),
                  position:
                  LatLng(currentLocation.latitude!, currentLocation.longitude!),
                  // infoWindow: InfoWindow(
                  //     title: '${double.parse(
                  //         (getDistance(LatLng(widget.lat, widget.lng))
                  //             .toStringAsFixed(2)))} km'
                  // ),
                  onTap: () {

                  },
                );
              });
              // getDirections(LatLng(widget.lat, widget.lng));
            }
          });
    }
  }

  Future getDirections(AsyncSnapshot<QuerySnapshot> snapshot) async {
    List<LatLng> polylineCoordinates = [];
    List<dynamic> points = [];


    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        "AIzaSyAn_SZv3omYMnxAkEcFZzdJfn0I1-tz6GE",
        PointLatLng(curLocation.latitude, curLocation.longitude),
        PointLatLng(snapshot.data!.docs.singleWhere(
                (element) => element.id == 'user1')['latitude'],
          snapshot.data!.docs.singleWhere(
                  (element) => element.id == 'user1')['longitude'],),
        travelMode: TravelMode.driving);
    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
        points.add({'lat': point.latitude, 'lng': point.longitude});
      });
    } else {
      // print(result.errorMessage);
      // print('1');
    }


   a=double.parse(
              (getDistance(LatLng(snapshot.data!.docs.singleWhere(
                      (element) => element.id == 'user1')['latitude'],
                snapshot.data!.docs.singleWhere(
                        (element) => element.id == 'user1')['longitude'],),)
                  .toStringAsFixed(2)));

    setState(() {
      sourcePosition = Marker(
        markerId: MarkerId('source'),
        position: curLocation,
        infoWindow: InfoWindow(
            title: '${a} km'
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
      );});
    addPolyLine(polylineCoordinates);
  }

  addPolyLine(List<LatLng>polylineCoordinates) {
    PolylineId id = PolylineId('poly');
    Polyline polyline = Polyline(
      polylineId: id,
      color: Colors.blue,
      points: polylineCoordinates,
      width: 5,
    );
    polylines[id] = polyline;
    // print(polylines[id]);
    setState(() {});
  }

  double calculateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }

  double getDistance(LatLng destposition) {
    return calculateDistance(curLocation.latitude, curLocation.longitude,
        destposition.latitude, destposition.longitude);
  }
  addMarker() {
    setState(() {
      sourcePosition = Marker(
        markerId: MarkerId('source'),
        // position: curLocation,
        // infoWindow: InfoWindow(
        //     title: '${a} km'
        // ),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
      );
      // destinationPosition = Marker(
      //   markerId: MarkerId('destination'),
      //   position: LatLng(widget.lat, widget.lng),
      //   icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
      // );
    });
  }
}