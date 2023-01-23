import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:value_app/home/screens/home_screen.dart';
import 'package:value_app/res/style.dart';

import '../../res/color.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(builder: ((context, state) {
      return Scaffold(
        body: SafeArea(
            child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/loginBg.png'), fit: BoxFit.cover)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('SIGNUP', style: AppStyle.screenHeadingStyle),
              const SizedBox(
                height: 20.0,
              ),
              SizedBox(
                height: 45,
                width: MediaQuery.of(context).size.width / 1.2,
                child: TextField(
                  controller: _nameController,
                  decoration: AppStyle.textFieldStyle('Name'),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              SizedBox(
                height: 45,
                width: MediaQuery.of(context).size.width / 1.2,
                child: TextField(
                  controller: _phoneController,
                  decoration: AppStyle.textFieldStyle('Phone Number'),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              SizedBox(
                height: 45,
                width: MediaQuery.of(context).size.width / 1.2,
                child: TextField(
                  controller: _emailController,
                  decoration: AppStyle.textFieldStyle('Email'),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              SizedBox(
                height: 45,
                width: MediaQuery.of(context).size.width / 1.2,
                child: TextField(
                  controller: _passwordController,
                  decoration: AppStyle.textFieldStyle('Password'),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              SizedBox(
                width: 120.0,
                child: ElevatedButton(
                  onPressed: (() {}),
                  style: AppStyle.elevatedButtonStyle,
                  child: const Text(
                    'SignUp',
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 1.2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Expanded(
                      child: Divider(height: 30.0, color: AppColor.buttonColor),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      'OR',
                      style: TextStyle(color: Color(0xFFD9AB68)),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                        child: Divider(
                      height: 30.0,
                      color: AppColor.buttonColor,
                    ))
                  ],
                ),
              ),
              SignInButton(Buttons.Google,
                  text: 'SignIn with Google', onPressed: () {}),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Need an account?'),
                  TextButton(onPressed: () {}, child: const Text('Sign Up'))
                ],
              )
            ],
          ),
        )),
      );
    }), listener: ((context, state) {
      // if (state is SuccessState) {
      //   Navigator.of(context).push(
      //     MaterialPageRoute(
      //       builder: (context) => HomeScreen(name: state.name, phoneNumber: state.phoneNumber,),
      //     ),
      //   );
      // }
      // if (state is ErrorState) {
      //   ScaffoldMessenger.of(context).showSnackBar(
      //     SnackBar(
      //       content: Text(state.message),
      //     ),
      //   );
      // }
      //  if (state is LoadingState) {
      //   ScaffoldMessenger.of(context).showSnackBar(
      //     SnackBar(
      //       content: Text(state.message),
      //     ),
      //   );
      // }
    }));
  }
}
