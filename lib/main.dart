import 'package:chatapp/HomePage.dart';
import 'package:chatapp/Take_me_Somewhere/pages/new_home.dart';
import 'package:chatapp/helper/authenticate.dart';
import 'package:chatapp/helper/helperfunctions.dart';
import 'package:chatapp/views/chatrooms.dart';
import 'package:chatapp/views/signin.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'Take_me_Somewhere/pages/gps.dart';
import 'Take_me_Somewhere/pages/help_page.dart';
import 'Take_me_Somewhere/pages/maps.dart';
import 'Take_me_Somewhere/pages/new_recommendation.dart';
import 'Take_me_Somewhere/pages/order_disp_dist.dart';
import 'Take_me_Somewhere/pages/order_disp_time.dart';
import 'Take_me_Somewhere/pages/preference.dart';
import 'Take_me_Somewhere/pages/route.dart';
import 'Take_me_Somewhere/pages/select_a_city.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  var userIsLoggedIn=false;
  var userType=null;

  @override
  void initState() {
    getLoggedInState();
    getUserType();
    super.initState();
  }

  getLoggedInState() async {
    await HelperFunctions.getUserLoggedInSharedPreference().then((value){
      setState(() {
        userIsLoggedIn  = value;
      });
    });
  }

  getUserType() async {
    await HelperFunctions.getUserTypeSharedPreference().then((val){
      setState(() {
        userType  = val;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlutterChat',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.orange,
        scaffoldBackgroundColor: Colors.orangeAccent,
        fontFamily: "OverpassRegular",
        accentColor: Colors.orangeAccent
      ),
      routes: {
    // '/': (context) => Loading(),
        '/': (context) {
          if(userIsLoggedIn != null) {
            if(userIsLoggedIn){
              if(userType=='Tourist'){
                return HomePage();
              }
              else if (userType=='Tour Guide'){
                return ChatRoom();
              }
              else{
                return Authenticate();
              }
            }
            else{
              return Authenticate();
            }
          }
          else{
            return Container(
              child: Center(
                child: Authenticate(),
              ),
            );
          }
          },
          '/home1': (context) => HomePageOne(),
          // '/location': (context) => MygpsApp(),
          '/my_maps': (context) => MyHomePage(),
          // '/preference': (context) => MainPage(),
          '/help': (context) => Help(),
          '/show_route': (context) => RouteFind(),
          '/selectCity': (context) => FormTypeAheadPage(),
          '/gps': (context) => gps(),
          // '/preference': (context) => MainPage(),
          '/place_recommendation': (context) => HomeScreen(),
          '/preference': (context) => MainPage(),
          // '/path_map_dist': (context) => DispRoute(),
          // '/path_map_time': (context) => PathMapTime(),
          '/order_page_dist': (context) => orderPage(),
          '/order_page_time': (context) => orderPageTime(),
    }
    );
  }
}
