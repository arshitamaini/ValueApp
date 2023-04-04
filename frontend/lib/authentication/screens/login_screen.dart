import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:value_app/authentication/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:value_app/authentication/screens/create_account_screen.dart';
import 'package:value_app/authentication/screens/reset_password_page.dart';
import 'package:value_app/home/screens/home_screen.dart';
import 'package:value_app/res/color.dart';
import 'package:value_app/res/style.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static String tag = 'login-screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailPhoneNumberController =
      TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isPasswordvisible = true;
  bool? rememberMe = true;
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return BlocConsumer<AuthenticationBloc, AuthenticationState>(
        builder: ((context, state) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/splashScreenBg.png'),
                        fit: BoxFit.cover))),
            Container(
              margin: const EdgeInsets.fromLTRB(23.0, 157.0, 23.0, 0),
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15.0),
                    topLeft: Radius.circular(15.0),
                  )),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        'Login',
                        style: AppStyle.screenHeadingStyle,
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: Align(
                            alignment: const Alignment(-0.70, 0),
                            child: Text(
                              'Email/Mobile Number',
                              style: AppStyle.textFieldLabelStyle,
                            )),
                      ),
                      // Email/Mobile Number TextField
                      SizedBox(
                        // height: 45,
                        width: MediaQuery.of(context).size.width / 1.3,
                        child: TextFormField(
                          controller: _emailPhoneNumberController,
                          textInputAction: TextInputAction.next,
                          decoration: AppStyle.textFieldStyle,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter your Email/Mobile Number';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: Align(
                            alignment: const Alignment(-0.80, 0),
                            child: Text(
                              'Password',
                              style: AppStyle.textFieldLabelStyle,
                            )),
                      ),
                      // Password TextField
                      SizedBox(
                        // height: 45,
                        width: MediaQuery.of(context).size.width / 1.3,
                        child: TextFormField(
                            textInputAction: TextInputAction.done,
                            controller: _passwordController,
                            obscureText: isPasswordvisible,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter your password';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              suffixIcon: TextButton(
                                style: TextButton.styleFrom(
                                  foregroundColor: const Color(0xFFCAC9CC),
                                ),
                                child: isPasswordvisible
                                    ? const Text('SHOW')
                                    : const Text('HIDE'),
                                onPressed: () {
                                  context
                                      .read<AuthenticationBloc>()
                                      .add(ChangePasswordVisibilityEvent());
                                  if (state is ChangePasswordVisibilityState) {
                                    isPasswordvisible = !isPasswordvisible;
                                  }
                                },
                              ),
                              hintText: 'Add Here',
                              hintStyle: const TextStyle(
                                color: Color(0xFFCAC9CC),
                              ),
                              // contentPadding: const EdgeInsets.only(left: 15.0),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 10.0),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: const BorderSide(
                                      color: Color(0xFFC7C7C8))),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: const BorderSide(
                                      color: Color(0xFFC7C7C8))),
                              errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide:
                                      const BorderSide(color: Colors.red)),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide:
                                      const BorderSide(color: Colors.red)),
                              // border: const OutlineInputBorder(
                              //     borderRadius:
                              //         BorderRadius.all(Radius.circular(15.0)),
                              //     borderSide:
                              //         BorderSide(color: Color(0xFFC7C7C8))),
                            )),
                      ),
                      // Forget/Remember button
                      Container(
                        width: MediaQuery.of(context).size.width / 1.3,
                        alignment: Alignment.centerRight,
                        child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const ResetPasswordScreen()));
                            },
                            child: const Text(
                              'Forget Password?',
                              style: TextStyle(
                                  color: Color(0xff5C4AA6),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12.0),
                            )),
                      ),
                      const SizedBox(
                        height: 35.0,
                      ),
                      // Login Button
                      SizedBox(
                        height: 45.0,
                        width: MediaQuery.of(context).size.width / 1.3,
                        child: ElevatedButton(
                          onPressed: (() {
                            // Navigator.of(context).push(
                            //   MaterialPageRoute(
                            //     builder: (context) => const HomeScreen(
                            //         firstName: "Nitesh",
                            //         lastName: "Verma",
                            //         emailPhoneNumber: "797977458"),
                            //   ),
                            // );

                            if (formKey.currentState!.validate()) {
                              context.read<AuthenticationBloc>().add(
                                    LoginWithPhoneNumberAndPasswordEvent(
                                      emailPhoneNumber:
                                          _emailPhoneNumberController.text,
                                      password: _passwordController.text,
                                    ),
                                  );
                            } else {
                              log('not ok');
                            }
                          }),
                          style: AppStyle.elevatedButtonStyle,
                          child: const Text(
                            'Login',
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 1.3,
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Divider(
                                  height: 50.0,
                                  thickness: 1.50,
                                  color: Color(0xFFCAC9CC)),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              'or',
                              style: TextStyle(color: Color(0xFFCAC9CC)),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Expanded(
                                child: Divider(
                              thickness: 1.50,
                              height: 40.0,
                              color: Color(0xFFCAC9CC),
                            ))
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      // Google SignIn Button
                      SizedBox(
                        height: 40.0,
                        width: MediaQuery.of(context).size.width / 1.3,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            elevation: 2.0,
                            foregroundColor: AppColor.textColor,
                            backgroundColor: const Color(0xFFF4F4FE),
                            textStyle: const TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.w500),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 15.0,
                                backgroundColor: Colors.transparent,
                                backgroundImage:
                                    AssetImage('assets/images/googleLogo.png'),
                              ),
                              SizedBox(
                                width: 20.0,
                              ),
                              Text(
                                'continue with google',
                                style: TextStyle(
                                    color: AppColor.textColor,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14.0),
                              )
                            ],
                          ),
                        ),
                      ),
                      // SignUp Text Button
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Need an account?',
                            style: TextStyle(color: Color(0xffAAAAAA)),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) => BlocProvider(
                                              create: (context) =>
                                                  AuthenticationBloc(),
                                              child: const SignUpScreen(),
                                            ))));
                              },
                              style: TextButton.styleFrom(
                                foregroundColor: const Color(0xFF5C4AA6),
                              ),
                              child: const Text(
                                'Sign Up',
                                style: TextStyle(fontWeight: FontWeight.w700),
                              ))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }), listener: ((context, state) {
      if (state is SuccessState) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => HomeScreen(
                firstName: state.firstName,
                lastName: state.lastName,
                emailPhoneNumber: state.emailPhoneNumber),
          ),
        );
      }

      if (state is ErrorState) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(state.message),
          ),
        );
      }
      if (state is LoadingState) {
        const CircularProgressIndicator();
      }
    }));
  }
}
