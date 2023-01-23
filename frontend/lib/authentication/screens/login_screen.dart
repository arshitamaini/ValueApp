import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:value_app/authentication/screens/createAcoount_screen.dart';
import 'package:value_app/res/color.dart';
import 'package:value_app/res/style.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/loginBg.png'), fit: BoxFit.cover)),
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
                  controller: _passwordController,
                  decoration: AppStyle.textFieldStyle('Password')),
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
  }
}
