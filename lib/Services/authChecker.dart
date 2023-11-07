import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:handsin/Authentication&Registratino/login.dart';

class AuthService extends StatefulWidget {
  const AuthService({super.key});

  @override
  State<AuthService> createState() => _AuthServiceState();
}

class _AuthServiceState extends State<AuthService> {

   @override
  void initState() {
    super.initState();
    initialization();
    // Route in 2s
    Timer(Duration(seconds: 1), route);
  }


  void initialization() async {
    
    // Remove Splash Screen
    FlutterNativeSplash.remove();

  }

  // Route to page depending on LoggedIn State
  route(){
    Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => Login(),
           ));
  }
  
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Theme(
          data: ThemeData(
            
          ),
          child: CircularProgressIndicator.adaptive(
                
          ),
        )
      ),
    );
  }
}