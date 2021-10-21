// import 'package:flutter/material.dart';
// import 'package:flutter_map/flutter_map.dart';
// import 'package:latlong/latlong.dart';
// import 'package:tour_guide_app_project/pages/get_location.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:location_permissions/location_permissions.dart';
//
// void main() {
//   runApp(MyHomePage());
// }
//
// class MyHomePage extends StatefulWidget {
//
//   String value;
//   MyHomePage({this.value});
//
//   @override
//   MyHomePageState createState() => MyHomePageState(value);
//   /*
//   State<StatefulWidget> createState() {
//      return MyHomePageState();
//
//   }*/
// }
//
// class MyHomePageState extends State<MyHomePage> {
//
//   String value;
//   MyHomePageState(this.value);
//
//   var locationMessage = "";
//   var radius;
//   Position position;
//   var lat;
//   var long;
//
//   var latitude;
//   var longitude;
//   //String value;
//   final radiusCon = new TextEditingController();
//
// /*void getCurrentLocation() async {
//     var position = await Geolocator()
//         .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
//     var lastPosition = await Geolocator().getLastKnownPosition();
//     print(lastPosition);
//     setState(() {
//       locationMessage = "$position.latitude , $position.longitude";
//     });
//   }*/
//
//   void getCurrentLocation() async {
//     var position = await Geolocator()
//         .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
//     var lastPosition = await Geolocator().getLastKnownPosition();
//     print(lastPosition);
//     setState(() {
//       locationMessage = "$position";
//       List<String> latlongList = locationMessage.split(',');
//       print(latlongList);
//       print(latlongList[0]);
//       lat = latlongList[0].substring(5);
//       print(latlongList[1]);
//       print(lat);
//       latitude = double.parse(lat);
//       long = latlongList[1].substring(7);
//       print(long);
//       longitude = double.parse(long);
//     });
//   }
//
//   var points = <LatLng> [
//     new LatLng(12.97, 77.59),
//     new LatLng(12.23, 77.42),
//     new LatLng(12.00, 77.12),
//     new LatLng(12.67, 77.26),
//     new LatLng(12.97, 77.59),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       appBar: new AppBar(
//         backgroundColor: Colors.blue[900],
//         title: new Text('Maps'),
//         centerTitle: true,
//         elevation: 0,
//       ),
//       body: new FlutterMap(
//         options: new MapOptions(
//           center: new LatLng(12.97, 77.59),
//           minZoom: 10.0
//         ),
//         layers: [
//           new TileLayerOptions(
//             urlTemplate: "https://api.mapbox.com/styles/v1/aditipnayak/ckomsjdtc1n7d17ozqsxdzexp/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiYWRpdGlwbmF5YWsiLCJhIjoiY2tvbXA2YmhpMTR5bDJ2bzBsc2d2YWR4ciJ9.R_lJ8ZTjKSYhiQQmYgTMAA",
//             additionalOptions: {
//             'accessToken': 'pk.eyJ1IjoiYWRpdGlwbmF5YWsiLCJhIjoiY2tvbXA2YmhpMTR5bDJ2bzBsc2d2YWR4ciJ9.R_lJ8ZTjKSYhiQQmYgTMAA',
//             'id': 'mapbox.mapbox-streets-v8'
//           }
//           ),
//           new MarkerLayerOptions(markers: [
//             new Marker(
//               width: 45.0,
//               height: 45.0,
//               point: new LatLng(12.97, 77.59),
//               builder: (context) => new Container(
//                 child: IconButton(
//                   icon: Icon(Icons.location_on),
//                   color: Colors.red,
//                   onPressed: (){},
//                 ),
//               )
//             )
//           ]),
//           /*new PolylineLayerOptions (
//             polylines: [
//               new Polyline(
//               points: points,
//               strokeWidth: 5.0,
//               color: Colors.red
//               )
//             ]
//           )*/
//         ]
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: getCurrentLocation,
//         child: Icon(Icons.location_searching),
//         backgroundColor: Colors.blue[500],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location_permissions/location_permissions.dart';
import 'package:geolocator/geolocator.dart' as locator;
import 'package:chatapp/Take_me_Somewhere/pages/gps.dart';

void main() {
  runApp(MyHomePage());
}

var current_lat = double.parse(lats);
var current_lng = double.parse(longs);

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var locationMessage = "";
  var radius;
  var lat;
  var long;
  String value = "";
  final radiusCon = new TextEditingController();

  bool location = false;

  // locator.Position position;
  // Widget _child;

  Future<void> getPermission() async {
    PermissionStatus permission =
        await LocationPermissions().checkPermissionStatus();

    if (permission == PermissionStatus.denied) {
      await LocationPermissions().requestPermissions();
    }
  }

  void getCurrentLocation() async {
    var position = await locator.Geolocator.getCurrentPosition(
        desiredAccuracy: locator.LocationAccuracy.high);
    var lastPosition = await locator.Geolocator.getLastKnownPosition();
    print(lastPosition);
    setState(() {
      locationMessage = "$position";
      List<String> latlongList = locationMessage.split(',');
      print(latlongList);
      print(latlongList[0]);
      lat = latlongList[0].substring(5);
      print(latlongList[1]);
      print(lat);
      long = latlongList[1].substring(6);
      print(long);
    });
  }

  Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    _markers.add(Marker(
        markerId: MarkerId('myMarker'),
        infoWindow: const InfoWindow(title: 'Your Location'),
        draggable: false,
        onTap: () {
          print('Your Location');
        },
        position: LatLng(current_lat, current_lng)));
  }

  // void _onMapCreated(GoogleMapController controller) {
  //   setState(() {
  //     _markers.add(
  //       Marker(
  //           markerId: MarkerId('id-1'),
  //           position: LatLng(12.97, 77.59),
  //     ),
  //     );
  //   });
  // }

  static const _initialCameraPosition = CameraPosition(
    target: LatLng(12.8617,77.6609),
    zoom: 15.0,
  );

  late GoogleMapController _googleMapController;

  // @override
  // void dispose() {
  //   _googleMapController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Color(0xffdd8e58),
        title: new Text('Maps'),
        centerTitle: true,
        elevation: 0,
      ),
      body: GoogleMap(
        myLocationButtonEnabled: false,
        zoomControlsEnabled: false,
        initialCameraPosition: _initialCameraPosition,
        onMapCreated: (controller) => _googleMapController = controller,
        // _onMapCreated,
        markers: Set.from(_markers),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.black,
        onPressed: () => _googleMapController.animateCamera(
          CameraUpdate.newCameraPosition(_initialCameraPosition),
        ),
        child: const Icon(Icons.center_focus_strong),
      ),
    );
  }
}
