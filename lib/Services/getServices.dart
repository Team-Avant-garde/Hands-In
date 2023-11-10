import 'dart:convert';

import 'package:handsin/Pages/UserPages/models/post.dart';
import 'package:http/http.dart' as http;
import 'package:handsin/Constants/apiConstants.dart';
import 'package:handsin/Services/apiService.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<String?> getToken() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  String? action = prefs.getString('jwtToken');
  return action ?? userApiToken;
}

Future<List<Post>> getPosts() async {
  try {
    // Make the HTTP GET request
    http.Response response = await http.get(Uri.parse(postUri));

    if (response.statusCode == 200) {
      var responseBody = response.body;
      // Decode the JSON response and create a list of Post objects
      List<dynamic> jsonData = json.decode(responseBody);
      List<Post> posts = jsonData.map((data) => Post.fromJson(data)).toList();
      return posts;
    } else {
      print('Failed to get posts. Status code: ${response.statusCode}');
      // Return an empty list or throw an exception based on your needs
      return [];
    }
  } catch (e) {
    print('Error: $e');
    // Return an empty list or throw an exception based on your needs
    return [];
  }
}
