import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:value_app/authentication/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:value_app/authentication/screens/login_screen.dart';
import 'package:value_app/home/screens/home_screen.dart';
import 'package:value_app/password_visibility_bloc/password_visibility_bloc.dart';
import 'package:value_app/res/color.dart';
import 'package:value_app/res/style.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailPhoneNumberController =
      TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  bool isPasswordVisible = true;
  bool isConfirmPasswordvisible = true;
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return BlocConsumer<AuthenticationBloc, AuthenticationState>(
        builder: ((context, state) {
      return Scaffold(
        body: Stack(
          children: [
            // Background Image
            Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/splashScreenBg.png'),
                        fit: BoxFit.cover))),
            // SignUp Container
            Container(
              margin: const EdgeInsets.fromLTRB(25.0, 150.0, 25.0, 0.0),
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15.0),
                    topLeft: Radius.circular(15.0),
                  )),
              child: Center(
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 30.0,
                        ),
                        Center(
                            child: Text('SIGNUP',
                                style: AppStyle.screenHeadingStyle)),
                        const SizedBox(
                          height: 2.0,
                        ),
                        // First and Last Name Text Feilds
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 1.3,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0, vertical: 5.0),
                                      child: Text(
                                        'First Name',
                                        textAlign: TextAlign.left,
                                        style: AppStyle.textFieldLabelStyle,
                                      ),
                                    ),
                                    TextFormField(
                                      textInputAction: TextInputAction.next,
                                      textAlign: TextAlign.start,
                                      controller: _firstNameController,
                                      decoration: AppStyle.textFieldStyle,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Enter your first name';
                                        }
                                        return null;
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 20.0,
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5.0, horizontal: 8.0),
                                      child: Text(
                                        'Last Name',
                                        style: AppStyle.textFieldLabelStyle,
                                      ),
                                    ),
                                    TextFormField(
                                      textInputAction: TextInputAction.next,
                                      textAlign: TextAlign.start,
                                      controller: _lastNameController,
                                      decoration: AppStyle.textFieldStyle,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Enter your last name';
                                        }
                                        return null;
                                      },
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
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
                        // Email Phone Number TextField
                        SizedBox(
                          // height: 45,
                          width: MediaQuery.of(context).size.width / 1.3,
                          child: TextFormField(
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.phone,
                            controller: _emailPhoneNumberController,
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
                          height: 10.0,
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
                        BlocBuilder<PasswordVisibilityBloc,
                            PasswordVisibilityState>(
                          builder: (context, passwordState) {
                            isPasswordVisible =
                                passwordState is ChangePasswordVisibilityState
                                    ? passwordState.isVisible
                                    : isPasswordVisible;
                            return SizedBox(
                              // height: 45,
                              width: MediaQuery.of(context).size.width / 1.3,
                              child: TextFormField(
                                  textInputAction: TextInputAction.done,
                                  controller: _passwordController,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Enter your password';
                                    }
                                    return null;
                                  },
                                  obscureText: isPasswordVisible,
                                  decoration: InputDecoration(
                                    suffixIcon: TextButton(
                                      style: TextButton.styleFrom(
                                        foregroundColor:
                                            const Color(0xFFCAC9CC),
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
                                    border: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15.0)),
                                        borderSide: BorderSide(
                                            color: Color(0xFFC7C7C8))),
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 8.0, horizontal: 10.0),
                                  )),
                            );
                          },
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: Align(
                              alignment: const Alignment(-0.76, 0),
                              child: Text(
                                'Confirm Password',
                                style: AppStyle.textFieldLabelStyle,
                              )),
                        ),
                        // Confirm Password Textfeild
                        BlocBuilder<PasswordVisibilityBloc,
                            PasswordVisibilityState>(
                          builder: (context, confirmPasswordState) {
                            isConfirmPasswordvisible = confirmPasswordState
                                    is ChangePasswordVisibilityState
                                ? confirmPasswordState.isVisible
                                : isConfirmPasswordvisible;

                            return SizedBox(
                              // height: 45,
                              width: MediaQuery.of(context).size.width / 1.3,
                              child: TextFormField(
                                  textInputAction: TextInputAction.done,
                                  controller: _confirmPasswordController,
                                  obscureText: isConfirmPasswordvisible,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Enter your confirm password';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    suffixIcon: TextButton(
                                      style: TextButton.styleFrom(
                                        foregroundColor:
                                            const Color(0xFFCAC9CC),
                                      ),
                                      child: isConfirmPasswordvisible
                                          ? const Text('SHOW')
                                          : const Text('HIDE'),
                                      onPressed: () {
                                        context
                                            .read<PasswordVisibilityBloc>()
                                            .add(ChangePasswordVisibilityEvent(
                                                isVisible:
                                                    isConfirmPasswordvisible));
                                      },
                                    ),
                                    hintText: 'Add Here',
                                    hintStyle: const TextStyle(
                                      color: Color(0xFFCAC9CC),
                                    ),
                                    border: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15.0)),
                                        borderSide: BorderSide(
                                            color: Color(0xFFC7C7C8))),
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 8.0, horizontal: 10.0),
                                  )),
                            );
                          },
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        // SignUp Button
                        SizedBox(
                          height: 40.0,
                          width: MediaQuery.of(context).size.width / 1.3,
                          child: ElevatedButton(
                            onPressed: (() {
                              if (formKey.currentState!.validate() &&
                                  _passwordController.text ==
                                      _confirmPasswordController.text) {
                                context.read<AuthenticationBloc>().add(
                                      CreateAccountEvent(
                                        firstName: _firstNameController.text,
                                        lastName: _lastNameController.text,
                                        password: _passwordController.text,
                                        emailPhoneNumber:
                                            _emailPhoneNumberController.text,
                                      ),
                                    );
                              } else if (_passwordController.text !=
                                  _confirmPasswordController.text) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                  content: Text(
                                      'Password and confirm password does not match'),
                                ));
                              } else {
                                print('not ok');
                              }
                            }),
                            style: AppStyle.elevatedButtonStyle,
                            child: const Text(
                              'SignUp',
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 1.3,
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Divider(
                                    height: 40.0,
                                    thickness: 1.50,
                                    color: Color(0xFFCAC9CC)),
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
                                height: 40.0,
                                thickness: 1.50,
                                color: Color(0xFFCAC9CC),
                              ))
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        // Google SignUp Button
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
                              children:  [
                                CircleAvatar(
                                  radius: 13.0,
                                  backgroundColor: Colors.transparent,
                                  backgroundImage: AssetImage(
                                      'assets/images/googleLogo.png'),
                                ),
                                SizedBox(
                                  width: 20.0,
                                ),
                                Text(
                                  'continue with google',
                                  style: TextStyle(
                                      color: AppColor.textColor,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 18.0),
                                )
                              ],
                            ),
                          ),
                        ),
                        // Login Text Button
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Already a user?',
                              style: TextStyle(
                                  color: Color(0xFFB9BABB), fontSize: 18.0),
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: ((context) =>
                                              MultiBlocProvider(
                                                providers: [
                                                  BlocProvider(
                                                    create: (context) =>
                                                        AuthenticationBloc(),
                                                  ),
                                                  BlocProvider(
                                                    create: (context) =>
                                                        PasswordVisibilityBloc(),
                                                  ),
                                                ],
                                                child: const LoginScreen(),
                                              ))));
                                },
                                style: TextButton.styleFrom(
                                  foregroundColor: const Color(0xFF5C4AA6),
                                ),
                                child: const Text('Login',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w700)))
                          ],
                        )
                      ],
                    ),
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
