import 'package:chatapp/helper/constants.dart';
import 'package:chatapp/services/auth.dart';
import 'package:chatapp/views/payments.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class DatabaseMethods {
  Future<void> addUserInfo(userData) async {
    FirebaseFirestore.instance.collection("users").add(userData).catchError((e) {
      print(e.toString());
    });
  }

  getUserInfo(String? email) async {
    return FirebaseFirestore.instance
        .collection("users")
        .where("userEmail", isEqualTo: email)
        .get()
        .catchError((e) {
      print(e.toString());
    });
  }

  searchByName(String searchField) {

      return FirebaseFirestore.instance
          .collection("users")
          .where('userName', isEqualTo: searchField)
          .get();
  }

  searchByCity(String searchField) {

    return FirebaseFirestore.instance
        .collection("users")
        .where('city', isEqualTo: searchField)
        .get();
  }

  Future<void> addChatRoom(chatRoom, chatRoomId) async {
    FirebaseFirestore.instance
        .collection("chatRoom")
        .doc(chatRoomId)
        .set(chatRoom)
        .catchError((e) {
      print(e);
    });
  }

  getChats(String chatRoomId) async{
    return FirebaseFirestore.instance
        .collection("chatRoom")
        .doc(chatRoomId)
        .collection("chats")
        .orderBy('time')
        .snapshots();
  }


  Future<void> addMessage(String chatRoomId, chatMessageData)async {

    FirebaseFirestore.instance.collection("chatRoom")
        .doc(chatRoomId)
        .collection("chats")
        .add(chatMessageData).catchError((e){
          print(e.toString());
    });
  }
  
  Future<void> deleteChat(String chatRoomId)async{
    
    FirebaseFirestore.instance.collection("chatRoom")
        .doc(chatRoomId)
        .delete()
        .catchError((e){
          print(e.toString());
    });
  }

  getUserChats(String itIsMyName) async {
    return await FirebaseFirestore.instance
        .collection("chatRoom")
        .where('users', arrayContains: itIsMyName)
        .snapshots();
  }

  Future<DocumentSnapshot> getData() async {
    await Firebase.initializeApp();
    return await FirebaseFirestore.instance
        .collection("users")
        .doc("docID")
        .get();
  }

  setPaymentData(String name,String amount)async{
    return await FirebaseFirestore.instance
        .collection("users")
        .where('userName',isEqualTo: name)
        .get()
        .then((querySnapshot){
          querySnapshot.docs.forEach((documentSnapshot) {
            documentSnapshot.reference.update({"rate_per_day":amount});
          });
    });

  }

}
