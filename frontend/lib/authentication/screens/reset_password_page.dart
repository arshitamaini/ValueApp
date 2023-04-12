import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:value_app/authentication/bloc/otp_bloc/bloc/otp_bloc.dart';
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
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
              child: Form(
                key: formKey,
                child:
                    BlocConsumer<OtpBloc, OtpState>(listener: (context, state) {
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
                            builder: (context) => BlocProvider(
                                  create: (context) => OtpBloc(),
                                  child: OTPScreen(
                                    otp: state.otp,
                                    emailPhoneNumber: controller.text,
                                  ),
                                )));
                  }
                }, builder: (context, state) {
                  return Column(
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
                          height: 26.0,
                        ),
                        Text(
                          'Reset Password',
                          style: AppStyle.screenHeadingStyle,
                        ),
                        const SizedBox(
                          height: 56.0,
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
                          width: MediaQuery.of(context).size.width / 1.3,
                          // height: 45.0,
                          child: TextFormField(
                            controller: controller,
                            decoration: AppStyle.textFieldStyle,
                            textInputAction: TextInputAction.done,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter your Email/Mobile Number';
                              }
                              return null;
                            },
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
                                if (formKey.currentState!.validate()) {
                                  context.read<OtpBloc>().add(GetOtpEvent(
                                      emailPhoneNumber: controller.text));
                                }
                              }),
                              style: AppStyle.elevatedButtonStyle,
                              child: const Text('Get OTP')),
                        ),
                      ]);
                }),
              ),
            ),
          )),
    );
  }
}
