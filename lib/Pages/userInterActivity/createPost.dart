import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:handsin/Constants/constants.dart';

class CreatePost extends StatefulWidget {
  const CreatePost({super.key});

  @override
  State<CreatePost> createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
      elevation: 0,
        title: Text('Create Post', style: TextStyle(
          color: black,
          fontSize: 17
        ),),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
          child: Flex(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            direction: Axis.vertical,
            children: [
                Column(
                children: [
                  SizedBox(
                height: 40,
                child: 
                TextField(
                          // controller: email,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0) ),
                            ),
                            contentPadding: EdgeInsets.symmetric(horizontal: 18),
                            hintText: 'Title',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12)
                            )
                          ),
                        ),
               ),
                ]
               ),
              //  Submit button
        
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: black,
                  borderRadius: BorderRadius.circular(10)
                ),
                alignment: Alignment.center,
                child: Text('Post Problem',
                style: TextStyle(
                  color: white
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