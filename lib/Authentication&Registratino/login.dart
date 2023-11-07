import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:handsin/Constants/constants.dart';
import 'package:lottie/lottie.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Flex(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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

                // Login Inputs
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:30.0, vertical: 10),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 40,
                        child: 
                        // Email or Username
                        TextFormField(
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0) ),
              ),
                            label: Text('Student Email'),
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
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0) ),
              ),
                            label: Text('Password'),
                            labelStyle: TextStyle(
                              color: black
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12)
                            )
                          ),
                        ),
                      )
                    ],
                  ),
                )
            ],
          ),
        ),
      )
    );
  }
}