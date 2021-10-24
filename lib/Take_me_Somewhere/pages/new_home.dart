import 'package:flutter/material.dart';
import 'package:chatapp/Take_me_Somewhere/pages/popular_places.dart';
import 'package:chatapp/Take_me_Somewhere/pages/new.dart';

class HomePageOne extends StatefulWidget {
  @override
  _HomepageOneState createState() => _HomepageOneState();
}

class _HomepageOneState extends State<HomePageOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffdd8e58),
        title: Text('Take Me Somewhere'),
        centerTitle: true,
        elevation: 0,
      ),
      body: getBody(),
    );
  }
  Widget getBody(){
    return SafeArea(child: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: new AssetImage("assets/images/background.PNG"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          SizedBox(height: 30),
          Row(
            // child: Padding(
            // padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 30),
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            //SizedBox(width: 1),
            Text(
              "Where are you going?",
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
          ),
          SizedBox(height: 20,),
          //PlacesCategories(),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
                      child: Row(children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Column(
                  children: <Widget>[
                    RawMaterialButton(
                      onPressed: (){
                        Navigator.pushNamed(context, '/selectCity');
                      },
                      elevation: 2.0,
                      fillColor: Color(0xffdd8e58),
                      child: Icon(
                        Icons.place,
                        size: 35.0,
                        color: Colors.white,
                      ),
                      padding: EdgeInsets.all(10.0),
                      shape: CircleBorder(),
                      ),
                  ],
                ),
              ),
              SizedBox(width: 0.0),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Column(
                  children: <Widget>[
                    RawMaterialButton(
                      onPressed: (){
                        Navigator.pushNamed(context, '/my_maps');
                      },
                      elevation: 2.0,
                      fillColor: Color(0xffdd8e58),
                      child: Icon(
                        Icons.map_outlined,
                        size: 35.0,
                        color: Colors.white,
                      ),
                      padding: EdgeInsets.all(10.0),
                      shape: CircleBorder(),
                      ),
                  ],
                ),
              ),
              SizedBox(width: 0.0),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Column(
                  children: <Widget>[
                    RawMaterialButton(
                      onPressed: (){
                        Navigator.pushNamed(context, '/help');
                      },
                      elevation: 2.0,
                      fillColor: Color(0xffdd8e58),
                      child: Icon(
                        Icons.help_center_outlined,
                        size: 35.0,
                        color: Colors.white,
                      ),
                      padding: EdgeInsets.all(10.0),
                      shape: CircleBorder(),
                      ),
                  ],
                ),
              ),
            ],
            ),
          ),
          SizedBox(height: 30.0),
          // Text(
          //     "Places to Visit",
          //     textAlign: TextAlign.start,
          //     style: TextStyle(
          //       fontSize: 30.0,
          //       fontWeight: FontWeight.w600,
          //     ),
          //   ),
          // SizedBox(height: 10.0),
          
          NewPlaces(),
          SizedBox(height: 35.0),
          Text(
              "Places to Visit",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 10.0),
          PopularPlaces(),
        ],
    ),
    ) );
  }
}