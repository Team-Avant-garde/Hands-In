// get Toekn from Shared Preferences
import 'package:handsin/Constants/apiConstants.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> getToken() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  String? action = prefs.getString('jwtToken');
  action = userApiToken; 
}