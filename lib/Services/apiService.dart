import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:handsin/Constants/apiConstants.dart';
import 'package:handsin/Pages/UserPages/home.dart';

final dio = Dio();

String baseUri = "https://handsin.onrender.com/api/auth";

String signUpRoute = baseUri + "/signup/";

String registeredUserIDTS = registerUserId.toString();

String otpuri = "$baseUri/otp/$registeredUserIDTS/verify_otp" + "/";

String loginUri = "$baseUri/login/";

String postUri = "https://handsin.onrender.com/api/posts/post/";

// // Register

// void register(String username, String email, String password) async {
//   try {
//     Response response = await dio.post(
//       signUpRoute,
//       data: {
//         "username": username,
//         "email": email,
//         "password": password,
//       },
//     );
//     print(response);
//     if(response.statusCode == 200){
//       Navigator.of(context).pushReplacement(MaterialPageRoute(
//                             builder: (context) => Home(),
//                           ));
//     }
//   } catch (e) {
//     print("Error: $e");
//   }
// }
