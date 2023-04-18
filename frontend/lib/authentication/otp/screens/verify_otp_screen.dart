import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:value_app/authentication/forget_password/bloc/change_password_bloc.dart';
import 'package:value_app/authentication/forget_password/screens/new_password_screen.dart';
import 'package:value_app/authentication/login_signup/bloc/authentication_bloc.dart';
import 'package:value_app/authentication/otp/bloc/otp_bloc.dart';
import 'package:value_app/common_bloc/password_visibility_bloc/password_visibility_bloc.dart';
import 'package:value_app/res/color.dart';
import 'package:value_app/res/style.dart';

// Assuming the length of OTP is 6
class OTPScreen extends StatefulWidget {
  final String otp;
  final String emailPhoneNumber;
  const OTPScreen(
      {super.key, required this.otp, required this.emailPhoneNumber});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  /// zero-width space character
  ///
  /// this character can be added to a string to detect backspace.
  /// The value, from its name, has a zero-width so it's not rendered
  /// in the screen but it'll be present in the String.
  ///
  /// The main reason this value is used because in Flutter mobile,
  /// backspace is not detected when there's nothing to delete.
  static const zwsp = '\u200b';

// the selection is at offset 1 so any character is inserted after it.
  static const zwspEditingValue = TextEditingValue(
      text: zwsp, selection: TextSelection(baseOffset: 1, extentOffset: 1));
  List<String> otp = ['', '', '', '', '', ''];
  String userOtp = '';
  List<TextEditingController> controllers = List.generate(6, (index) {
    final ctrl = TextEditingController();
    ctrl.value = zwspEditingValue;
    return ctrl;
  });
  List<FocusNode> focusNodes = List.generate(6, (index) => FocusNode());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      // give the focus to the first node.
      focusNodes[0].requestFocus();
    });
  }

  @override
  void dispose() {
    super.dispose();
    for (var focusNode in focusNodes) {
      focusNode.dispose();
    }
    for (var controller in controllers) {
      controller.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/splashScreenBg.png'),
                  fit: BoxFit.cover)),
          child: Container(
            margin: const EdgeInsets.fromLTRB(25.0, 150.0, 25.0, 0.0),
            alignment: Alignment.center,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15.0),
                  topLeft: Radius.circular(15.0),
                )),
            child: Center(
              child: ListView(
                children: [
                  BlocConsumer<OtpBloc, OtpState>(
                    listener: (context, state) {
                      if (state is LoadingOtpState) {
                        const CircularProgressIndicator();
                      }
                      if (state is ErrorOtpState) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(state.message),
                          ),
                        );
                      }
                      if (state is SuccessOtpState) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MultiBlocProvider(
                                      providers: [
                                        BlocProvider(
                                          create: (context) =>
                                              PasswordVisibilityBloc(),
                                        ),
                                        BlocProvider(
                                          create: (context) =>
                                              ChangePasswordBloc(),
                                        ),
                                        BlocProvider(
                                          create: (context) =>
                                              AuthenticationBloc(),
                                        ),
                                      ],
                                      child: NewPasswordScreen(
                                        emailPhoneNumber:
                                            widget.emailPhoneNumber,
                                      ),
                                    )));
                      }
                    },
                    builder: (context, state) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
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
                          Text(
                            'Reset Password',
                            style: AppStyle.screenHeadingStyle,
                          ),
                          const SizedBox(
                            height: 11,
                          ),
                          const Text(
                            'Enter the one time password sent on your registered',
                            style: TextStyle(
                                fontSize: 14.0,
                                overflow: TextOverflow.visible,
                                color: AppColor.textColor,
                                fontWeight: FontWeight.w400),
                          ),
                          const Text(
                            'phone number/email',
                            style: TextStyle(
                                fontSize: 14.0,
                                overflow: TextOverflow.visible,
                                color: AppColor.textColor,
                                fontWeight: FontWeight.w400),
                          ),
                          const SizedBox(
                            height: 58,
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.only(left: 29),
                            child: const Text(
                              'Enter OTP',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  color: AppColor.textColor),
                            ),
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(6, (index) {
                              return Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: SizedBox(
                                  height: 45.0,
                                  width: 40.0,
                                  child: TextField(
                                    controller: controllers[index],
                                    focusNode: focusNodes[index],
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.center,
                                    decoration: AppStyle.textFieldStyle,
                                    onChanged: ((value) {
                                      if (value.length > 1) {
                                        // this is a new character event
                                        if (index + 1 == focusNodes.length) {
                                          // do something after the last character was inserted
                                          FocusScope.of(context).unfocus();
                                        } else {
                                          // move to the next field
                                          focusNodes[index + 1].requestFocus();
                                        }
                                      } else {
                                        // this is backspace event
                                        // reset the controller
                                        controllers[index].value =
                                            zwspEditingValue;
                                        if (index == 0) {
                                          // do something if backspace was pressed at the first field
                                        } else {
                                          // go back to previous field
                                          controllers[index - 1].value =
                                              zwspEditingValue;
                                          focusNodes[index - 1].requestFocus();
                                        }
                                      }
                                      // make sure to remove the zwsp character
                                      otp[index] = value.replaceAll(zwsp, '');
                                    }),
                                  ),
                                ),
                              );
                            }),
                          ),
                          const SizedBox(
                            height: 50.0,
                          ),
                          const Text(
                            'Resend OTP in',
                            style: TextStyle(
                                color: AppColor.textColor,
                                fontWeight: FontWeight.w400,
                                fontSize: 14.0),
                          ),
                          const Text('00:00:00',
                              style: TextStyle(
                                  color: AppColor.textColor,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14.0)),
                          const SizedBox(
                            height: 58.0,
                          ),
                          SizedBox(
                            height: 45.0,
                            width: MediaQuery.of(context).size.width / 1.3,
                            child: ElevatedButton(
                                onPressed: () {
                                  userOtp = otp.join();
                                  context.read<OtpBloc>().add(VerfyOtpEvent(
                                      userOtp: userOtp,
                                      emailPhoneNumber:
                                          widget.emailPhoneNumber));
                                },
                                style: AppStyle.elevatedButtonStyle,
                                child: const Text('Verify OTP')),
                          ),
                          const SizedBox(
                            height: 25.0,
                          ),
                          TextButton(
                              onPressed: () {},
                              child: const Text(
                                'Retry',
                                style: TextStyle(
                                    color: AppColor.primaryColor,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w700),
                              ))
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
