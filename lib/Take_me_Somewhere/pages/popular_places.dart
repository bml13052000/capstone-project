// import 'package:flutter/material.dart';
// import 'package:tour_guide_app_project/pages/Place.dart';
// import 'package:tour_guide_app_project/pages/place_card.dart';
// import 'package:tour_guide_app_project/pages/details.dart';

// //import 'package:travel_app/constants.dart';

// class PopularPlaces extends StatefulWidget {
//   const PopularPlaces({
//     Key key,
//   }) : super(key: key);

//   @override
//   _PopularPlacesState createState() => _PopularPlacesState();
// }

// class _PopularPlacesState extends State<PopularPlaces> {
//   int currentSlider = 0;

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: double.infinity,
//       height: 260,
//       child: Column(
//         children: [
//           // Text(
//           //     "Places to Visit",
//           //     textAlign: TextAlign.left,
//           //     style: TextStyle(
//           //       fontSize: 30.0,
//           //       fontWeight: FontWeight.w600,
//           //     ),
//           //   ),
//           Expanded(
//             flex: 3,
//             child: InkWell (
//             onTap: () {
//               Navigator.push(context, MaterialPageRoute(builder: (context) => Details(place: demoPlaces[index])));
//             },
//             child: PageView.builder(
//               onPageChanged: (value) {
//                 setState(() {
//                   currentSlider = value;
//                 });
//               },
//               controller: PageController(
//                 viewportFraction: 0.8,
//                 initialPage: 0
//               ),
//               itemCount: demoPlaces.length,
//               itemBuilder: (context, index) => PlaceCard(place: demoPlaces[index]),

//             ),
//           ),
//           ),

//           // Expanded(
//           //   child: Row(
//           //     mainAxisAlignment: MainAxisAlignment.center,
//           //     children: List.generate(
//           //       demoPlaces.length,
//           //       (index) => buildDotNav(index: index)
//           //     ),
//           //   ),
//           // )
//         ],
//       ),
//     );
//   }

// //   AnimatedContainer buildDotNav({int index}) {
// //     return AnimatedContainer(
// //       duration: Duration(milliseconds: 100),
// //       margin: EdgeInsets.only(right: 5),
// //       height: 10,
// //       width: currentSlider == index ? 24 : 6,
// //       decoration: BoxDecoration(
// //         //color: currentSlider == index ? kPrimaryColor : kPrimaryColor.withAlpha(70),
// //         borderRadius: BorderRadius.circular(3)
// //       ),
// //     );
// //   }
//  }

import 'package:flutter/material.dart';
import 'package:chatapp/Take_me_Somewhere/pages/Place.dart';
import 'package:chatapp/Take_me_Somewhere/pages/responsive.dart';
import 'package:chatapp/Take_me_Somewhere/pages/place_card.dart';
import 'package:chatapp/Take_me_Somewhere/pages/details.dart';

class PopularPlaces extends StatelessWidget {
  /* const PopularPlaces(
    Key key,
  ) : super(key: key);*/

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GridView.count(
        crossAxisCount: isLandscape(context) ? 3 : 2,
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        padding: EdgeInsets.all(15),
        mainAxisSpacing: 20,
        crossAxisSpacing: 12,
        childAspectRatio: 1.2,
        children: List.generate(demoPlaces.length, (index) {
          return PlaceCard(
            place: demoPlaces[index],
            tapEvent: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Details(demoPlaces[index])));
            },
          );
        }),
      ),
    );
  }
}
