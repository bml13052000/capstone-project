import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chatapp/Take_me_Somewhere/models/Destination.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_core/firebase_core.dart';

//import 'packge:flutter/services.dart';
import "package:chatapp/Take_me_Somewhere/pages/preference.dart";
import "package:chatapp/Take_me_Somewhere/pages/select_a_city.dart";
import "package:chatapp/Take_me_Somewhere/pages/gps.dart";
// import 'package:maps/maps.dart';

firebase_storage.FirebaseStorage storage =
    firebase_storage.FirebaseStorage.instance;
List<Destination> dest = [];
List<String> urls = [];
List<Destination> dest2 = [];
List<String> urls2 = [];
bool _isLoading = true;

class HomeScreen extends StatefulWidget {
  //List cat1;
  //HomeScreen(cat) : this.cat1 = cat;
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

List<String> title = [];
List lat = [];
List lng = [];
// lat.add(lats);
// lng.add(longs);
// title.add('Current Location');
// print(lat);
// print(lng);
// print(title);
// lat.add(lats);
// lng.add(longs);
// title.add('Current Location');

Future<List<String>> _retrieveDest() async {
  dest = [];
  urls = [];
  var uri = Uri.parse('http://sanjana.pythonanywhere.com/api/');
  List<String> res = ["Sites", "Museums", "Nature"];
  final response1 = await http.post(uri,
      body: jsonEncode({
        "userId": 10.toString(),
        "city": selectedCity.toString(),
        "lat": lati,
        "lng": longi,
        "radius": selectedradius.toString(),
        "prefer": category,
      }));
  if (response1.statusCode == 200) {
    //print("I am gonna cry");
    //print(selectedCity);
    //print(selectedradius);
    print(response1.body);
    //print(data);
  } else {
    print("not working");
    print(response1.body);
    //print(data);
  }
  List response = json.decode(response1.body);
  response.forEach((element) {
    dest.add(Destination.fromMap(element));
  });
  //count = dest.length.toDouble();
  print(dest.length);

  // FirebaseStorage storage = FirebaseStorage.instance;
  for (var i = 0; i < dest.length; i++) {
    /* String url = await firebase_storage.FirebaseStorage.instance
          .ref('')
          .getDownloadURL();*/

    //String url = await storage.ref().child('1d1.PNG').getDownloadURL();
    /*var ref =
        firebase_storage.FirebaseStorage.instance.ref().child('Aihole.jpg');*/
    String image = dest[i].title + '.jpg';
    /* var ref = firebase_storage.FirebaseStorage.instance.ref().child(image);
    String s = await ref.getDownloadURL();
    urls.add(s);*/
    var ref =
    firebase_storage.FirebaseStorage.instance.ref().child('Amoeba.jpg');
    String s = "";
    //works
    /* try {
      ref = firebase_storage.FirebaseStorage.instance.ref().child(image);
      s = await ref.getDownloadURL();
      //urls.add(s);
    } on Exception {
      ref = firebase_storage.FirebaseStorage.instance.ref().child('cream.jpg');
      s = await ref.getDownloadURL();
    } catch (IOException) {
      print("Exception handled");

    }*/

    try {
      ref = firebase_storage.FirebaseStorage.instance.ref().child(image);
      s = await ref.getDownloadURL();
      //urls.add(s);

    } on Exception catch (e) {
      print("Exception handled");
      ref = firebase_storage.FirebaseStorage.instance.ref().child('cream.jpg');
      s = await ref.getDownloadURL();
    }

    urls.add(s);
  }

  return urls;
}

Future<List<String>> getData() async {
  urls = await _retrieveDest();
  /*setState(() {
      _isLoading = false;
    });*/
  return urls;
}

class _HomeScreenState extends State<HomeScreen> {
  // List _cat = [];
  // _HomeScreenState(cat) : this._cat = cat;
  Text _buildRatingStars(double rating) {
    String stars = '';
    int rate = rating.floor();
    for (int i = 0; i < rate; i++) {
      stars += '⭐ ';
    }
    stars.trim();
    return Text(stars);
  }

  double count = 0.0;

  //Future<List<String>> _res;

  //final FireStorageService fire = new FireStorageService();
  Future<List<String>> res1 = getData();

  @override
  void initState() {
    super.initState();

    //Future<List<String>> res = getData();
    Firebase.initializeApp().whenComplete(() {
      print("completed");
      // setState(() {});
      //dest = [];
      //urls = [];
      title = [];
      lat = [];
      lng = [];
      lat.add(double.parse(lats));
      lng.add(double.parse(longs));
      title.add('Current Location');
      print(lat);
      print(lng);
      print(title);
    });
    //res1 = getData();
  }

  @override
  Widget build(BuildContext context) {
    var futureBuilder = new FutureBuilder(
        future: res1,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return const Center(child: CircularProgressIndicator());
            default:
              if (snapshot.hasError)
                return new Text('Error: ${snapshot.error}');
              else
                return createListView(context, snapshot);
          }
        });
    return new Scaffold(
      body: futureBuilder,
    );
  }

  Widget createListView(BuildContext context, AsyncSnapshot snapshot) {
    urls = snapshot.data;
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text('Recommendation'),
              centerTitle: true,
              backgroundColor: Color(0xffdd8e58),
            ),
            backgroundColor: Color(0xffe5d1b8),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    padding: EdgeInsets.only(top: 20.0, bottom: 15.0),
                    itemCount: dest.length,
                    itemBuilder: (BuildContext context, int index) {
                      //Activity activity = widget.destination.activities[index];
                      return Stack(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                            height: 170.0,
                            //width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Padding(
                              padding:
                              EdgeInsets.fromLTRB(120.0, 20.0, 20.0, 20.0),
                              //EdgeInsets.all(10)
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        width: 120.0,
                                        child: Text(
                                          dest[index].title,
                                          style: TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          //overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                        ),
                                      ),
                                      Checkbox(
                                        value: dest[index].isSelected,
                                        onChanged: (s) {
                                          dest[index].isSelected =
                                          !dest[index].isSelected;
                                          if (dest[index].isSelected) {
                                            title.add(dest[index].title);
                                            lat.add(dest[index].latitude);
                                            lng.add(dest[index].longitude);

                                            print(lat);
                                            print(lng);
                                            print(title);
                                          } else {
                                            title.remove(dest[index].title);
                                            lat.remove(dest[index].latitude);
                                            lng.remove(dest[index].longitude);

                                            print(lat);
                                            print(lng);
                                            print(title);
                                          }
                                          setState(() {});
                                        },
                                      )
                                    ],
                                  ),
                                  Text(
                                    dest[index].title,
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  SizedBox(height: 10.0),
                                  _buildRatingStars(dest[index].rating),
                                  SizedBox(height: 10.0),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            left: 20.0,
                            top: 15.0,
                            bottom: 15.0,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50.0),
                              child: Image(
                                width: 110.0,
                                /*image: AssetImage(
                                  "assets/agra_fort.jpg",
                                ),*/
                                image: NetworkImage(urls[index]),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),

                        ],
                      );
                    },
                  ),
                ),
                ElevatedButton(
                    onPressed: ()  {
                      Navigator.pushNamed(context, '/show_route');
                    },
                    child: Text(
                      "Get Route",
                      style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xffdd8e58),
                    ))
              ],
            )));
  }
}
