import 'package:flutter/material.dart';
//import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:chatapp/Take_me_Somewhere/pages/Locations.dart';
//import 'package:travel_app/Screens/home/components/liked_button.dart';
//import 'package:travel_app/constants.dart';
//import 'package:travel_app/util.dart';

class LocationCard extends StatelessWidget {
  const LocationCard(/*Key key,*/ @required this.location) /*: super(key: key)*/;

  final Location location;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 30),
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
              image: AssetImage(location.image), fit: BoxFit.cover)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: double.infinity,
            height: 60,
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            //decoration: cardInfoDecoration,

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          location.name,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          location.location,
                          style: TextStyle(
                              color: Colors.grey[200],
                              fontSize: 15,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),

                    Spacer(),

                    //LikedButton()
                  ],
                ),

                // SmoothStarRating(
                //   allowHalfRating: false,
                //   onRated: (v) {},
                //   starCount: 5,
                //   rating: place.rating,
                //   size: 20,
                //   isReadOnly: true,
                //   color: kRatingStarColor,
                //   borderColor: kRatingStarColor,
                // )
              ],
            ),
          )
        ],
      ),
    );
  }
}
