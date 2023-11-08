import 'package:flutter/material.dart';
import 'package:handsin/Pages/UserPages/handRequest.dart';
import 'package:handsin/Pages/UserPages/home.dart';
import 'package:line_icons/line_icons.dart';

class BottomNavigationBarTwo extends StatefulWidget {
  const BottomNavigationBarTwo({Key? key}) : super(key: key);

  @override
   _BottomNavigationBarTwoState createState() =>
      _BottomNavigationBarTwoState();
}

class _BottomNavigationBarTwoState extends State {
  int _selectedTab = 0;

  List _pages = [
    Home(),
    HandRequests()
  ];

  _changeTab(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedTab],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        onTap: (index) => _changeTab(index),
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        elevation: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(LineIcons.home), 
            label: "Home",
            activeIcon: Icon(Icons.home)
            ),
          BottomNavigationBarItem(
            icon: Icon(LineIcons.paperHand),
            label: "Requests",
            activeIcon: Icon(Icons.back_hand, size: 24,)
            ),
          // BottomNavigationBarItem(
          //     icon: Icon(Icons.grid_3x3_outlined), label: "Product"),
        ],
      ),
    );
  }
}