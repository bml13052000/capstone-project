import 'package:flutter/material.dart';
import 'package:chatapp/Take_me_Somewhere/pages/route.dart';
import 'package:chatapp/Take_me_Somewhere/pages/display_route_dist.dart';

class orderPage extends StatefulWidget {
  @override
  _orderPageState createState() => _orderPageState();
}

class _orderPageState extends State<orderPage> {
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Order'),
          centerTitle: true,
          backgroundColor: Color(0xffdd8e58),
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: Center(
          child: Stack(
            children: <Widget>[
              Container(
                decoration: new BoxDecoration(
                  image: new DecorationImage(
                    image: new AssetImage("images/background.PNG"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                color: Color(0x88e5d1b8),
              ),
              Column(
                    children: <Widget> [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical:80.0),
                      // SizedBox(height:120),
                      child: Text(route_dist,
                            style: TextStyle(fontWeight: FontWeight.bold,
                                              color: Colors.black.withOpacity(1.0),
                                              fontSize: 20,
                                        ),
                        ),),
                        SizedBox(height:50),
                        Text(r,
                            style: TextStyle(fontWeight: FontWeight.bold,
                                              color: Colors.black.withOpacity(1.0),
                                              fontSize: 20,
                                        ),),
                        SizedBox(height:50),
                        Padding(
                          padding: EdgeInsets.all(30.0),
                          child: ElevatedButton(
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => DispRoute(coords_dist,),));
                            },
                            
                            child: Text('Show in Maps',
                            style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w600,
                                ),),
                            style: ElevatedButton.styleFrom(shape: StadiumBorder(), 
                            minimumSize: Size(100, 50),
                            primary: Colors.brown)
                          ),
                        ),
                  
                    ],
                    )
                    ],
                    ),
                ),
                );
  }
}