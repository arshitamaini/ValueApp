import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:value_app/authentication/login_signup/bloc/authentication_bloc.dart';
import 'dart:async';
import 'package:value_app/authentication/login_signup/screens/login_screen.dart';
import 'package:value_app/common_bloc/password_visibility_bloc/password_visibility_bloc.dart';
import 'package:value_app/home/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String? firstName;
  String? lastName;
  String? emailPhoneNumber;

  Future getdata() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    firstName = prefs.getString('firstName');
    lastName = prefs.getString('lastName');
    emailPhoneNumber = prefs.getString('emailPhoneNumber');
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
                    builder: (context) => firstName == null || firstName == ''
                        ? MultiBlocProvider(
                            providers: [
                              BlocProvider(
                                create: (context) => AuthenticationBloc(),
                              ),
                              BlocProvider(
                                create: (context) => PasswordVisibilityBloc(),
                              ),
                            ],
                            child: const LoginScreen(),
                          )
                        : HomeScreen(
                            firstName: firstName.toString(),
                            lastName: lastName.toString(),
                            emailPhoneNumber: emailPhoneNumber.toString()))));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF101415),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/splashScreenBg.png'),
                fit: BoxFit.cover)),
      ),
    );
  }
}
