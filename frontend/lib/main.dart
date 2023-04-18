import 'package:flutter/material.dart';
import 'package:value_app/authentication/forget_password/screens/success_passsword_screen.dart';
import 'authentication/login_signup/screens/login_screen.dart';
import 'splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final routes = <String, WidgetBuilder>{
    LoginScreen.tag: (context) => const LoginScreen(),
    SuccessPasswordScreen.tag: (context) => const SuccessPasswordScreen(),
  };
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      routes: routes,
    );
  }
}
