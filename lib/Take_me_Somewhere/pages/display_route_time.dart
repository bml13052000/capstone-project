import 'dart:async';

import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';

class DispTime extends StatefulWidget {
  var coordinates;
  DispTime(this.coordinates);

  @override
  _DispTimeState createState() => _DispTimeState();
}

// Starting point latitude
double _originLatitude = 12.9507;
// Starting point longitude
double _originLongitude = 77.5848;

// Markers to show points on the map
Map<MarkerId, Marker> markers = {};

PolylinePoints polylinePoints = PolylinePoints();
Map<PolylineId, Polyline> polylines = {};

class _DispTimeState extends State<DispTime> {
  // Google Maps controller
  Completer<GoogleMapController> _controller = Completer();

  // Configure map position and zoom
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(_originLatitude, _originLongitude),
    zoom: 15,
  );

  @override
  void initState() {
    super.initState();

    for (var places in widget.coordinates) {
      double lat = double.parse(places[0].toString());
      double long = double.parse(places[1].toString());
      String val = places[2].toString();
      print(val);
      _addMarker(
        LatLng(lat, long),
        "stop${lat}",
        BitmapDescriptor.defaultMarker,
        val,
      );
    }

    _getPolyline();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Route',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffdd8e58),
          title: Text('Route'),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
            ),
            onPressed: () {_removeMarker();},
          ),
          actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {Navigator.pushNamed(context, '/');},
              child: Icon(
                Icons.home,
                size: 26.0,
              ),
            )
          ),],
        ),
        body: GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: _kGooglePlex,
          myLocationEnabled: true,
          tiltGesturesEnabled: true,
          compassEnabled: true,
          scrollGesturesEnabled: true,
          zoomGesturesEnabled: true,
          polylines: Set<Polyline>.of(polylines.values),
          markers: Set<Marker>.of(markers.values),
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ),
      ),
    );
  }

  // This method will add markers to the map based on the LatLng position
  _addMarker(
      LatLng position, String id, BitmapDescriptor descriptor, String text) {
    MarkerId markerId = MarkerId(id);
    Marker marker = Marker(
        markerId: markerId,
        icon: descriptor,
        position: position,
        infoWindow: InfoWindow(title: text));
    markers[markerId] = marker;
  }

  _addPolyLine(List<LatLng> polylineCoordinates) {
    PolylineId id = PolylineId("poly");
    Polyline polyline = Polyline(
        polylineId: id,
        points: polylineCoordinates,
        width: 8,
        color: Colors.red);
    polylines[id] = polyline;
    setState(() {});
  }

  void _getPolyline() async {
    List<LatLng> polylineCoordinates = [];
    super.initState();
    var length = widget.coordinates.length;
    print(length);
    for (var places = 0; places < length - 1; places++) {
      var coords1 = widget.coordinates[places];
      var lat1 = double.parse(coords1[0].toString());
      var long1 = double.parse(coords1[1].toString());

      var coords2 = widget.coordinates[places + 1];
      var lat2 = double.parse(coords2[0].toString());
      var long2 = double.parse(coords2[1].toString());

      PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        "AIzaSyAulQEJio88_KGsSugKspdLx8lUcHwqTGg",
        PointLatLng(lat1, long1),
        PointLatLng(lat2, long2),
        travelMode: TravelMode.driving,
      );
      if (result.points.isNotEmpty) {
        result.points.forEach((PointLatLng point) {
          polylineCoordinates.add(LatLng(point.latitude, point.longitude));
        });
      } else {
        print(result.errorMessage);
      }
      _addPolyLine(polylineCoordinates);
    }
  }

  _removeMarker() {
    markers.clear();
    Navigator.pop(context);
  }
}