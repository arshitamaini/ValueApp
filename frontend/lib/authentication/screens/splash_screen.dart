import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

import 'package:value_app/authentication/screens/login_screen.dart';
import 'package:value_app/home/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String? name;
  String? phoneNumber;
  String? email;
  Future getdata() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    name = prefs.getString('name');
    phoneNumber = prefs.getString('phoneNumber');
    email = prefs.getString('email');
  }

  @override
  void initState() {
    super.initState();
    getdata().whenComplete(
      () {
        Timer(
            const Duration(seconds: 2),
            () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => name == null
                        ? LoginScreen()
                        : HomeScreen(
                            name: name.toString(),
                            phoneNumber: phoneNumber.toString(),
                            email: email.toString()))));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF101415),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Center(
              child: Image(
                  image: AssetImage('assets/images/splashScreenLogo.png'))),
          Center(
              child: Image(
                  image: AssetImage('assets/images/splashScreenText.png'))),
        ],
      ),
    );
  }
}
