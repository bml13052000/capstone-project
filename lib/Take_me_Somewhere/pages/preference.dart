import 'package:flutter/material.dart';
//import 'package:smaarak/pages/destination_main.dart';
//import 'package:chatapp/pages/recommendation_main.dart';
import 'package:chatapp/Take_me_Somewhere/pages/new_recommendation.dart';

List category = [];

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final allChecked = CheckBoxModal(title: 'Select All');

  final checkBoxList = [
    CheckBoxModal(title: 'Art'),
    CheckBoxModal(title: 'Nature'),
    CheckBoxModal(title: 'Museums'),
    CheckBoxModal(title: 'Health'),
    CheckBoxModal(title: 'Amusement Parks'),
    CheckBoxModal(title: 'Entertainment and Games'),
    CheckBoxModal(title: 'Sites'),
    //CheckBoxModal(title: 'Religious Sites'),
    //CheckBoxModal(title: 'Other'),
  ];

  @override
  void initState() {
    super.initState();
    setState(() {});
    category = [];
  }

  void Apirequest() async {
    for (var i = 0; i < 7; i++) {
      if (checkBoxList[i].value) {
        category.add(checkBoxList[i].title);
      } else {
        category.remove(checkBoxList[i].title);
      }
    }
    Navigator.pushNamed(context, '/place_recommendation');
    print(category);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //child: SafeArea(
        appBar: AppBar(
          title: Text('Preferences'),
          centerTitle: true,
          backgroundColor: Color(0xffdd8e58),
        ),
        body: ListView(
          children: [
            ListTile(
              onTap: () => onAllClicked(allChecked),
              leading: Checkbox(
                value: allChecked.value,
                onChanged: (value) => onAllClicked(allChecked),
              ),
              title: Text(allChecked.title,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
            Divider(),
            ...checkBoxList
                .map((item) => ListTile(
                      onTap: () => onItemClicked(item),
                      leading: Checkbox(
                        value: item.value,
                        onChanged: (value) => onItemClicked(item),
                      ),
                      title: Text(item.title,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                    ))
                .toList(),
            Padding(
              padding: EdgeInsets.all(30.0),
              child: ElevatedButton(
                onPressed: Apirequest,
                child: Text('Submit'),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xff2b2129),
                ),
              ),
            ),
          ],
          // ),
        ));
  }

  onAllClicked(CheckBoxModal ckbItem) {
    setState(() {
      allChecked.value = !allChecked.value;
    });
  }

  onItemClicked(CheckBoxModal ckbItem) {
    setState(() {
      ckbItem.value = !ckbItem.value;
    });

    //print(checkBoxList[1].value);
    //print(checkBoxList[1].title);
  }
}

class CheckBoxModal {
  String title;
  bool value;
  CheckBoxModal({required this.title, this.value = false});
}
