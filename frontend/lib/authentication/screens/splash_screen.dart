import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

import 'package:value_app/authentication/screens/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String? name;
  String? phoneNumber;
  Future getdata() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    name = prefs.getString('name');
    phoneNumber = prefs.getString('phoneNumber');
  }

  @override
  void initState() {
    super.initState();
    getdata().whenComplete(
      () {
        Timer(
            const Duration(seconds: 2),
            () => Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => LoginScreen())));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
    );
  }
}
