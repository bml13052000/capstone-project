// // import 'package:flutter/material.dart';
// // import 'package:google_maps_flutter/google_maps_flutter.dart';
// // import 'package:location_permissions/location_permissions.dart';
// // import 'package:geolocator/geolocator.dart' as locator;
// // import 'package:chatapp/pages/gps.dart';

// // void main() {
// //   runApp(MyHomePage());
// // }

// // var current_lat = double.parse(lats);
// // var current_lng = double.parse(longs);

// // class MyHomePage extends StatefulWidget {
// //   @override
// //   _MyHomePageState createState() => _MyHomePageState();
// // }

// // class _MyHomePageState extends State<MyHomePage> {
// //   var locationMessage = "";
// //   var radius;
// //   var lat;
// //   var long;
// //   String value = "";
// //   final radiusCon = new TextEditingController();

// //   bool location = false;

// //   Future<void> getPermission() async {
// //     PermissionStatus permission =
// //         await LocationPermissions().checkPermissionStatus();

// //     if (permission == PermissionStatus.denied) {
// //       await LocationPermissions().requestPermissions();
// //     }
// //   }

// //   void getCurrentLocation() async {
// //     var position = await locator.Geolocator.getCurrentPosition(
// //         desiredAccuracy: locator.LocationAccuracy.high);
// //     var lastPosition = await locator.Geolocator.getLastKnownPosition();
// //     print(lastPosition);
// //     setState(() {
// //       locationMessage = "$position";
// //       List<String> latlongList = locationMessage.split(',');
// //       print(latlongList);
// //       print(latlongList[0]);
// //       lat = latlongList[0].substring(5);
// //       print(latlongList[1]);
// //       print(lat);
// //       long = latlongList[1].substring(6);
// //       print(long);
// //     });
// //   }

// //   Set<Marker> _markers = {};

// //   @override
// //   void initState() {
// //     super.initState();
// //     _markers.add(Marker(
// //         markerId: MarkerId('myMarker'),
// //         infoWindow: const InfoWindow(title: 'Your Location'),
// //         draggable: false,
// //         onTap: () {
// //           print('Your Location');
// //         },
// //         position: LatLng(current_lat, current_lng)));
// //   }

// //   static const _initialCameraPosition = CameraPosition(
// //     target: LatLng(12.8617,77.6609),
// //     zoom: 15.0,
// //   );

// //   GoogleMapController _googleMapController;

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: new AppBar(
// //         backgroundColor: Color(0xffdd8e58),
// //         title: new Text('Maps'),
// //         centerTitle: true,
// //         elevation: 0,
// //       ),
// //       body: GoogleMap(
// //         myLocationButtonEnabled: false,
// //         zoomControlsEnabled: false,
// //         initialCameraPosition: _initialCameraPosition,
// //         onMapCreated: (controller) => _googleMapController = controller,
// //         markers: Set.from(_markers),
// //       ),
// //       floatingActionButton: FloatingActionButton(
// //         backgroundColor: Theme.of(context).primaryColor,
// //         foregroundColor: Colors.black,
// //         onPressed: () => _googleMapController.animateCamera(
// //           CameraUpdate.newCameraPosition(_initialCameraPosition),
// //         ),
// //         child: const Icon(Icons.center_focus_strong),
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:location_permissions/location_permissions.dart';
// import 'package:geolocator/geolocator.dart' as locator;
// import 'package:chatapp/pages/gps.dart';

// void main() {
//   runApp(MyHomePage());
// }

// var current_lat = double.parse(lats);
// var current_lng = double.parse(longs);

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   var locationMessage = "";
//   var radius;
//   var lat;
//   var long;
//   String value = "";
//   final radiusCon = new TextEditingController();

//   bool location = false;

//   // locator.Position position;
//   // Widget _child;

//   Future<void> getPermission() async {
//     PermissionStatus permission =
//         await LocationPermissions().checkPermissionStatus();

//     if (permission == PermissionStatus.denied) {
//       await LocationPermissions().requestPermissions();
//     }
//   }

//   void getCurrentLocation() async {
//     var position = await locator.Geolocator.getCurrentPosition(
//         desiredAccuracy: locator.LocationAccuracy.high);
//     var lastPosition = await locator.Geolocator.getLastKnownPosition();
//     print(lastPosition);
//     setState(() {
//       locationMessage = "$position";
//       List<String> latlongList = locationMessage.split(',');
//       print(latlongList);
//       print(latlongList[0]);
//       lat = latlongList[0].substring(5);
//       print(latlongList[1]);
//       print(lat);
//       long = latlongList[1].substring(6);
//       print(long);
//     });
//   }

//   Set<Marker> _markers = {};

//   @override
//   void initState() {
//     super.initState();
//     _markers.add(Marker(
//         markerId: MarkerId('myMarker'),
//         infoWindow: const InfoWindow(title: 'Your Location'),
//         draggable: false,
//         onTap: () {
//           print('Your Location');
//         },
//         position: LatLng(current_lat, current_lng)));
//   }

//   // void _onMapCreated(GoogleMapController controller) {
//   //   setState(() {
//   //     _markers.add(
//   //       Marker(
//   //           markerId: MarkerId('id-1'),
//   //           position: LatLng(12.97, 77.59),
//   //     ),
//   //     );
//   //   });
//   // }

//   static const _initialCameraPosition = CameraPosition(
//     target: LatLng(12.8617,77.6609),
//     zoom: 15.0,
//   );

//   GoogleMapController _googleMapController;

//   // @override
//   // void dispose() {
//   //   _googleMapController.dispose();
//   //   super.dispose();
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: new AppBar(
//         backgroundColor: Color(0xffdd8e58),
//         title: new Text('Maps'),
//         centerTitle: true,
//         elevation: 0,
//       ),
//       body: GoogleMap(
//         myLocationButtonEnabled: false,
//         zoomControlsEnabled: false,
//         initialCameraPosition: _initialCameraPosition,
//         onMapCreated: (controller) => _googleMapController = controller,
//         // _onMapCreated,
//         markers: Set.from(_markers),
//       ),
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: Theme.of(context).primaryColor,
//         foregroundColor: Colors.black,
//         onPressed: () => _googleMapController.animateCamera(
//           CameraUpdate.newCameraPosition(_initialCameraPosition),
//         ),
//         child: const Icon(Icons.center_focus_strong),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location_permissions/location_permissions.dart';
import 'package:geolocator/geolocator.dart' as locator;



void main() {
  runApp(MyHomePage());
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var locationMessage = "";
  var radius;
  var lat;
  var long;
  String value;
  final radiusCon = new TextEditingController();

  bool location = false;

  locator.Position position;
  Widget _child;

  Future<void> getPermission() async {
    PermissionStatus permission =
        await LocationPermissions().checkPermissionStatus();

    if (permission == PermissionStatus.denied) {
      await LocationPermissions().requestPermissions();
    }
  }

  void getCurrentLocation() async {
    var position = await locator.Geolocator.getCurrentPosition(desiredAccuracy: locator.LocationAccuracy.high);
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
      position: LatLng(12.8618987, 77.6607389)
      
    ));
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
    target: LatLng(12.8618987, 77.6607389),
    zoom: 15.0,
  );

  GoogleMapController _googleMapController;

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
        backgroundColor: Theme
            .of(context)
            .primaryColor,
        foregroundColor: Colors.black,
        onPressed: () =>
            _googleMapController.animateCamera(
              CameraUpdate.newCameraPosition(_initialCameraPosition),
            ),
        child: const Icon(Icons.center_focus_strong),
      ),
    );
  }
}
