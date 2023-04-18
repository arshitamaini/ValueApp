import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:value_app/authentication/login_signup/bloc/authentication_bloc.dart';
import 'package:value_app/authentication/login_signup/screens/login_screen.dart';
import 'package:value_app/common_bloc/password_visibility_bloc/password_visibility_bloc.dart';
import 'package:value_app/res/color.dart';
import 'package:value_app/res/style.dart';

class SuccessPasswordScreen extends StatelessWidget {
  const SuccessPasswordScreen({super.key});
  static String tag = 'success-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/splashScreenBg.png'),
                fit: BoxFit.cover)),
        child: SafeArea(
            child: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.fromLTRB(23.0, 157.0, 23.0, 0),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(15.0),
                topLeft: Radius.circular(15.0),
              )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Image(image: AssetImage('assets/images/success_icon.png')),
              const SizedBox(
                height: 18.0,
              ),
              const Text(
                'Password Changed Successfully',
                style: TextStyle(
                    color: AppColor.textColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 12.0,
              ),
              const Text(
                'Please login to continue',
                style: TextStyle(
                    color: AppColor.textColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 32.0,
              ),
              SizedBox(
                height: 45.0,
                width: MediaQuery.of(context).size.width / 1.3,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MultiBlocProvider(
                                  providers: [
                                    BlocProvider(
                                      create: (context) => AuthenticationBloc(),
                                    ),
                                    BlocProvider(
                                      create: (context) =>
                                          PasswordVisibilityBloc(),
                                    ),
                                  ],
                                  child: const LoginScreen(),
                                )),
                      );
                    },
                    style: AppStyle.elevatedButtonStyle,
                    child: const Text('Login')),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
