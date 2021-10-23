import 'package:chatapp/helper/helperfunctions.dart';
import 'package:chatapp/services/database.dart';
import 'package:chatapp/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';


class payment extends StatefulWidget {
  // const payment({Key? key}) : super(key: key);
  final String payto;
  final String chatRoomID;

  payment({required this.payto, required this.chatRoomID});

  @override
  _paymentState createState() => _paymentState();
}

class _paymentState extends State<payment> {


  Razorpay razorpay = new Razorpay();
  TextEditingController amount = new TextEditingController();
  var useremail;
  var phoneNumber;


  @override
  void initState() {
    super.initState();
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, onSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, onError);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, onExternal);
    getUserEmail();
    getPhoneNumber();
  }

  getUserEmail() async {
    await HelperFunctions.getUserEmailSharedPreference().then((val){
      setState(() {
        useremail  = val;
      });
    });
  }

  getPhoneNumber() async {
    await HelperFunctions.getPhoneNumberSharedPreference().then((val){
      setState(() {
        phoneNumber = val;
      });
    });
    print("PhoneFromPayments"+phoneNumber);
  }

  void onSuccess(PaymentSuccessResponse Response){
    // print("Payment Success");
    // Fluttertoast.showToast(
    //   msg: "Payment Successful",
    //   gravity: ToastGravity.BOTTOM,
    //   textColor: Colors.white,
    // );
    // Navigator.of(context).;
    createErrorAlertDialog1(context, "Payment Successful");
  }

  void onError(PaymentFailureResponse Response){
    // Fluttertoast.showToast(
    //   msg: "Payment failed",
    //   gravity: ToastGravity.BOTTOM,
    //   textColor: Colors.white,
    // );
    print("Error \n${Response.code}\n${Response.message}");
  }

  void onExternal(){
    Fluttertoast.showToast(
      msg: "External Wallet",
      gravity: ToastGravity.BOTTOM,
      textColor: Colors.white,
    );
  }

  void openCheckout(){
    var options = {
      "key" : "rzp_test_foo9rNOPWUCXJd",
      "amount" : num.parse(amount.text)*100,
      "name" : "Smaarak",
      "description" : "Payment to: "+widget.payto,
      "prefill" : {
        "contact" : phoneNumber,
        "email" : useremail,
      },
      "external" : {
        "wallets" : ["paytm"]
      }
    };

    try{
      razorpay.open(options);

    }catch(e){
      print(e.toString());
    }

  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    razorpay.clear();
  }

  createErrorAlertDialog1(BuildContext context, String message){

    return showDialog(context: context, builder: (context){
      return AlertDialog(
        title: Text("Message"),
        content: Text(message),
        actions: [
          ElevatedButton(
            onPressed: (){
              DatabaseMethods().deleteChat(widget.chatRoomID);
              Navigator.of(context).popUntil((ModalRoute.withName("/")));
            },
            child: Text("OK"),
          ),
        ],
      );
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pay "+widget.payto),
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
                onPressed: openCheckout,
                icon: const Icon(Icons.payment,
                  // color: Colors.black,
                ),
                label: const Text("PAY",
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
