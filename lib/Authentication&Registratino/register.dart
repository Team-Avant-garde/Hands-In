import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:handsin/Authentication&Registratino/login.dart';
import 'package:handsin/Authentication&Registratino/otp.dart';
import 'package:handsin/Constants/apiConstants.dart';
import 'package:handsin/Constants/constants.dart';
import 'package:handsin/Pages/UserPages/home.dart';
import 'package:handsin/Services/apiService.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
    
final textFieldFocusNode = FocusNode();

// Login Button Bool Variable
bool loading = false;

void _toggleObscured() {
    setState(() {
      seeButton = !seeButton;
      if (textFieldFocusNode.hasPrimaryFocus) return; // If focus is on text field, dont unfocus
      textFieldFocusNode.canRequestFocus = false;     // Prevents focus if tap on eye
    });
  }

// Controllers for Sign Up
  final username = TextEditingController();  
  final email = TextEditingController();  
  final password = TextEditingController();  
  final confirmPassword = TextEditingController();  

  // Error Text State
  String error = "";
  bool hasError = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Flex(
            mainAxisAlignment: MainAxisAlignment.start,
            direction: Axis.vertical,
            children: [
              Container(
                margin: EdgeInsets.only(top: 40),
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Colors.black),
                  borderRadius: BorderRadius.circular(15)
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(appLogo)
                  )
                ),

                SizedBox(height: 40,),

                // Login Inputs
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:30.0, vertical: 10),
                  child: Column(
                    children: [
                 Text('Sign Up', style: TextStyle(
                  fontSize: 30,
                 ),),
                 SizedBox(height: 40,),
                      SizedBox(
                        height: 40,
                        child: 
                        // Email or Username
                        TextFormField(
                          controller: username,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0) ),
                            ),
                            contentPadding: EdgeInsets.symmetric(horizontal: 18),
                            label: Text('Username', style: TextStyle(color: grey, fontSize: 15), ),
                            labelStyle: TextStyle(
                              color: black
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12)
                            )
                          ),
                        ),
                      ),
                      SizedBox(height: 15,),
                      SizedBox(
                        height: 40,
                        child: 
                        // Email or Username
                        TextFormField(
                          controller: email,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0) ),
                            ),
                            contentPadding: EdgeInsets.symmetric(horizontal: 18),
                            label: Text('Student Email', style: TextStyle(color: grey, fontSize: 15), ),
                            labelStyle: TextStyle(
                              color: black
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12)
                            )
                          ),
                        ),
                      ),

                      SizedBox(height: 15,),

                      SizedBox(
                        height: 40,
                        child: 
                        // Password
                        TextFormField(
                          controller: password,
                          obscureText: seeButton,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0) ),
              ),
                            label: Text('Password'),
                            contentPadding: EdgeInsets.symmetric(horizontal: 18),
                            labelStyle: TextStyle(
                              color: black
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12)
                            ),
                        ),
                      )
                      ),
                      SizedBox(height: 15,),
                      SizedBox(
                        height: 40,
                        child: 
                        // Password
                        TextFormField(
                          controller: confirmPassword,
                          obscureText: seeButton,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0) ),
              ),
                            label: Text('Confirm Password'),
                            contentPadding: EdgeInsets.symmetric(horizontal: 18),
                            labelStyle: TextStyle(
                              color: black
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12)
                            ),
                           
                        ),
                      )
                      ),
                      SizedBox(height: 30,),
                       
                        loading ?
                         Container(
                          height: 30,
                          width: 30,
                          child: CircularProgressIndicator.adaptive(
                            strokeWidth: 2.7,
                          )):
                         GestureDetector(
                           onTap: (){
                          checkFormInput();
                        },
                           child: Container(
                            width: 300,
                            height: 40,
                            decoration: BoxDecoration(
                              color: black,
                              borderRadius: BorderRadius.circular(10)
                            ),
                            alignment: Alignment.center,
                            child: Text('Submit', style: TextStyle(color: white, fontSize: 17),),
                                                 ),
                         ) 
                    ],
                  ),
                ),

                SizedBox(height: 20,),
                hasError ? Text(error, style: TextStyle(color: Colors.red, fontSize: 12),) : Text(''),
                SizedBox(height: 20,),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => Login(),
                          ));
                  },
                  child: Text("Already have an account? Sign In", style: TextStyle(
                    color: grey
                  ),),
                )
            ],
          ),
        ),
      )
    );
  }

// Register
 void register(String username, String email, String password) async {
    if (!mounted) return;
    setState(() {
      loading = true;
    });

    try {
      Response response = await dio.post(
        signUpRoute,
        data: {
          "username": username,
          "email": email,
          "password": password,
        },
      );
      print(response);

      setState(() {
         // Store the response data in the variable
         var responseData = response.data;

         // Extract user_id from responseData
         registerUserId = responseData?["user_id"];
      });

      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => OTP(),
        ),
      );

      
    } catch (e) {
      print("Error: $e");
        setState(() {
          hasError = true;
          getErrorOff();
        });
        error = 'Invalid student email';
      if (mounted) {
        // Check if the widget is still mounted before calling setState
        setState(() {
          loading = false;
        });
      }
    }
  }

  void checkFormInput() {
    if (username.text.isEmpty ||
        email.text.isEmpty ||
        password.text.isEmpty ||
        confirmPassword.text.isEmpty) {
      setState(() {
        hasError = true;
        loading = false;
        error = "All fields required!";
      });
    } else if (password.text != confirmPassword.text) {
      setState(() {
        hasError = true;
        loading = false;
        error = "Passwords do not match!";
      });
      getErrorOff();
    } else {
      register(username.text, email.text, password.text);
    }
  }

  Future<void> getErrorOff() async {
  await Future.delayed(const Duration(seconds: 5));
  loading = false;
}

}

