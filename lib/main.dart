import 'package:flutter/material.dart';
import 'package:doctor_appointment/screens/welcome_screen.dart';

// ignore: unused_import
import "screens/sign_in_screen.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // User? user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlutterFire Samples',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: WelcomeScreen(),
    );
  }
}
