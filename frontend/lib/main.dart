import 'package:flutter/material.dart';
import 'authentication/screens/login_screen.dart';
import 'authentication/screens/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final routes = <String, WidgetBuilder>{
    LoginScreen.tag: (context) => const LoginScreen(),
  };
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      routes: routes,
    );
  }
}
