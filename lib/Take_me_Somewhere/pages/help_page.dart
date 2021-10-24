import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:flutter/cupertino.dart';


class Help extends StatefulWidget {
  @override
  _HelpState createState() => _HelpState();
}

class _HelpState extends State<Help> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xffdd8e58),
        title: Text('Help'),
        centerTitle: true,
        elevation: 0,
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
      return SafeArea(child: SingleChildScrollView(child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 30),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
            Text(
              "Need Help?",
              style: TextStyle(
                color: Colors.red[200],
                fontSize: 30.0,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],),
          SizedBox(height: 50,),
          Text("1) Provide your current location.\n\n"
                "2) Provide the city and radius within which you would like to visit the places.\n\n"
                "3) Provide your preferences of the type of places you are interested in visiting.\n\n"
                "4) You will be provided a list of places near you that you can visit.\n\n"
                "5) Select the places you would like to visit and submit.\n\n"
                "6) Based on the places that you have selected you will be presented with an optimal route that you can take to visit all the places.\n",
                style: TextStyle(
              fontStyle: FontStyle.italic,
              fontSize: 20,
              fontWeight: FontWeight.w500
            ),),
          ],
      ),
      ),
      ),
      );
  }
}