import 'package:chatapp/services/auth.dart';
import 'package:chatapp/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {

  TextEditingController emailEditingController = new TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(context),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            // Spacer(),
            Expanded(
              child: Center(
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text("Forgot Password?",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),

                  ),
                ),
              ),
            ),
            TextFormField(
              validator: (val) {
                return RegExp(
                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                    .hasMatch(val!)
                    ? null
                    : "Please Enter Correct Email";
              },
              controller: emailEditingController,
              style: simpleTextStyle(),
              decoration: textFieldInputDecoration("email",
              ),
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: ()async{
                await AuthService().resetPass(emailEditingController.text);
                Navigator.of(context).pop();
                // singUp();
                Fluttertoast.showToast(
                  msg: "Reset Password link sent to  your email",
                  gravity: ToastGravity.BOTTOM,
                  textColor: Colors.white,

                );
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: LinearGradient(
                      colors: [const Color(0xff007EF4), const Color(0xff2A75BC)],
                    )),
                width: MediaQuery.of(context).size.width,
                child: Text(
                  "Send Reset Link",
                  style: biggerTextStyle(),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(height: 200,)

          ],
        ),
      ),
    );
  }
}
