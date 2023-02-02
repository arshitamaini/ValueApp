import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:value_app/authentication/bloc/authentication_bloc.dart';
import 'package:value_app/authentication/screens/createAcount_screen.dart';
import 'package:value_app/home/screens/home_screen.dart';
import 'package:value_app/res/color.dart';
import 'package:value_app/res/style.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _phoneNumberController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();
  bool isPasswordvisible = true;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationBloc, AuthenticationState>(
        builder: ((context, state) {
      return Scaffold(
        body: SafeArea(
            child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/loginBg.png'),
                  fit: BoxFit.cover)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Login',
                style: AppStyle.screenHeadingStyle,
              ),
              const SizedBox(
                height: 20.0,
              ),
              SizedBox(
                height: 45,
                width: MediaQuery.of(context).size.width / 1.2,
                child: TextField(
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.phone,
                  controller: _phoneNumberController,
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
                    textInputAction: TextInputAction.done,
                    controller: _passwordController,
                    obscureText: isPasswordvisible,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(isPasswordvisible
                              ? Icons.visibility_off
                              : Icons.visibility),
                          onPressed: () {
                            setState(() {
                              isPasswordvisible = !isPasswordvisible;
                            });
                          },
                        ),
                        labelText: 'Password',
                        hintText: 'Password',
                        labelStyle: TextStyle(color: Color(0xFFD9AB68)),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide:
                              BorderSide(color: Colors.white, width: 2.0),
                        ),
                        contentPadding: EdgeInsets.only(left: 15.0),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide:
                              BorderSide(color: Color(0xFFD9AB68), width: 2.0),
                        ))),
              ),
              const SizedBox(
                height: 20.0,
              ),
              SizedBox(
                width: 120.0,
                child: ElevatedButton(
                  onPressed: (() {
                    // context.read<AuthenticationBloc>().add(APITestEvent());
                    if (_passwordController.text == '' ||
                        _phoneNumberController.text == '') {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Please Enter Complete Details'),
                      ));
                    } else if (_phoneNumberController.text.length != 10) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Please Enter Valid Phone Number'),
                      ));
                    } else {
                      context.read<AuthenticationBloc>().add(
                            LoginWithPhoneNumberAndPasswordEvent(
                              phoneNumber: _phoneNumberController.text,
                              password: _passwordController.text,
                            ),
                          );

                    }
                  }),
                  style: AppStyle.elevatedButtonStyle,
                  child: const Text(
                    'Login',
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 1.2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Expanded(
                      child: Divider(
                          height: 50.0,
                          thickness: 1.50,
                          color: AppColor.buttonColor),
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
                      thickness: 1.50,
                      height: 40.0,
                      color: AppColor.buttonColor,
                    ))
                  ],
                ),
              ),
              SizedBox(
                height: 45.0,
                width: MediaQuery.of(context).size.width / 1.4,
                child: ElevatedButton(
                  onPressed: () {},
                  style: AppStyle.elevatedButtonStyle,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      CircleAvatar(
                        radius: 20.0,
                        backgroundColor: Colors.transparent,
                        backgroundImage:
                            AssetImage('assets/images/googleLogo.png'),
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      Text('SignIn with Google')
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Need an account?',
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => SignUpScreen())));
                      },
                      child: const Text('Sign Up'))
                ],
              )
            ],
          ),
        )),
      );
    }), listener: ((context, state) {
      if (state is SuccessState) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => HomeScreen(
                name: state.userName,
                phoneNumber: state.userPhoneNumber,
                email: state.userEmail),
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
