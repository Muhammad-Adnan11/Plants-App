import 'dart:async';

import 'package:flutter/material.dart';
import 'package:plants_mart/UI/Screens/Login_Screen/Login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigating to the LoginScreen after 3 seconds
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginView()),
      );
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFB1C588),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: CircleAvatar(
             backgroundColor: Colors.black,
             backgroundImage: AssetImage('assets/images/plants18.upeg'),
              maxRadius: 100,
            ),
          )
        ],
      ),
    );
  }
}
