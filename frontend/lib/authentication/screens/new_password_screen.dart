import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:value_app/authentication/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:value_app/authentication/bloc/change_password_bloc/change_password_bloc.dart';
import 'package:value_app/authentication/screens/login_screen.dart';
import 'package:value_app/password_visibility_bloc/password_visibility_bloc.dart';
import 'package:value_app/res/color.dart';
import 'package:value_app/res/style.dart';

class NewPasswordScreen extends StatefulWidget {
  final String emailPhoneNumber;
  const NewPasswordScreen({super.key, required this.emailPhoneNumber});

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/splashScreenBg.png'),
                  fit: BoxFit.cover)),
          child: Container(
            margin: const EdgeInsets.fromLTRB(25.0, 150.0, 25.0, 0.0),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15.0),
                  topLeft: Radius.circular(15.0),
                )),
            child: BlocConsumer<ChangePasswordBloc, ChangePasswordState>(
              listener: (context, state) {
                if (state is SuccessPassowrdState) {
                  Navigator.pushAndRemoveUntil(
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
                      ModalRoute.withName(LoginScreen.tag));
                }
              },
              builder: (context, state) {
                if (state is LoadingPasswordState) {
                  const Center(
                    child: CircularProgressIndicator(
                      color: AppColor.primaryColor,
                    ),
                  );
                }
                if (state is ErrorPasswordState) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text(
                        'Something went wrong, Password cannot be changed'),
                  ));
                }
                return Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        child: TextButton(
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
                            child: const Icon(
                              Icons.arrow_back,
                              size: 30,
                              color: AppColor.textColor,
                            )),
                      ),
                      Center(
                        child: Text(
                          'Set a new password',
                          style: AppStyle.screenHeadingStyle,
                        ),
                      ),
                      const SizedBox(
                        height: 40.0,
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(left: 30, bottom: 5.0),
                        child: const Text(
                          'Password',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: AppColor.textColor),
                        ),
                      ),
                      BlocConsumer<PasswordVisibilityBloc,
                          PasswordVisibilityState>(
                        listener: (_, passwordState) {},
                        builder: (context, passwordState) {
                          isPasswordVisible =
                              passwordState is ChangePasswordVisibilityState
                                  ? passwordState.isVisible
                                  : isPasswordVisible;

                          return SizedBox(
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
                                          .read<PasswordVisibilityBloc>()
                                          .add(ChangePasswordVisibilityEvent(
                                              isVisible: isPasswordVisible));
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
                          );
                        },
                      ),
                      const SizedBox(
                        height: 22,
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(left: 30, bottom: 5.0),
                        child: const Text(
                          'Confirm Password',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: AppColor.textColor),
                        ),
                      ),
                      BlocConsumer<PasswordVisibilityBloc,
                          PasswordVisibilityState>(
                        listener: (_, confirmPasswordState) {},
                        builder: (context, confirmPasswordState) {
                          isConfirmPasswordVisible = confirmPasswordState
                                  is ChangePasswordVisibilityState
                              ? confirmPasswordState.isVisible
                              : isConfirmPasswordVisible;

                          return SizedBox(
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
                                  if (value != _passwordController.text) {
                                    return 'Comfirm password doesn\'t match';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  suffixIcon: BlocConsumer<
                                      PasswordVisibilityBloc,
                                      PasswordVisibilityState>(
                                    listener: (_, confirmPasswordState) {},
                                    builder: (context, confirmPasswordState) {
                                      return TextButton(
                                        style: TextButton.styleFrom(
                                          foregroundColor:
                                              const Color(0xFFCAC9CC),
                                        ),
                                        child: isConfirmPasswordVisible
                                            ? const Text('SHOW')
                                            : const Text('HIDE'),
                                        onPressed: () {
                                          context
                                              .read<PasswordVisibilityBloc>()
                                              .add(ChangePasswordVisibilityEvent(
                                                  isVisible:
                                                      isConfirmPasswordVisible));
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
                          );
                        },
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      SizedBox(
                        height: 45.0,
                        width: MediaQuery.of(context).size.width / 1.3,
                        child: ElevatedButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                context.read<ChangePasswordBloc>().add(
                                    PasswordChangeEvent(
                                        emailPhoneNumber:
                                            widget.emailPhoneNumber,
                                        newPassword:
                                            _confirmPasswordController.text));
                              }
                            },
                            style: AppStyle.elevatedButtonStyle,
                            child: const Text('Done')),
                      ),
                    ],
                  ),
                );
              },
            ),
          )),
    );
  }
}
