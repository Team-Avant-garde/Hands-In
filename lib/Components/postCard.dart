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
        // border: Border.all(
        //   width: 1,
        //   // color: light_grey
        // ),
        borderRadius: BorderRadius.circular(10),
        color: white
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
                    fontWeight: FontWeight.w600,
                    fontSize: 16
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
                    child: Icon(LineIcons.thumbsUp, size: 20,),
                  ),
                  Text('2'),

                  SizedBox(width: 10,),

                  // Thumbs down button with counter
                  GestureDetector(
                    onTap: () {
                      
                    },
                    child: Icon(LineIcons.thumbsDown, size: 20,),
                  ),
                  Text('2'),
                ],
              )
            ],
          ),
          SizedBox(height: 20,),
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
            
                  GestureDetector(
                    child: Container(
                      // width: 30,
                      height: 30,
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                      decoration: BoxDecoration(
                        
                        color: black,
                        borderRadius: BorderRadius.circular(50)
                      ),
                      child: Text('Give a hand 👋', style: TextStyle(color: white),),
                    ),
<<<<<<< HEAD
                  ),                  
              SizedBox(width: 10,),
                  GestureDetector(
                    child: Container(
                      // width: 30,
                      height: 30,
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                      decoration: BoxDecoration(
                        border: Border.all(width: 1),
                        // color: white,
                        borderRadius: BorderRadius.circular(50)
                      ),
                      child: Text.rich(
                        TextSpan(
                          children: [
                          TextSpan(
                            text: 'Recommend'
                          ),
                          TextSpan(
                            text: ' '
                          ),
                          TextSpan(
                            text: thinking.emoji
                          )
                          ]
                        )
                      ),
                    ),
                  ),                  
              
=======
                  ),
                  SizedBox(width: 7,),
                  Text('Give a hand')
                ],
              )
>>>>>>> 3fa6644a9e5f80243acc37424d7a6f00a1b7efc8
            ],
          )
        ],
      ),
    );
  }
}