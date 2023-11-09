import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:handsin/Constants/constants.dart';
import 'package:line_icons/line_icons.dart';

class RequestsCard extends StatefulWidget {
  const RequestsCard({super.key});

  @override
  State<RequestsCard> createState() => _RequestsCardState();
}

class _RequestsCardState extends State<RequestsCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:15.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Flex(
          crossAxisAlignment: CrossAxisAlignment.start,
          direction: Axis.vertical,
          children: [
            Text('Concerning "This"', 
            style: TextStyle(
              fontWeight: FontWeight.w600
            ),
            ),
            SizedBox(height: 10,),
            // Adding requests from user withing concerned post topic
            Container(
              padding: EdgeInsets.symmetric(horizontal:14, vertical: 10),
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(10)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                 Row(
                  children: [
                     // Requested User's profile picture
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 1),
                      borderRadius: BorderRadius.circular(50)
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: SvgPicture.asset(defaultUserProfilePicture, fit: BoxFit.cover,),
                    ),
                  ),

                  SizedBox(width: 10,),
    
                  // That user's name
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('User name',
                      style: TextStyle(
                        fontWeight: FontWeight.w600
                      ),
                      ),
                      Text('Wants to give a hand',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: grey,
                        fontSize: 12
                      ),
                      ),
                    ],
                  ),
                  ],
                 ),
                  Row(
                    children: [
                      GestureDetector(
                        child: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            border: Border.all(width: 1),
                            borderRadius: BorderRadius.circular(40)
                          ),
                          child: Icon(Icons.close, size: 20,),
                        ),
                      ),
                      SizedBox(width: 10,),
                      GestureDetector(
                        child: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            border: Border.all(width: 1),
                            borderRadius: BorderRadius.circular(40)
                          ),
                          child: Icon(Icons.check, size: 20,),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}