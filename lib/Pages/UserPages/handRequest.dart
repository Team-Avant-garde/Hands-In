import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:handsin/Components/requests.dart';
import 'package:handsin/Constants/constants.dart';

class HandRequests extends StatefulWidget {
  const HandRequests({super.key});

  @override
  State<HandRequests> createState() => _HandRequestsState();
}

class _HandRequestsState extends State<HandRequests> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: white,
        title: 
        Text('Requests', 
            style: TextStyle(
              color: black,
              fontSize: 17
        ),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal:20.0),
          child: RequestsCard(),
        ),
      ),
    );
  }
}