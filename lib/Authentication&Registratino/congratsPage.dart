import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:handsin/Authentication&Registratino/login.dart';
import 'package:handsin/Constants/constants.dart';
import 'package:lottie/lottie.dart';

class CongratsPage extends StatefulWidget {
  const CongratsPage({super.key});

  @override
  State<CongratsPage> createState() => _CongratsPageState();
}

class _CongratsPageState extends State<CongratsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical:20.0, horizontal: 20),
          child: Flex(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            direction: Axis.vertical,
            children: [
              Text('Congratulations',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w600
              ),
              ),
              Lottie.asset('assets/AppLottie/congrats.json',
              animate: true,
              repeat: true
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => Login(),
           ));
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: black,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  alignment: Alignment.center,
                  child: Text('Login', 
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: white
                  ),
                  ),
                ),
              )
            ],
            ),
        )
        ),
    );
  }
}