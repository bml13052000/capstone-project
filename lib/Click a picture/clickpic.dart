import 'dart:convert';
import 'dart:core';
// import 'dart:html';
//import 'dart:html';
import 'dart:io' as io;
import 'dart:async';
import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';


class ClickPicture extends StatefulWidget {
  final String title;
  const ClickPicture({Key? key, required this.title}) : super(key: key);

  @override
  _ClickPictureState createState() => _ClickPictureState();
}

class _ClickPictureState extends State<ClickPicture> {
  var _imageFile;
  final String uploadUrl = 'http://192.168.140.75:5000/giveinfo';
  final ImagePicker _picker = ImagePicker();
  var _futurepost;
  late String description,title;
  final FlutterTts flutterTts= FlutterTts();

  // File selectedImage;


  Future<void> retriveLostData() async {
    final LostData response = await _picker.getLostData();
    if (response.isEmpty) {
      return;
    }
    if (response.file != null) {
      setState(() {
        _imageFile = response.file;
      });
    } else {
      print('Retrieve error ' + response.exception!.code);
    }
  }


  Widget _previewImage() {
    if (_imageFile != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 1,
                child: Image.file( io.File(_imageFile.path))),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
              onPressed: (){
                setState(() {
                  _futurepost=_uploadImage(io.File(_imageFile.path));
                });

              },
              child: const Text('Upload'),
            ),

          ],
        ),
      );
    } else {
      return const Text(
        'You have not yet picked an image.',
        textAlign: TextAlign.center,
      );
    }
  }

  void _pickImage(ImageSource source) async {
    try {
      final pickedFile = await _picker.getImage(source: source);
      //selectedImage=io.File(pickedFile.path) as File;
      setState(() {
        _imageFile = pickedFile;
      });
    } catch (e) {
      print("Image picker error " + e.toString());
    }
  }

  Future<void> _uploadImage(io.File image)async {
    var response;
    createAlertDialog(context, "Please wait", LinearProgressIndicator());
    if(image!=null) {
      String path = image.path;
      var name = path.substring(path.lastIndexOf("/") + 1, path.length);
      var suffix = name.substring(name.lastIndexOf(".") + 1, name.length);
      FormData formData = FormData.fromMap({
        "image": await MultipartFile.fromFile(path, filename: name)
      });
      try{
      Dio dio = new Dio();
      response = await dio.post<String>(
          "https://smaarak-vision.herokuapp.com/giveinfo", data: formData);
      if (response.statusCode == 201) {
        Fluttertoast.showToast(
            msg: 'Done!',
            gravity: ToastGravity.BOTTOM,
            textColor: Colors.grey[800]);
        //return myResponseFromJson(response.data.toString());

        title = jsonDecode(response.data.toString())['title'];
        description = jsonDecode(response.data.toString())['description'];
        //loadingdone = true;
        print(title);
        print(description);
        Navigator.of(context).pop();
        createAlertDialog(context, title, Text(description));
      }}
      catch(e){
        Navigator.of(context).pop();
        createErrorAlertDialog1(context, "Image description not found");
      }
      // if (response.statusCode == 201) {
      //   Fluttertoast.showToast(
      //       msg: 'Done!',
      //       gravity: ToastGravity.BOTTOM,
      //       textColor: Colors.grey[800]);
      //   return myResponseFromJson(response.data.toString());
      // }
      // else {
      //   throw Exception("Bad request");
      //   }
    }
    }


  createAlertDialog(BuildContext context, String string1, Widget widget){
    return showDialog(context: context, builder: (context){
      return AlertDialog(
        title: Text(string1),
        content: widget,
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Center(
                    child: TextButton(
                      onPressed: (){
                        Navigator.of(context).pop();
                      },
                      child: Text("OK"),
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: TextButton.icon(
                      onPressed: ()async{
                        await flutterTts.setLanguage("en-US");
                        await flutterTts.setPitch(1);
                        await flutterTts.speak(description);
                      },
                      label: Text(""),
                      icon: Icon(Icons.volume_up),
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: TextButton.icon(
                      onPressed: ()async{
                        await flutterTts.stop();
                      },
                      label: Text(""),
                      icon: Icon(Icons.volume_off),
                    ),
                  ),
                )

              ],
            ),
          ),

        ],
      );
    });
  }

  createErrorAlertDialog1(BuildContext context, String message){
    return showDialog(context: context, builder: (context){
      return AlertDialog(
        title: Text("Error"),
        content: Text(message),
        actions: [
          ElevatedButton(
            onPressed: (){
              Navigator.of(context).pop();
            },
            child: Text("OK"),
          ),
        ],
      );
    });
  }

  // popupMenu

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: FutureBuilder<void>(
                    future: retriveLostData(),
                    builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.none:
                        case ConnectionState.waiting:
                          return CircularProgressIndicator();
                        case ConnectionState.done:
                          return _previewImage();
                        default:
                          return const Text('Picked an image');
                      }
                    },
                  ),
                ),

              ],
            )
        ),
      ),
      floatingActionButton: PopupMenuButton(
        color: Colors.orange,
        icon: Icon(Icons.add_a_photo),
        // child: Center(child: Text('click here')),
        itemBuilder: (context) =>[
          PopupMenuItem(child: Text("Click a picture"),value: 0,),
          PopupMenuItem(child: Text("Pick From Gallery"),value: 1,)
        ],
        onSelected: (value){
          if(value==0){
            _pickImage(ImageSource.camera);
          }
          else{
            _pickImage(ImageSource.gallery);
          }
        },
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
  }






