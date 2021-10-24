import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:chatapp/Take_me_Somewhere/pages/display_route_dist.dart';
import 'package:chatapp/Take_me_Somewhere/pages/display_route_time.dart';
import 'package:chatapp/Take_me_Somewhere/pages/new_recommendation.dart';
import 'package:chatapp/Take_me_Somewhere/pages/gps.dart';


var dist_path;
var time_path;
var route_dist = '';
var route_time = '';
var t = '';
var r = '';
var p1;
var p2;
var dist;
var time;
var coords_dist;
var route_coords_dist;
var route_coords_time;
var coords_time;

void main(){
  runApp(RouteFind());
}

class RouteFind extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RouteState();
  }
}

class RouteState extends State<RouteFind> {
// String MainURL = "http://192.168.1.20:8000";
String MainURL = "http://aditi21.pythonanywhere.com";

SendDataDistance()async{
  String url = MainURL + "/path_generation_by_distance/";
  final http.Response response = await http.post(Uri.parse(url),
  body: jsonEncode({
    "latitude": lat,
    "longitude": lng,
    "place": title
    }
  ));
  // print(lat);
  // print(lng);
  // print(title);
  if(response.statusCode == 200) {
    print(response.body);
    dist_path = response.body;
    Map<String, dynamic> d = jsonDecode(dist_path);
    p1 = d['route'];
    coords_dist = d['route_d_coords'];
    dist = d['f_dist'];
    // print(p1);
    // print(dist);
    route_dist = "$p1";
    route_coords_dist = "$coords_dist";
    r = "$dist";
    // print(coords_dist);
    for(var i=0; i<p1.length; i++) {
      coords_dist[i].add(p1[i]);
    }
    Navigator.pushNamed(context, '/order_page_dist');
    // print(coords_dist);
    // return dist_path;
  }
}

SendDataTime()async{
  String url = MainURL + "/path_generation_by_time/";
  final http.Response response = await http.post(Uri.parse(url),
  body: jsonEncode({
    "latitude": lat,
    "longitude": lng,
    "place": title
    }
  ));
  if(response.statusCode == 200) {
    print(response.body);
    time_path = response.body;
    Map<String, dynamic> d2 = jsonDecode(time_path);
    p2 = d2['route'];
    time = d2['f_time'];
    coords_time = d2['route_t_coords'];
    // print(p2);
    // print(time);
    route_time = "$p2";
    route_coords_time = "$coords_time";
    t = "$time";
    // print(coords_time);
    for(var i=0; i<p2.length; i++) {
      coords_time[i].add(p2[i]);
    }
    Navigator.pushNamed(context, '/order_page_time');
    // print(coords_time);
    // return time_path;
  }
}

@override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffdd8e58),
          title: Text('Generate Route'),
          centerTitle: true,
          elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        ),
        body: Center(
          child: Stack(
            children: <Widget>[
              Container(
                decoration: new BoxDecoration(
                  image: new DecorationImage(
                    image: new AssetImage("assets/images/background.PNG"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                color: Color(0x88e5d1b8),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [ Center(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: <Widget>[
                        Text(
                            "Search Best Route based on Distance or Time",
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                            textAlign: TextAlign.center,
                          ),
                        SizedBox(height:40),
                        Padding(
                          padding: EdgeInsets.all(20.0),
                          child: ElevatedButton(
                            onPressed: (){
                              SendDataDistance();
                            },
                            child: Text(
                              'Find path by distance',
                              style: TextStyle(
                                fontSize: 23.0,
                                fontWeight: FontWeight.w600,
                                ),
                              ),
                            style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(32.0)),
                                      minimumSize: Size(205, 50), primary: Colors.brown)
                          ),
                        ),
                        SizedBox(height:30),
                        Padding(
                          padding: EdgeInsets.all(20.0),
                          child: ElevatedButton(
                            onPressed: (){
                              SendDataTime();
                            },
                            child: Text(
                              'Find path by time',
                              style: TextStyle(
                                fontSize: 23.0,
                                fontWeight: FontWeight.w600,
                                ),
                              ),
                            style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(32.0)),
                                      minimumSize: Size(205, 50),
                            primary: Colors.brown)
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      )
    );
  }
}