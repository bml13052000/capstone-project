import 'package:flutter/material.dart';
import 'package:chatapp/Take_me_Somewhere/pages/Place.dart';

class Details extends StatelessWidget {
  final Place place;

  const Details(this.place);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xffdd8e58),
        title: Text('Details'),
        centerTitle: true,
        elevation: 0,
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    return SingleChildScrollView(
      child: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 250,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(place.image), fit: BoxFit.cover),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 200),
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(50)),
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Align(
                    child: Container(
                      width: 150,
                      height: 7,
                      decoration: BoxDecoration(
                          color: Colors.red[50],
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    place.name,
                    style: TextStyle(
                        fontSize: 20, height: 1.5, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: <Widget>[
                      SizedBox(width: 5, height: 50),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Description",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 3),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    place.description,
                    style: TextStyle(height: 1.6),
                  ),
                  SizedBox(height: 40),
                  Text(
                    "Location",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    place.location,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}