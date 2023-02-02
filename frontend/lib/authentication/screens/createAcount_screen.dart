import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:value_app/authentication/bloc/authentication_bloc.dart';
import 'package:value_app/authentication/screens/login_screen.dart';
import 'package:value_app/home/screens/home_screen.dart';
import 'package:value_app/res/style.dart';
import '../../res/color.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationBloc, AuthenticationState>(
        builder: ((context, state) {
      return Scaffold(
        body: SafeArea(
            child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/loginBg.png'),
                  fit: BoxFit.cover)),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 50.0,
                ),
                Text('SIGNUP', style: AppStyle.screenHeadingStyle),
                const SizedBox(
                  height: 20.0,
                ),
                SizedBox(
                  height: 45,
                  width: MediaQuery.of(context).size.width / 1.2,
                  child: TextField(
                    textInputAction: TextInputAction.next,
                    textAlign: TextAlign.start,
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
                    textInputAction: TextInputAction.next,
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
                    textInputAction: TextInputAction.go,
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
                    onPressed: (() {
                      if (_nameController.text == '' ||
                          _emailController.text == '' ||
                          _passwordController.text == '' ||
                          _phoneNumberController.text == '') {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text('Please Enter Complete Details'),
                        ));
                      } else if (_phoneNumberController.text.length != 10) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text('Please Enter Valid Phone Number'),
                        ));
                      } else if (_passwordController.text ==
                          _confirmPasswordController.text) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text(
                              'Password and confirm password does not match'),
                        ));
                      } else {
                        context.read<AuthenticationBloc>().add(
                              CreateAccountEvent(
                                name: _nameController.text,
                                email: _emailController.text,
                                password: _passwordController.text,
                                phoneNumber: _phoneNumberController.text,
                              ),
                            );
                      }
                    }),
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
                        child: Divider(
                            height: 40.0,
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
                        height: 40.0,
                        thickness: 1.50,
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

                // SignInButton(Buttons.Google,
                //     text: 'SignIn with Google', onPressed: () {}),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already a user?',
                      style:
                          TextStyle(color: Color(0xFFB9BABB), fontSize: 18.0),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => LoginScreen())));
                        },
                        child: const Text('Login',
                            style: TextStyle(fontSize: 18.0)))
                  ],
                )
              ],
            ),
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
