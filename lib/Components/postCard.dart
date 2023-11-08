import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:handsin/Constants/constants.dart';
import 'package:line_icons/line_icons.dart';

class PostCard extends StatefulWidget {
  const PostCard({super.key});

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      // height:  400,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: light_grey
        ),
        borderRadius: BorderRadius.circular(10)
      ),
      child: Flex(
        crossAxisAlignment: CrossAxisAlignment.start,
        direction: Axis.vertical,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Post User's details and time
              Row(
                children: [
                  // Profile Picture
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1
                      ),
                      borderRadius: BorderRadius.circular(40)
                    ),
                    child: ClipRRect(
                      child: SvgPicture.asset('assets/AppIcons/user.svg', width: 20,),
                    ),
                  ),
                  SizedBox(width: 10,),
                  Text('User Name',
                  style: TextStyle(
                    fontWeight: FontWeight.w600
                  ), 
                  ),
                  SizedBox(width: 10,),
                  Container(
                    width: 5,
                    height: 5,
                    decoration: BoxDecoration(
                      color: grey,
                      borderRadius: BorderRadius.circular(20)
                    ),
                  ),
                  SizedBox(width: 10,),
                  Text('2h', 
                  style: TextStyle(
                    fontSize: 13,
                    color: grey
                  )
                  ,)
                ],
              ),
              Row(
                children: [
                  // Thumbs Up button with counter
                  GestureDetector(
                    onTap: () {
                      
                    },
                    child: Icon(LineIcons.thumbsUp),
                  ),
                  Text('2'),

                  // Thumbs down button with counter
                  GestureDetector(
                    onTap: () {
                      
                    },
                    child: Icon(LineIcons.thumbsDown),
                  ),
                  Text('2'),
                ],
              )
            ],
          ),
          SizedBox(height: 10,),
          Text('So I am literally not understanding something.'),
          SizedBox(height: 10,),

          // Tags
          Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal:10, vertical: 5),
                decoration: BoxDecoration(
                  color: light_grey,
                  borderRadius: BorderRadius.circular(6)
                ),
                child: Text('Python'),
              )
            ],
          ),

          SizedBox(height: 20,),
          
          // Decision Bar

          Row(
            children: [
              Row(
                children: [
                  GestureDetector(
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        
                        color: black,
                        borderRadius: BorderRadius.circular(50)
                      ),
                      child: Icon(LineIcons.paperHand, color: white, size: 18,),
                    ),
                  ),
                  SizedBox(width: 7,),
                  Text('Give a hand')
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}