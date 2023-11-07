import 'dart:async';
import 'package:handsin/Constants/constants.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:handsin/Authentication&Registratino/login.dart';

class AuthService extends StatefulWidget {
  const AuthService({super.key});

  @override
  State<AuthService> createState() => _AuthServiceState();
}

class _AuthServiceState extends State<AuthService>  with TickerProviderStateMixin{

  late final AnimationController _controller;
  

   @override
  void initState() {
    super.initState();
    initialization();

   _controller = AnimationController(vsync: this);

    // Route in 2s
    Timer(Duration(seconds: 1), route);
  }

   @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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
          child: Lottie.asset('assets/AppLottie/congrats.json',
          animate: true,
          repeat: false
          )
        )
      ),
    );
  }
}