import 'package:flutter/material.dart';
import 'package:chatapp/Take_me_Somewhere/pages/Place.dart';

class PlaceCard extends StatelessWidget {
  const PlaceCard(
      {
      /*Key key,*/
      required this.place,
      required this.tapEvent}) /*: super(key: key)*/;

  final Place place;
  final GestureTapCallback tapEvent;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tapEvent,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
        child: Stack(
          children: [
            Hero(
                tag: place.id,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    place.image,
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                )),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: double.infinity,
                  height: 50,
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                  //decoration: cardInfoDecoration,

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Column(
                            children: [
                              Text(
                                place.name,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700),
                              ),
                              Text(
                                place.location,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
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
                      //   size: 15,
                      //   isReadOnly: true,
                      //   color: kRatingStarColor,
                      //   borderColor: kRatingStarColor,
                      // )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
      // onTap: tapEvent,
      // // margin: EdgeInsets.only(right: 30),
      // // width: double.infinity,
      // // decoration: BoxDecoration(
      // //   borderRadius: BorderRadius.circular(15),
      // //   image: DecorationImage(
      // //     image: AssetImage(place.image),
      // //     fit: BoxFit.cover
      // //   )
      // //),
      // child: Column(
      //   mainAxisAlignment: MainAxisAlignment.end,
      //   children: [
      //     Container(
      //       width: double.infinity,
      //       height: 80,
      //       padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      //       //decoration: cardInfoDecoration,

      //       child: Column(
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         children: [
      //           Row(
      //             children: [
      //               Column (
      //               children: [
      //                 Text(
      //                   place.name,
      //                   style: TextStyle(
      //                     color: Colors.white,
      //                     fontSize: 20,
      //                     fontWeight: FontWeight.w700
      //                   ),
      //                 ),
      //                 Text(
      //                   place.location,
      //                   style: TextStyle(
      //                     color: Colors.grey[200],
      //                     fontSize: 15,
      //                     fontWeight: FontWeight.w700
      //                   ),
      //                 ),
      //               ],
      //               ),

      //               Spacer(),

      //               //LikedButton()
      //             ],
      //           ),

      //           // SmoothStarRating(
      //           //   allowHalfRating: false,
      //           //   onRated: (v) {},
      //           //   starCount: 5,
      //           //   rating: place.rating,
      //           //   size: 20,
      //           //   isReadOnly: true,
      //           //   color: kRatingStarColor,
      //           //   borderColor: kRatingStarColor,
      //           // )
      //         ],
      //       ),
      //     )
      //   ],
      // ),
    );
  }
}
