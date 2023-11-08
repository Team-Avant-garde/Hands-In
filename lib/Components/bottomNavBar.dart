import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(

        )
        ),
        bottomNavigationBar: GNav(
          padding: EdgeInsets.symmetric(horizontal: 70, vertical: 20),
          tabs: [
            GButton(
              // style: GnavStyle.oldSchool,
              icon: LineIcons.home,
              haptic: true,
              // text: 'Home',
              ),
            GButton(icon: LineIcons.paperHand)
          ],
        ),
    );
  }
}