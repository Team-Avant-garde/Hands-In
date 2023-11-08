import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:handsin/Components/postCard.dart';
import 'package:handsin/Components/profilePicture.dart';
import 'package:handsin/Constants/constants.dart';
import 'package:line_icons/line_icons.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
    statusBarColor: Colors.white, // <-- SEE HERE
    statusBarIconBrightness: Brightness.dark, //<-- For Android SEE HERE (dark icons)
    statusBarBrightness: Brightness.light, //<-- For iOS SEE HERE (dark icons)
  ),
        backgroundColor: white,
        leading: ProfilePicture(),
        title: Text('Feed', style: TextStyle(
          color: black,
          // font
        ),),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 5.0),
            child: IconButton(onPressed: (){},
             icon: Icon(LineIcons.plus, color: black, size: 19,)
             ),
          )
        ],
      ),
      body: const Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0,),
        child: SingleChildScrollView(
          child: Flex(
            direction: Axis.vertical,
            children: [
              SizedBox(height: 10,),
              PostCard(),
            ],
          ),
        ),
      ),
    );
  }
}