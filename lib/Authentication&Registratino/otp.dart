import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:handsin/Authentication&Registratino/congratsPage.dart';
import 'package:handsin/Constants/apiConstants.dart';
import 'package:handsin/Constants/constants.dart';
import 'package:page_transition/page_transition.dart';

import '../Services/apiService.dart';

class OTP extends StatefulWidget {
  const OTP({super.key});

  @override
  State<OTP> createState() => _OTPState();
}

class _OTPState extends State<OTP> {

  final pin1 = TextEditingController();
  final pin2 = TextEditingController();
  final pin3 = TextEditingController();
  final pin4 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Flex(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.vertical,
          children: [
             Padding(
               padding: const EdgeInsets.symmetric(vertical:30.0),
               child: Column(
                children: [
                  Text('OTP'),
               Text('Concerning the OTP'),
               Text('Request to change your phone number.'),

              //  Gab
              SizedBox(height: 40,),
                   
               //  OTP Form
               Form(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 64,
                      height: 64,
                      child: TextFormField(
                        controller: pin1,
                        onChanged: (value) {
                          if (value.length == 1){
                            FocusScope.of(context).nextFocus();
                          } 
                        },
                        onSaved: (pin1) {
                          
                        },
                        decoration: InputDecoration(
                          // focusedBorder: ,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          )
                        ),
                        style: Theme.of(context).textTheme.headline6,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      ),
                    ),
                    SizedBox(width: 10,),
                    SizedBox(
                      width: 64,
                      height: 64,
                      child: TextFormField(
                        controller: pin2,
                        onChanged: (value) {
                          if (value.length == 1){
                            FocusScope.of(context).nextFocus();
                          } else if(value.length == 0){
                              FocusScope.of(context).previousFocus();
                            }
                        },
                        onSaved: (pin2) {
                          
                        },
                         decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)
                          )
                        ),
                        style: Theme.of(context).textTheme.headline6,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      ),
                    ),
                    SizedBox(width: 10,),
                    SizedBox(
                      width: 64,
                      height: 64,
                      child: TextFormField(
                        controller: pin3,
                        onChanged: (value) {
                          if (value.length == 1){
                            FocusScope.of(context).nextFocus();
                          }
                            else if(value.length == 0){
                              FocusScope.of(context).previousFocus();
                            }
                        },
                        onSaved: (pin3) {

                        },
                         decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)
                          )
                        ),
                        style: Theme.of(context).textTheme.headline6,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      ),
                    ),
                    SizedBox(width: 10,),
                    SizedBox(
                      width: 64,
                      height: 64,
                      child: TextFormField(
                        controller: pin4,
                        onChanged: (value) {
                          if (value.length == 0){
                            FocusScope.of(context).previousFocus();
                          }
                        },
                        onSaved: (pin4) {
                          
                        },
                         decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)
                          )
                        ),
                        style: Theme.of(context).textTheme.headline6,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      ),
                    )
                  ],
                ),
                         )
                ],
               ),
             ),
             Padding(
               padding: const EdgeInsets.symmetric(vertical:10.0, horizontal: 20),
               child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      print(otpuri);
                    },
                    child: Container(
                      width: 150,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          width: 1.5,
                          color: black
                        )
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        'Resend',
                        style: TextStyle(
                          color: black,
                          fontSize: 15
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                      onTap: () {
                        checkOTP(pin1.text, pin2.text, pin3.text, pin4.text);
                      },
                      child: Container(
                        width: 150,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: black
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          'Confrim',
                          style: TextStyle(
                            color: white,
                            fontSize: 15
                          ),
                        ),
                    ),
                  )
                ],
               ),
             )
          ],
        ),
      ),
    );
  }


  checkOTP(String pin1, String pin2, String pin3, String pin4) async {
    var otp = pin1 + pin2 + pin3 + pin4;


   try {
      Response response = await dio.patch(
        otpuri,
        data: {
          "otp": otp,
        },
      );

      // Check the status code in the response
      if (response.statusCode == 200) {
        // Successful response, navigate to the next page (e.g., CongratsPage)
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CongratsPage()),
        );
      } else {
        // Unsuccessful response, handle the error
        print("Error: ${response.data}");
        // You can show an error message to the user if needed
        // For example, you can use a SnackBar:
      }
    } catch (e) {
      // Handle the error if there is an exception
      print("Error: $e");
      // You can show an error message to the user if needed
    }
  
  }
}