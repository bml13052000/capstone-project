import 'package:chatapp/helper/constants.dart';
import 'package:chatapp/models/user.dart';
import 'package:chatapp/services/auth.dart';
import 'package:chatapp/services/database.dart';
import 'package:chatapp/views/chat.dart';
import 'package:chatapp/widget/widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {

  DatabaseMethods databaseMethods = new DatabaseMethods();
  TextEditingController searchEditingController = new TextEditingController();
  late QuerySnapshot searchResultSnapshot;
  // Future<FirebaseUser> user= FirebaseAuth.instance.currentUser();


  bool isLoading = false;
  bool haveUserSearched = false;

  initiateSearch() async {
    if(searchEditingController.text.isNotEmpty){
      setState(() {
        isLoading = true;
      });
      await databaseMethods.searchByName(searchEditingController.text)
          .then((snapshot){
            // if(searchEditingController.text!=)
            searchResultSnapshot = snapshot;
            print("$searchResultSnapshot");
            // print(AuthService().getCurrentUserdetails());
            setState(() {
              isLoading = false;
              haveUserSearched = true;
          });
      });
    }
  }

  Widget userList(){
    return haveUserSearched ? ListView.builder(
      shrinkWrap: true,
      itemCount: searchResultSnapshot.docs.length,
        itemBuilder: (context, index){
        return userTile(
            searchResultSnapshot.docs[index]['userName'],
          searchResultSnapshot.docs[index]["userEmail"],
        );
        }) : Container();
  }

  /// 1.create a chatroom, send user to the chatroom, other userdetails
  sendMessage(String userName){
    List<String> users = [Constants.myName,userName];

    String chatRoomId = getChatRoomId(Constants.myName,userName);

    Map<String, dynamic> chatRoom = {
      "users": users,
      "chatRoomId" : chatRoomId,
    };

    databaseMethods.addChatRoom(chatRoom, chatRoomId);

    Navigator.push(context, MaterialPageRoute(
      builder: (context) => Chat(
        chatRoomId: chatRoomId,
      )
    ));

  }

  Widget userTile(String userName,String userEmail){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                userName,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16
                ),
              ),
              Text(
                userEmail,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16
                ),
              )
            ],
          ),
          Spacer(),
          GestureDetector(
            onTap: (){
              sendMessage(userName);
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12,vertical: 8),
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(24)
              ),
              child: Text("Message",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16
                ),),
            ),
          )
        ],
      ),
    );
  }


  getChatRoomId(String a, String b) {
    if (a.substring(0, 1).codeUnitAt(0) > b.substring(0, 1).codeUnitAt(0)) {
      return "$b\_$a";
    } else {
      return "$a\_$b";
    }
  }

  @override
  void initState() {
    super.initState();
  }

  createAlertDialog(BuildContext context){
    return showDialog(context: context, builder: (context){
      return AlertDialog(
        title: Text("Error",
            style: TextStyle(
            fontSize: 20
        ),
        ),
        content: Text("You can't search for your own name"),
        actions: [
          Center(
            child: ButtonTheme(
              minWidth: 500,
              child: ElevatedButton(
                onPressed: (){
                  Navigator.of(context).pop();
                },
                child: Text("BACK"),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0)
                    )
                  )
                ),

              ),
            ),
          ),
        ],
      );
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading ? Container(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ) :  Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              color: Color(0x54FFFFFF),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: searchEditingController,
                      style: simpleTextStyle(),
                      decoration: InputDecoration(
                        hintText: "Search...",
                        hintStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                        border: InputBorder.none
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      // create alert dialog here
                      if(searchEditingController.text==Constants.myName){
                        createAlertDialog(context);
                      }
                      else {
                        initiateSearch();
                      }
                    },
                    child: Container(
                      height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              const Color(0x36FFFFFF),
                              const Color(0x0FFFFFFF)
                            ],
                            begin: FractionalOffset.topLeft,
                            end: FractionalOffset.bottomRight
                          ),
                          borderRadius: BorderRadius.circular(40)
                        ),
                        padding: EdgeInsets.all(12),
                        child: Image.asset("assets/images/search_white.png",
                          height: 25, width: 25,)),
                  )
                ],
              ),
            ),
            userList()
          ],
        ),
      ),
    );
  }
}


