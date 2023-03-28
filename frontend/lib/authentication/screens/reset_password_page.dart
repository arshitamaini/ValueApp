import 'package:flutter/material.dart';
import 'package:value_app/authentication/screens/new_password_screen.dart';
import 'package:value_app/authentication/screens/otp_screen.dart';
import 'package:value_app/res/color.dart';
import 'package:value_app/res/style.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Icon(
                      Icons.arrow_back,
                      size: 30,
                      color: AppColor.textColor,
                    )),
              ),
              const SizedBox(
                height: 36.0,
              ),
              Text(
                'Reset Password',
                style: AppStyle.screenHeadingStyle,
              ),
              const SizedBox(
                height: 66.0,
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 29, bottom: 5.0),
                child: Text(
                  'Email/Mobile Number',
                  style: AppStyle.textFieldLabelStyle,
                ),
              ),
              SizedBox(
                width: 294.0,
                height: 45.0,
                child: TextField(
                  controller: controller,
                  decoration: AppStyle.textFieldStyle,
                  textInputAction: TextInputAction.done,
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              SizedBox(
                height: 45.0,
                width: MediaQuery.of(context).size.width / 1.3,
                child: ElevatedButton(
                    onPressed: (() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const OTPScreen()));
                    }),
                    style: AppStyle.elevatedButtonStyle,
                    child: const Text('Get OTP')),
              )
            ],
          ),
        )
      ]),
    );
  }
}
