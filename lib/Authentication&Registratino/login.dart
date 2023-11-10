import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:handsin/Authentication&Registratino/register.dart';
import 'package:handsin/Components/bottomNavBar.dart';
import 'package:handsin/Components/bottomNavBarTwo.dart';
import 'package:handsin/Constants/apiConstants.dart';
import 'package:handsin/Constants/constants.dart';
import 'package:handsin/Pages/UserPages/home.dart';
import 'package:handsin/Services/apiService.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:page_transition/page_transition.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
    
final textFieldFocusNode = FocusNode();

// Login Button Bool Variable
bool loading = false;


  // Declare seeButton here
  bool seeButton = true;

void _toggleObscured() {
    setState(() {
      seeButton = !seeButton;
      if (textFieldFocusNode.hasPrimaryFocus) return; // If focus is on text field, dont unfocus
      textFieldFocusNode.canRequestFocus = false;     // Prevents focus if tap on eye
    });
  }

  // Login input text
  final email = TextEditingController();
  final password = TextEditingController();

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
                        // Email or Username
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
                              color: grey
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12)
                            ),
                            suffixIcon: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                              child: GestureDetector(
                                onTap: _toggleObscured,
                                child: Icon(
                                  seeButton
                                      ? Icons.visibility_off_rounded
                                      : Icons.visibility_rounded,
                                  size: 18,
                                  color: black,
                                ),
                              ),
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
                          login(email.text, password.text);
                        },
                           child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 40,
                            decoration: BoxDecoration(
                              color: black,
                              borderRadius: BorderRadius.circular(10)
                            ),
                            alignment: Alignment.center,
                            child: Text('Login', style: TextStyle(color: white, fontSize: 17),),
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
                    type: PageTransitionType.rightToLeft,
                    child: Register(),
                  ),
                );
                  },
                  child: Text("Don't have an account? Register", style: TextStyle(
                    color: grey
                  ),),
                )
            ],
          ),
        ),
      )
    );
  }

  login(String email, String password) async {

    setState(() {
      loading = true;
    });
    try {
      Response response = await dio.post(
        loginUri,
        data: {
          "email": email,
          "password": password,
        },
      );

      // Check the status code in the response
      if (response.statusCode == 200) {
        // Successful response, navigate to the next page (e.g., CongratsPage)
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => BottomNavigationBarTwo()),
        );

        var responseData = response.data;

        var token = responseData?["token"];
        saveTokenToPreferences(token);

        setState(() {
          userApiToken = token;
        });

      } else {
        // Unsuccessful response, handle the error
        print("Error: ${response.data}");
        // You can show an error message to the user if needed
        // For example, you can use a SnackBar:
        setState(() {
          loading = false;
        });
      }
    } catch (e) {
      // Handle the error if there is an exception
      print("Error: $e");
      // You can show an error message to the user if needed
      setState(() {
        loading = false;
      });
    }
  }

  // Storing Toekn to Shared Preferences
  Future<void> saveTokenToPreferences(String token) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('jwtToken', token);
}
}