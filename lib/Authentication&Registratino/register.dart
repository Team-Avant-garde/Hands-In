import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:handsin/Authentication&Registratino/login.dart';
import 'package:handsin/Authentication&Registratino/otp.dart';
import 'package:handsin/Constants/constants.dart';
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
                 Text('Sign In', style: TextStyle(
                  fontSize: 30,
                 ),),
                 SizedBox(height: 40,),
                      SizedBox(
                        height: 40,
                        child: 
                        // Email or Username
                        TextFormField(
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
                          setState(() {
                            loading = true;
                            Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.rightToLeft,
                    child:  OTP(),
                  ),
                );
                          });
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
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.leftToRightJoined,
                    child: Login(),
                  ),
                );
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
}