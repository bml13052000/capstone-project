import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:chatapp/Take_me_Somewhere/pages/display_route_dist.dart';
import 'package:chatapp/Take_me_Somewhere/pages/display_route_time.dart';
import 'package:chatapp/Take_me_Somewhere/pages/new_recommendation.dart';
import 'package:chatapp/Take_me_Somewhere/pages/gps.dart';

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

// String MainURL = "http://192.168.1.20:8000";
String MainURL = "http://aditi21.pythonanywhere.com";



SendDataDistance()async{
  // print(lat);
  // print(lats);
  // lat.insert(0, lats);
  // print(lat);
  // // print(lng);
  // print(longs);
  // lng.insert(0, longs);
  // print(lng);
  // title.insert(0, 'Current Location');
  // print(title);
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
    // print(coords_dist);
    return dist_path;
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
    // print(coords_time);
    return time_path;
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
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: ElevatedButton(
                    onPressed: (){
                      SendDataDistance();
                    },
                    child: Text('Find path by distance'),
                    style: ElevatedButton.styleFrom(shape: StadiumBorder(), primary: Colors.brown)
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Column(
                    children: <Widget> [
                        Text(route_dist,
                            style: TextStyle(fontWeight: FontWeight.bold,
                                              color: Colors.grey.withOpacity(1.0),
                                              fontSize: 12,
                                        ),),
                    ]
                    ),
                ),
                Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Column(
                    children: <Widget> [
                        Text(r,
                        style: TextStyle(fontWeight: FontWeight.bold,
                                              color: Colors.grey.withOpacity(1.0),
                                              fontSize: 12,
                                        ),),
                    ]
                    ),
                ),
                Padding(
                  padding: EdgeInsets.all(30.0),
                  child: ElevatedButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => DispRoute(coords_dist,),));
                    },
                    child: Text('Show in Maps'),
                    style: ElevatedButton.styleFrom(shape: StadiumBorder(), primary: Colors.brown)
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: ElevatedButton(
                    onPressed: (){
                      SendDataTime();
                    },
                    child: Text('Find path by time'),
                    style: ElevatedButton.styleFrom(shape: StadiumBorder(), primary: Colors.brown)
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Column(
                    children: <Widget> [
                        Text(route_time,
                        style: TextStyle(fontWeight: FontWeight.bold,
                                              color: Colors.grey.withOpacity(1.0),
                                              fontSize: 12,
                                        ),),
                    ]
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Column(
                    children: <Widget> [
                        Text(t,
                        style: TextStyle(fontWeight: FontWeight.bold,
                                              color: Colors.grey.withOpacity(1.0),
                                              fontSize: 12,
                                        ),),
                    ]
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(30.0),
                  child: ElevatedButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => DispTime(coords_time,),));
                    },
                    child: Text('Show in Maps'),
                    style: ElevatedButton.styleFrom(shape: StadiumBorder(), primary: Colors.brown)
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}