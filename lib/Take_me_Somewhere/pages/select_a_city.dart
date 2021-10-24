import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:chatapp/Take_me_Somewhere/models/city_data.dart';

import 'package:flutter/services.dart';
import 'package:chatapp/Take_me_Somewhere/pages/gps.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'Forms & Validation';

  @override
  Widget build(BuildContext context) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: title,
          theme: ThemeData(
              //primarySwatch: Colors.deepPurple,
              scaffoldBackgroundColor: const Color(0xffe5d1b8)),
          home: FormTypeAheadPage(),
          routes: {
            '/gps': (context) => gpsApp(),
          });
}

class FormTypeAheadPage extends StatefulWidget {
  @override
  _FormTypeAheadPageState createState() => _FormTypeAheadPageState();
}

String selectedCity = "";
String selectedradius = "";

class _FormTypeAheadPageState extends State<FormTypeAheadPage> {
  final formKey = GlobalKey<FormState>();
  final controllerCity = TextEditingController();
  final controllerFood = TextEditingController();

  // String selectedCity = "";

  //String? selectedradius;
/*
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Select a city'),
        ),
        body: SafeArea(
          /*child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage("images/image.jpg"),
              fit: BoxFit.cover,
            )),*/
            child: Center(
              child: Container(
                padding: EdgeInsets.all(24),
                child: Form(
                  key: formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        buildCity(),
                        SizedBox(height: 16),
                        buildFood(),
                        SizedBox(height: 12),
                        buildSubmit(context)
                      ],
                    ),
                  ),
                ),
              ),
            ),

        ),
      );

*/
  /* @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text('Select  a city')),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: <Widget>[
              Container(
                child: ListView(
                    // height:100,
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            image: DecorationImage(
                              image: AssetImage('images/photo.jpeg'),
                              fit: BoxFit.cover,
                            )),
                      ),
                    ]),
              ),
            ],
          ),
        ),
      );*/

  // works

  /*
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(20.0),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(width: 10.0),
            Expanded(
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    image: DecorationImage(
                      image: AssetImage('images/image.jpg'),
                      fit: BoxFit.cover,
                    )),
              ),

              // )Image.asset('images/image.jpg'),
            ),
            SizedBox(width: 10.0),
            Expanded(
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    image: DecorationImage(
                      image: AssetImage('images/image.jpg'),
                      fit: BoxFit.cover,
                    )),
              ),

              // )Image.asset('images/image.jpg'),
            ),
            SizedBox(width: 10.0),
            Expanded(
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    image: DecorationImage(
                      image: AssetImage('images/image.jpg'),
                      fit: BoxFit.cover,
                    )),
              ),

              // )Image.asset('images/image.jpg'),
            ),
            SizedBox(width: 10.0),
            Expanded(
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    image: DecorationImage(
                      image: AssetImage('images/image.jpg'),
                      fit: BoxFit.cover,
                    )),
              ),

              // )Image.asset('images/image.jpg'),
            ),
            SizedBox(width: 10.0),
          ],
        )
      ],
    )));
  }

   */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      //resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("Select a city"),
        backgroundColor: Color(0xffdd8e58),
      ),
      body: Center(
        child: Stack(
          children: <Widget>[
            Container(
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: new AssetImage("assets/images/background.PNG"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              //color: Color.fromRGBO(196, 150, 170, 0.6),
              color: Color(0x88e5d1b8),
            ),

            /*Flexible(
          fit: FlexFit.tight,
          child:*/
            Column(
              //mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /* Padding(
                  padding: const EdgeInsets.all(10.0),
                ),

                Padding(padding: EdgeInsets.all(24)),*/
                Text(
                  "Search City and Enter Radius",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),

                Container(
                  padding: EdgeInsets.all(15),
                  child: Form(
                    key: formKey,
                    //child: SingleChildScrollView(
                    child: Column(
                      children: [
                        buildCity(),
                        SizedBox(height: 16),
                        buildFood(),
                        SizedBox(height: 12),
                        buildSubmit(context)
                      ],
                    ),
                  ),
                ),
                //),
              ],
            ),
            // ),
          ],
        ),
      ),
    );
  }

  Widget buildCity() => Stack(
        children: <Widget>[
          Container(
              //color: Color.fromRGBO(196, 150, 170, 0.6),
              ),
          TypeAheadFormField<String>(
            textFieldConfiguration: TextFieldConfiguration(
              controller: controllerCity,
              decoration: InputDecoration(
                labelText: 'City',
                border: OutlineInputBorder(),
              ),
              style: TextStyle(fontSize: 18),
            ),
            suggestionsCallback: CityData.getSuggestions,
            itemBuilder: (context, String suggestion) => ListTile(
              title: Text(
                suggestion,
                //style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              //tileColor: Color.fromRGBO(196, 150, 170, 0.6),
            ),
            onSuggestionSelected: (String suggestion) =>
                controllerCity.text = suggestion,
            validator: (value) =>
                value != null && value.isEmpty ? 'Please select a city' : null,
            onSaved: (value) => selectedCity = value.toString(),
          ),
        ],
      );
  bool _validate = false;
  Widget buildFood() => TextFormField(
        // obscureText: true,
        //autofocus: true,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Enter the distance',
          errorText: _validate ? 'Value cant be empty' : null,
        ),
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        validator: (text) {
          if (text == null || text.isEmpty) {
            return 'Text is empty';
          }
          return null;
        },
        onSaved: (value) {
          selectedradius = value.toString();
          //print('Value for field  saved as "$value"');
          print(selectedradius);
        },
      );
  /*Widget buildFood() => TypeAheadFormField<String?>(
        textFieldConfiguration: TextFieldConfiguration(
          //controller: controllerFood,
          decoration: InputDecoration(
            labelText: 'Radius',
            border: OutlineInputBorder(),
          ),
        ),
        suggestionsCallback: FoodData.getSuggestions,
        itemBuilder: (context, String? suggestion) => ListTile(
          title: Text(suggestion!),
          tileColor: Color.fromRGBO(196, 150, 170, 0.6),
        ),
        onSuggestionSelected: (String? suggestion) =>
            controllerFood.text = suggestion!,

        validator: (value) =>
            value != null && value.isEmpty ? 'Please select radius' : null,
        onSaved: (value) => selectedradius = value,
      );
  */

  Widget buildSubmit(BuildContext context) => ElevatedButton(
        child: Text(
          'Submit',
          style: TextStyle(fontSize: 26.0),
        ),
        onPressed: () {
          final form = formKey.currentState;

          if (form!.validate()) {
            form.save();
            Navigator.pushNamed(context, '/gps');

            /* ScaffoldMessenger.of(context)
              ..removeCurrentSnackBar()
              ..showSnackBar(SnackBar(
                content: Text(
                    'Your Favourite City is $selectedCity\nYour Favourite Food is $selectedFood'),
              ));*/
          }
        },
        style: ElevatedButton.styleFrom(
          primary: Color(0xff2b2129),
        ),
      );
}
