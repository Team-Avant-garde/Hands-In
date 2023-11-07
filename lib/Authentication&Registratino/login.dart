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
      body: Center(
        child: Lottie.asset(congrats, animate: true, repeat: true),
      ),
    );
  }
}