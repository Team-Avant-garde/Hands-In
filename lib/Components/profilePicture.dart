import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:handsin/Constants/constants.dart';

class ProfilePicture extends StatefulWidget {
  const ProfilePicture({super.key});

  @override
  State<ProfilePicture> createState() => _ProfilePictureState();
}

class _ProfilePictureState extends State<ProfilePicture> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical:10.0),
        child: Container(
          width: 30,
          height: 30,
          padding: EdgeInsets.all(5),
          margin: EdgeInsets.only(left: 20),
          decoration: BoxDecoration(
            border: Border.all(width: 1),
            borderRadius: BorderRadius.circular(40)
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(),
            child: ClipRRect(
              child: SvgPicture.asset('assets/AppIcons/user.svg', width: 5, height: 5, fit: BoxFit.cover,)
            ),
          ),
        ),
      ),
    );
  }
}