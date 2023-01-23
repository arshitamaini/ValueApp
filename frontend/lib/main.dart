import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:value_app/authentication/bloc/authentication_bloc.dart';
import 'package:value_app/authentication/screens/login_screen.dart';
import 'package:value_app/home/screens/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: ((context) => AuthenticationBloc()),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          // home: LoginScreen(),
          home: const HomeScreen(name: 'Arshita', phoneNumber: '789456123'),
          theme: ThemeData.dark().copyWith()),
    );
  }
}
