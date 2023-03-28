import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:value_app/authentication/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:value_app/authentication/screens/login_screen.dart';
import 'package:value_app/res/color.dart';
import 'package:value_app/res/style.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({super.key});

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/splashScreenBg.png'),
                      fit: BoxFit.cover))),
          Container(
            margin: const EdgeInsets.fromLTRB(25.0, 150.0, 25.0, 0.0),
            alignment: Alignment.center,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15.0),
                  topLeft: Radius.circular(15.0),
                )),
            child: BlocConsumer<AuthenticationBloc, AuthenticationState>(
              listener: (_, state) {},
              builder: (context, state) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(26, 40, 27, 0),
                  child: ListView(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 60.0,
                      ),
                      Center(
                        child: Text(
                          'Set a new password',
                          style: AppStyle.screenHeadingStyle,
                        ),
                      ),
                      const SizedBox(
                        height: 60.0,
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(left: 10, bottom: 5.0),
                        child: const Text(
                          'Password',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: AppColor.textColor),
                        ),
                      ),
                      SizedBox(
                        // height: 45,
                        width: MediaQuery.of(context).size.width / 1.3,
                        child: TextFormField(
                            textInputAction: TextInputAction.done,
                            controller: _passwordController,
                            obscureText: isPasswordVisible,
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
                                child: isPasswordVisible
                                    ? const Text('SHOW')
                                    : const Text('HIDE'),
                                onPressed: () {
                                  context
                                      .read<AuthenticationBloc>()
                                      .add(ChangePasswordVisibilityEvent());
                                  if (state is ChangePasswordVisibilityState) {
                                    isPasswordVisible = !isPasswordVisible;
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
                            )),
                      ),
                      const SizedBox(
                        height: 22,
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(left: 10, bottom: 5.0),
                        child: const Text(
                          'Confirm Password',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: AppColor.textColor),
                        ),
                      ),
                      SizedBox(
                        // height: 45,
                        width: MediaQuery.of(context).size.width / 1.3,
                        child: TextFormField(
                            textInputAction: TextInputAction.done,
                            controller: _confirmPasswordController,
                            obscureText: isConfirmPasswordVisible,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter confirm password';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              suffixIcon: BlocConsumer<AuthenticationBloc,
                                  AuthenticationState>(
                                listener: (_, state) {},
                                builder: (context, state) {
                                  return TextButton(
                                    style: TextButton.styleFrom(
                                      foregroundColor: const Color(0xFFCAC9CC),
                                    ),
                                    child: isConfirmPasswordVisible
                                        ? const Text('SHOW')
                                        : const Text('HIDE'),
                                    onPressed: () {
                                      context
                                          .read<AuthenticationBloc>()
                                          .add(ChangePasswordVisibilityEvent());
                                      if (state
                                          is ChangePasswordVisibilityState) {
                                        isConfirmPasswordVisible =
                                            !isConfirmPasswordVisible;
                                      }
                                    },
                                  );
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
                      const SizedBox(
                        height: 30.0,
                      ),
                      SizedBox(
                        height: 45.0,
                        width: MediaQuery.of(context).size.width / 1.3,
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => BlocProvider(
                                            create: (context) =>
                                                AuthenticationBloc(),
                                            child: const LoginScreen(),
                                          )),
                                  ModalRoute.withName(LoginScreen.tag));
                            },
                            style: AppStyle.elevatedButtonStyle,
                            child: const Text('Done')),
                      ),
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
