import 'package:chatapp/helper/helperfunctions.dart';
import 'package:chatapp/services/database.dart';
import 'package:chatapp/widget/widget.dart';
import 'package:flutter/material.dart';

class SetPayment extends StatefulWidget {
  const SetPayment({Key? key}) : super(key: key);

  @override
  _SetPaymentState createState() => _SetPaymentState();
}

class _SetPaymentState extends State<SetPayment> {

  TextEditingController amount = new TextEditingController();
  var username;
  @override
  void initState() {
    super.initState();
    getUserName();
  }

  getUserName() async{
    username=await HelperFunctions.getUserNameSharedPreference();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Set new payment"),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              keyboardType: TextInputType.number,
              controller: amount,
              decoration: textFieldInputDecoration("Enter Amount"),
              style: simpleTextStyle(),
            ),
            SizedBox(height: 15,),

            ElevatedButton.icon(
                onPressed: (){
                  DatabaseMethods().setPaymentData(username,amount.text);
                },
                icon: const Icon(Icons.payment,
                  // color: Colors.black,
                ),
                label: const Text("Set",
                  style: TextStyle(
                    // color: Colors.black
                  ),

                ),
                style: ElevatedButton.styleFrom(
                    primary: Colors.brown,
                    // fixedSize: Size(3,2)
                    minimumSize: const Size(150,48),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)
                    )
                )
            )
          ],
        ),
      ),
    );
  }
}
