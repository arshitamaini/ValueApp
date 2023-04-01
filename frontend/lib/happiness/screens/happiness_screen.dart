import 'package:flutter/material.dart';
import 'package:value_app/res/color.dart';

class HappinessScreen extends StatefulWidget {
  const HappinessScreen({super.key});

  @override
  State<HappinessScreen> createState() => _HappinessScreenState();
}

class _HappinessScreenState extends State<HappinessScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/background.png'),
                    fit: BoxFit.cover)),
          ),
          SafeArea(
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      child: TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Icon(
                            Icons.arrow_back,
                            size: 30,
                            color: Colors.white,
                          )),
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.topRight,
                        padding: const EdgeInsets.only(right: 23.0),
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              elevation: 2.0,
                              backgroundColor: Colors.white,
                              foregroundColor: AppColor.textColor,
                              textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w400),
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15.0)))),
                          child: const Text('Next'),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  height: 443 * 2,
                  width: 443 * 2,
                  decoration: BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                )
                // Expanded(
                //     child: Container(
                //   decoration: const BoxDecoration(
                //     color: Colors.white,
                //   ),
                // ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
