import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location_permissions/location_permissions.dart';
import 'package:chatapp/Take_me_Somewhere/pages/preference.dart';

var position;

class gpsApp extends StatelessWidget {
  static final String title = 'Forms & Validation';

  @override
  Widget build(BuildContext context) => MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xffe5d1b8)),
      home: gps(),
      routes: {
        '/preference': (context) => MainPage(),
      });
}

class gps extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return gpsState();
  }
}
var lats;
var longs;
late String lati;
late String longi;

class gpsState extends State<gps> {
  var locationMessage = "";
  var radius;
  // var lats;
  // var longs;
  String value = "";
  final radiusCon = new TextEditingController();

  bool location = false;

  Future<void> getPermission() async {
    PermissionStatus permission =
    await LocationPermissions().checkPermissionStatus();

    if (permission == PermissionStatus.denied) {
      await LocationPermissions().requestPermissions();
    }
  }

  void getCurrentLocation(BuildContext context) async {
    position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    var lastPosition = await Geolocator.getLastKnownPosition();
    // print(lastPosition);
    print(position.latitude);
    print(position.longitude);
    setState(() {
      locationMessage = "$position";
      List<String> latlongList = locationMessage.split(',');
      // print(latlongList);
      // print(latlongList[0]);
      // latlongList = latlongList[0].substring(5);
      // print(latlongList[1]);
      // print(lats);
      longs = latlongList[1].substring(6);
      // print(longs);
    });
    Navigator.pushNamed(context, '/preference');
  }

  // void callfoursquare() {
  //   setState(() {
  //     radius = radiusCon.text;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Colors.blue[900],
        title: Text('Get Location'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Color(0xffdd8e58),

      ),
      body: Center(
        //child: Padding(
        // padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(), //top: 110.0),
              child: Icon(
                Icons.location_on,
                size: 120.0,
                color: Color(0xff2b2129),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Text(
              "Allow your location",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              "We will need your location to give you better experience",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(
              height: 40.0,
            ),
            ElevatedButton(
                onPressed: () async {
                  var position = await Geolocator.getCurrentPosition(
                      desiredAccuracy: LocationAccuracy.high);
                  var lastPosition = await Geolocator.getLastKnownPosition();
                  // print(lastPosition);
                  setState(() {
                    locationMessage = "$position";
                    List<String> latlongList = locationMessage.split(',');
                    // print(latlongList);
                    // print(latlongList[0]);
                    // lats = latlongList[0].substring(10);
                    lati = latlongList[0].substring(9).toString();
                    // print(latlongList[1]);
                    // print(lats);
                    //longs = latlongList[1].substring(12);
                    longi = latlongList[1].substring(11).toString();
                    // print(longs);
                  });
                  Navigator.pushNamed(context, '/preference');
                },
                child: Text(
                  "Get user location",
                  style: TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xff2b2129),
                )),
          ],
        ),
      ),
      //),
      //),
    );
  }
}
