import 'dart:async';
// import 'package:authentification/Click_a_pic/click_pic.dart';
// import 'package:authentification/Start.dart';
// import 'package:authentification/chatroomsScreen.dart';
//import 'package:country_picker/country_picker.dart';
import 'package:chatapp/Take_me_Somewhere/pages/new_home.dart';
import 'package:chatapp/Take_me_Somewhere/pages/new_recommendation.dart';
import 'package:chatapp/services/auth.dart';
import 'package:chatapp/views/chatrooms.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:authentification/Start.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:geolocator/geolocator.dart';

import 'Click a picture/clickpic.dart';
import 'helper/authenticate.dart';
//import 'package:searchable_dropdown/searchable_dropdown.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late User user;
  bool isloggedin = false;
  late String country;

  Completer<GoogleMapController> _controllerGoogleMap = Completer();
  //GoogleMapController newGoogleMapController;
  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  late GoogleMapController newGoogleMapController;

  late Position currentPosition;
  var geoLocator = Geolocator();
  //var _controllerGoogleMap;
  // var _kGooglePlex;

  Future<String?> getCurrentUID() async{
    //return (await _auth.currentUser().uid);
    user = await _auth.currentUser!;
    return(user.displayName);
  }

  void locatePosition() async {
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.best,
    );
    currentPosition = position;

    LatLng userPosition = LatLng(position.latitude, position.longitude);

    CameraPosition cameraPosition =
    new CameraPosition(target: userPosition, zoom: 14);
    newGoogleMapController
        .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }

  final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  checkAuthentification() async {
    _auth.authStateChanges().listen((user) {
      if (user == null) {
        Navigator.of(context).pushReplacementNamed("start");
      }
    });
  }

  getUser() async {
    User firebaseUser =  await _auth.currentUser!;
    await firebaseUser.reload();
    firebaseUser = await _auth.currentUser!;

    if (firebaseUser != null) {
      setState(() {
        this.user = firebaseUser;
        this.isloggedin = true;
      });
    }
  }


  signOut() async {
    _auth.signOut();

    final googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
  }

  @override
  void initState() {
    super.initState();
    this.checkAuthentification();
    this.getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          title: Text("Tourist Login"),
          backgroundColor: Colors.orange,
        ),
        drawer: Container(
          color: Colors.white,
          width: 255.0,
          child: Drawer(
            child: ListView(
              children: [
                Container(
                  height: 165.0,
                  child: DrawerHeader(
                    decoration: BoxDecoration(color: Colors.white),
                    child: Expanded(
                      child: Row(
                        children: [
                          //  Image.asset("images/user_icon.svg", height: 20.0, width:20.0,),
                          //  SizedBox(width:10.0,),
                          Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // SizedBox(
                                  //   height: 5.0,
                                  // ),
                                  FutureBuilder(
                                      future:getCurrentUID(),
                                      builder: (BuildContext context,AsyncSnapshot data){
                                        return Text(data.data);
                                      }
                                  )
                                  ,

                                  // SizedBox(
                                  //   height: 0.0,
                                  // ),
                                  CircleAvatar(
                                    backgroundColor: Colors.blueGrey, radius:25,
                                  ),
                                  SizedBox(height: 5.0),
                                  ElevatedButton(
                                      onPressed: (){
                                        AuthService().signOut();
                                        Navigator.pushReplacement(context,
                                            MaterialPageRoute(builder: (context) => Authenticate()));
                                      }, child: Text("Sign Out"))
                                ],
                              ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Divider(),
                SizedBox(
                  height: 50.0,
                ),
                ListTile(
                  leading: Icon(Icons.history),
                  title: Text(
                    "Previous Trips",
                    style: TextStyle(fontSize: 15.0),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.person),
                  title: Text(
                    "Visit Profile",
                    style: TextStyle(fontSize: 15.0),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.info),
                  title: Text(
                    "About",
                    style: TextStyle(fontSize: 15.0),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Stack(
            children: [
              GoogleMap(
                mapType: MapType.normal,
                myLocationEnabled: true,
                initialCameraPosition: _kGooglePlex,
                myLocationButtonEnabled: true,
                zoomGesturesEnabled: true,
                zoomControlsEnabled: true,
                onMapCreated: (GoogleMapController controller) {
                  _controllerGoogleMap.complete(controller);
                  newGoogleMapController = controller;

                  locatePosition();
                },
              ),

              Positioned(
                left: 0.0,
                right: 0.0,
                bottom: 0.0,
                child: Container(
                    height: 320.0,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(18.0), topRight: Radius.circular(18.0)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                            blurRadius: 16.0,
                            spreadRadius: 0.5,
                            offset: Offset(0.7,0.7),
                          )
                        ]
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 18.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 6.0),
                            Text("hey there", style: TextStyle(fontSize: 10.0),),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context, MaterialPageRoute(builder: (context) => ClickPicture(title: "Click A Picture")));

                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 16),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    gradient: LinearGradient(
                                      colors: [
                                        const Color(0xff6D4C41),
                                        const Color(0xff3E2723)
                                      ],
                                    )),
                                width: MediaQuery.of(context).size.width,
                                child: Text(
                                  "Recognize this place - Audio Tour",
                                  //style: biggerTextStyle(),
                                  style: TextStyle(
                                    color: Colors.white54,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 16,
                            ),

                            GestureDetector(
                              onTap: (


                                  //                 onPressed: () {
                                  //                 Navigator.push(
                                  //                 context,
                                  //                 MaterialPageRoute(builder: (context) => ChatRoom()),

                                  ) {

                                Navigator.push(
                                    context, MaterialPageRoute(builder: (context) => HomePageOne()));


                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 16),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    gradient: LinearGradient(
                                      colors: [
                                        const Color(0xff6D4C41),
                                        const Color(0xff3E2723)
                                      ],
                                    )),
                                width: MediaQuery.of(context).size.width,
                                child: Text(
                                  "Take me somewhere!",
                                  //style: biggerTextStyle(),
                                  style: TextStyle(
                                    color: Colors.white54,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 16,
                            ),

                            GestureDetector(
                              onTap: (){
                                Navigator.push(
                                    context, MaterialPageRoute(builder: (context) => ChatRoom()));
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 16),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    gradient: LinearGradient(
                                      colors: [
                                        const Color(0xff6D4C41),
                                        const Color(0xff3E2723)
                                      ],
                                    )),

                                width: MediaQuery.of(context).size.width,
                                child: Text(
                                  "Connect with local guide",
                                  //style: biggerTextStyle().
                                  style: TextStyle(
                                    color: Colors.white54,
                                  ),
                                  textAlign: TextAlign.center,

                                ),
                              ),
                            ),
                            SizedBox(
                              height: 16,
                            ),


                            //       Text("Connect with a guide right away or discuss for a future trip", style: TextStyle(fontSize: 15.0),),
                            //       SizedBox(height: 20.0),
                            //       Container(
                            //          decoration: BoxDecoration(
                            //          color: Colors.white,
                            //          borderRadius: BorderRadius.circular(5.0),
                            //          boxShadow: [
                            //          BoxShadow(
                            //           color: Colors.black54,
                            //           blurRadius: 6.0,
                            //           spreadRadius: 0.5,
                            //           offset: Offset(0.7,0.7),
                            //         )
                            //   ]
                            // ),
                            //         child: Row(
                            //         children: [
                            //           Icon(Icons.search, color: Colors.yellowAccent,),
                            //           SizedBox(width:10.0,),
                            //           TextButton(
                            //               child: Text('Search Country'),
                            //             onPressed:(){
                            //               showCountryPicker(
                            //                 context: context,
                            //                 countryListTheme: CountryListThemeData(
                            //                   flagSize: 25,
                            //                   backgroundColor: Colors.white,
                            //                   textStyle: TextStyle(fontSize: 16, color: Colors.blueGrey),
                            //                   //Optional. Sets the border radius for the bottomsheet.
                            //                   borderRadius: BorderRadius.only(
                            //                     topLeft: Radius.circular(20.0),
                            //                     topRight: Radius.circular(20.0),
                            //                   ),
                            //                   //Optional. Styles the search field.
                            //                   inputDecoration: InputDecoration(
                            //                     labelText: 'Search',
                            //                     hintText: 'Start typing to search',
                            //                     prefixIcon: const Icon(Icons.search),
                            //                     border: OutlineInputBorder(
                            //                       borderSide: BorderSide(
                            //                         color: const Color(0xFF8C98A8).withOpacity(0.2),
                            //                       ),
                            //                     ),
                            //                   ),
                            //                 ),
                            //                 onSelect: (Country country) => print('Select country: ${country.displayName}'),
                            //               );
                            //             },
                            //           ),
                            //                ElevatedButton(
                            //                 onPressed: () {
                            //                 Navigator.push(
                            //                 context,
                            //                 MaterialPageRoute(builder: (context) => ChatRoom()),
                            //                 );
                            //             })
                            //         ]
                            //     ),

                            //       ),
                          ]
                      ),
                    )
                ),
              ),
            ])
    );
  }


}

