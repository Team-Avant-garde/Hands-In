import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:handsin/Provider/themeProvider.dart';
import 'package:handsin/Services/authChecker.dart';
import 'package:provider/provider.dart'; // Import Provider package



void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: MaterialAppWrapper(),
    );
  }
  
}

class MaterialAppWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hands-In',
      // theme: themeProvider.getTheme(),
      initialRoute: '/',
      routes: {
        '/': (context) => AuthService(),
      },
    );
  }
}