
// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:myapp/myNewApp/splash_screen.dart';

const Key_Name = 'UserLoggedIn';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Demo App",
      home: SplashScreen(),
      
    );
  }
}
