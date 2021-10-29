import 'package:chatapp/HomePage.dart';
import 'package:chatapp/helper/helperfunctions.dart';
import 'package:chatapp/helper/theme.dart';
import 'package:chatapp/services/auth.dart';
import 'package:chatapp/services/database.dart';
import 'package:chatapp/views/chatrooms.dart';
import 'package:chatapp/widget/widget.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  final Function toggleView;
  SignUp(this.toggleView);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var items=["Tourist","Tour Guide"];
  String userType="Tourist";

  TextEditingController emailEditingController = new TextEditingController();
  TextEditingController passwordEditingController = new TextEditingController();
  TextEditingController usernameEditingController =
      new TextEditingController();
  TextEditingController phoneNumber = new TextEditingController();
  TextEditingController userCity = new TextEditingController();
  TextEditingController tourGuide = new TextEditingController();

  AuthService authService = new AuthService();
  DatabaseMethods databaseMethods = new DatabaseMethods();

  final formKey = GlobalKey<FormState>();
  bool isLoading = false;

  singUp() async {

    if(formKey.currentState!.validate()){
      setState(() {

        isLoading = true;
      });

      await authService.signUpWithEmailAndPassword(emailEditingController.text,
          passwordEditingController.text,usernameEditingController.text).then((result){
            if(result != null) {
              if(userType=='Tourist') {
                Map<String, String> userDataMap = {
                  "userName": usernameEditingController.text,
                  "userEmail": emailEditingController.text,
                  "userType": userType,
                  "phoneNumber":phoneNumber.text
                };

                databaseMethods.addUserInfo(userDataMap);

                HelperFunctions.saveUserLoggedInSharedPreference(true);
                HelperFunctions.saveUserNameSharedPreference(
                    usernameEditingController.text);
                HelperFunctions.saveUserEmailSharedPreference(
                    emailEditingController.text);
                HelperFunctions.saveUserTypeSharedPreference(userType);
                HelperFunctions.savePhoneNumberSharedPreference(phoneNumber.text);


                Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) => HomePage()
                ));

              }
              else {
                Map<String, String> userDataMap = {
                  "userName": usernameEditingController.text,
                  "userEmail": emailEditingController.text,
                  "userType": userType,
                  "city": userCity.text,
                  "phoneNumber": phoneNumber.text,
                  "rate_per_day": tourGuide.text,
                };

                databaseMethods.addUserInfo(userDataMap);

                HelperFunctions.saveUserLoggedInSharedPreference(true);
                HelperFunctions.saveUserNameSharedPreference(
                    usernameEditingController.text);
                HelperFunctions.saveUserEmailSharedPreference(
                    emailEditingController.text);
                HelperFunctions.saveUserTypeSharedPreference(userType);
                HelperFunctions.savePhoneNumberSharedPreference(phoneNumber.text);
                HelperFunctions.saveTourRateSharedPreference(tourGuide.text);


                Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) => ChatRoom()
                ));
              }
            }

      });
    }
  }

  // signUpWithGoogle()async{
  //   await authService.signInWithGoogle(context).then((result){
  //     if(result!=null){
  //       Map<String, String?> userDataMap = {
  //         "userName": result.displayName,
  //         "userEmail": result.email,
  //         "userType": userType,
  //       };
  //
  //       databaseMethods.addUserInfo(userDataMap);
  //
  //       HelperFunctions.saveUserLoggedInSharedPreference(true);
  //       HelperFunctions.saveUserNameSharedPreference(
  //           result.displayName);
  //       HelperFunctions.saveUserEmailSharedPreference(
  //           result.email);
  //       HelperFunctions.saveUserTypeSharedPreference('Tourist');
  //
  //       if (userType == "Tourist") {
  //         Navigator.pushReplacement(context, MaterialPageRoute(
  //             builder: (context) => HomePage()
  //         ));
  //       }
  //       else {
  //         Navigator.pushReplacement(context, MaterialPageRoute(
  //             builder: (context) => ChatRoom()
  //         ));
  //       }
  //
  //     }
  //   });
  // }

  Widget cForm(){
    if(userType=='Tourist'){
      return Form(
        key: formKey,
        child: Column(
          children: [
            TextFormField(
              style: simpleTextStyle(),
              controller: usernameEditingController,
              validator: (val){
                return val!.isEmpty || val.length < 3 ? "Enter Username 3+ characters" : null;
              },
              decoration: textFieldInputDecoration("username"),
            ),
            TextFormField(
              controller: emailEditingController,
              style: simpleTextStyle(),
              validator: (val){
                return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(val!) ?
                null : "Enter correct email";
              },
              decoration: textFieldInputDecoration("email"),
            ),
            TextFormField(
              keyboardType: TextInputType.phone,
              style: simpleTextStyle(),
              decoration: textFieldInputDecoration("Phone number"),
              controller: phoneNumber,
            ),
            TextFormField(
              obscureText: true,
              style: simpleTextStyle(),
              decoration: textFieldInputDecoration("password"),
              controller: passwordEditingController,
              validator:  (val){
                return val!.length < 6 ? "Enter Password 6+ characters" : null;
              },

            ),
          ],
        ),
      );
    }

    else{
      return Form(
        key: formKey,
        child: Column(
          children: [
            TextFormField(
              style: simpleTextStyle(),
              controller: usernameEditingController,
              validator: (val){
                return val!.isEmpty || val.length < 3 ? "Enter Username 3+ characters" : null;
              },
              decoration: textFieldInputDecoration("username"),
            ),
            TextFormField(
              controller: emailEditingController,
              style: simpleTextStyle(),
              validator: (val){
                return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(val!) ?
                null : "Enter correct email";
              },
              decoration: textFieldInputDecoration("email"),
            ),
            TextFormField(
              keyboardType: TextInputType.phone,
              style: simpleTextStyle(),
              decoration: textFieldInputDecoration("Phone number"),
              controller: phoneNumber,
            ),
            TextFormField(
              obscureText: true,
              style: simpleTextStyle(),
              decoration: textFieldInputDecoration("password"),
              controller: passwordEditingController,
              validator:  (val){
                return val!.length < 6 ? "Enter Password 6+ characters" : null;
              },
            ),
            TextFormField(
              // obscureText: true,
              style: simpleTextStyle(),
              decoration: textFieldInputDecoration("Enter City Name"),
              controller: userCity,
              // validator:  (val){
              //   return val!.length < 6 ? "Enter Password 6+ characters" : null;
              // },
            ),
            TextFormField(
              // obscureText: true,
              style: simpleTextStyle(),
              decoration: textFieldInputDecoration("Enter your rate per day: "),
              controller: userCity,
              // validator:  (val){
              //   return val!.length < 6 ? "Enter Password 6+ characters" : null;
              // },
            ),

          ],
        ),
      );
    }
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(context),
      body: isLoading ? Container(child: Center(child: CircularProgressIndicator(),),) :  Container(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text("Sign Up",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),

                  ),
                ),
              ),
            ),
            DropdownButton(
              value: userType,
              items: items.map((String items){
                return DropdownMenuItem(
                    value: items,
                    child: Text(items,
                      style: TextStyle(
                        color: Color(0xff007EF4),
                      ),
                    )
                );
              },
              ).toList(),
              onChanged: (String? newValue){
                setState(() {
                  userType=newValue!;
                });
              },
            ),

            cForm(),

            // Form(
            //   key: formKey,
            //   child: Column(
            //     children: [
            //       TextFormField(
            //         style: simpleTextStyle(),
            //         controller: usernameEditingController,
            //         validator: (val){
            //           return val!.isEmpty || val.length < 3 ? "Enter Username 3+ characters" : null;
            //         },
            //         decoration: textFieldInputDecoration("username"),
            //       ),
            //       TextFormField(
            //         controller: emailEditingController,
            //         style: simpleTextStyle(),
            //         validator: (val){
            //           return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(val!) ?
            //               null : "Enter correct email";
            //         },
            //         decoration: textFieldInputDecoration("email"),
            //       ),
            //       TextFormField(
            //         obscureText: true,
            //         style: simpleTextStyle(),
            //         decoration: textFieldInputDecoration("password"),
            //         controller: passwordEditingController,
            //         validator:  (val){
            //           return val!.length < 6 ? "Enter Password 6+ characters" : null;
            //         },
            //
            //       ),
            //     ],
            //   ),
            // ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: (){
                singUp();
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
                  "Sign Up",
                  style: biggerTextStyle(),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            // GestureDetector(
            //   // onTap: signUpWithGoogle(),
            //   child: Container(
            //     padding: EdgeInsets.symmetric(vertical: 16),
            //     decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(30), color: Colors.white),
            //     width: MediaQuery.of(context).size.width,
            //     child: Text(
            //       "Sign Up with Google",
            //       style: TextStyle(fontSize: 17, color: CustomTheme.textColor),
            //       textAlign: TextAlign.center,
            //     ),
            //   ),
            // ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    "Already have an account? ",
                    style: simpleTextStyle(),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    widget.toggleView();
                  },
                  child: Text(
                    "SignIn now",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        decoration: TextDecoration.underline),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
    ;
  }
}
