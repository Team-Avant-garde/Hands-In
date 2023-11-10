import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:handsin/Authentication&Registratino/login.dart';
import 'package:handsin/Constants/constants.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        title: Text('Profile'),
        centerTitle: true,
        elevation: 0,
        iconTheme: IconThemeData(
          color: black
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Flex(
            direction: Axis.vertical,
            children: [
              GestureDetector(
                 onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Login()),
                   );
                 },                
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.red),
                    borderRadius: BorderRadius.circular(40)
                  ),
                  child: Icon(LineIcons.alternateSignOut, color: Colors.red,)),
              )
            ],
          ),
        ),
      ),
    );
  }
}