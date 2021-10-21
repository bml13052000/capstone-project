// import 'package:flutter/material.dart';
// import 'package:tour_guide_app_project/pages/Locations.dart';
// import 'package:tour_guide_app_project/pages/location_card.dart';

// class NewPlaces extends StatefulWidget {
//   const NewPlaces({
//     Key key,
//   }) : super(key: key);

//   @override
//   _NewPlacesState createState() => _NewPlacesState();
// }

// class _NewPlacesState extends State<NewPlaces> {
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
//               itemCount: demoLocations.length,
//               itemBuilder: (context, index) => LocationCard(location: demoLocations[index])
//             ),
//           ),

//           Expanded(
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: List.generate(
//                 demoLocations.length,
//                 (index) => buildDotNav(index: index)
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }

//   AnimatedContainer buildDotNav({int index}) {
//     return AnimatedContainer(
//       duration: Duration(milliseconds: 100),
//       margin: EdgeInsets.only(right: 5),
//       height: 10,
//       width: currentSlider == index ? 24 : 6,
//       decoration: BoxDecoration(
//         //color: currentSlider == index ? kPrimaryColor : kPrimaryColor.withAlpha(70),
//         borderRadius: BorderRadius.circular(3)
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:chatapp/Take_me_Somewhere/pages/Locations.dart';
import 'package:chatapp/Take_me_Somewhere/pages/location_card.dart';

class NewPlaces extends StatefulWidget {
 /* const NewPlaces(
    Key key,
  ) : super(key: key);*/

  @override
  _NewPlacesState createState() => _NewPlacesState();
}

class _NewPlacesState extends State<NewPlaces> {
  int currentSlider = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: double.infinity,
      height: 230,
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: PageView.builder(
              onPageChanged: (value) {
                setState(() {
                  currentSlider = value;
                });
              },
              controller: PageController(
                viewportFraction: 0.8,
                initialPage: 0
              ),
              itemCount: demoLocations.length,
              itemBuilder: (context, index) => LocationCard(demoLocations[index])
            ),
          ),
        ],
      ),
    );
  }
}