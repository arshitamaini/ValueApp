import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:value_app/health/bloc/sleep_bloc/sleep_bloc.dart';
import 'package:value_app/health/bloc/steps_bloc/steps_bloc.dart';
import 'package:value_app/health/screens/mental_fitness_screen.dart';
import 'package:value_app/health/screens/physical_fitness_screen.dart';
import 'package:value_app/health/screens/sleep_screen.dart';
import 'package:value_app/health/screens/steps_screen.dart';
import 'package:value_app/res/color.dart';

class HealthScreen extends StatefulWidget {
  const HealthScreen({super.key});

  @override
  State<HealthScreen> createState() => _HealthScreenState();
}

class _HealthScreenState extends State<HealthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/background.png'),
                fit: BoxFit.cover)),
        child: SafeArea(
            child: Column(
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
                flex: 3,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 33),
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const MentalFitnessScreen())),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15.0)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                    'assets/images/mentalFitnessIcon.png'),
                                const Text(
                                  'Mental Fitness',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: AppColor.primaryColor),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 45.0,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const PhysicalFitnessScreen())),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15.0)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                    'assets/images/physicalFitnessIcon.png'),
                                const SizedBox(
                                  height: 15,
                                ),
                                const Text(
                                  'Physical Fitness',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: AppColor.primaryColor),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
            Expanded(
                flex: 7,
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(30.0))),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 17.0, top: 18.0),
                          child: Container(
                            padding: const EdgeInsets.only(left: 33.0),
                            height: 94.0,
                            decoration: const BoxDecoration(
                                color: Color(0xffF5F5F5),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(50.0),
                                    bottomLeft: Radius.circular(50.0))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('In progress',
                                          style: TextStyle(
                                              color: AppColor.primaryColor,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w700)),
                                      SizedBox(
                                        height: 11,
                                      ),
                                      Text(
                                        'Do exercise for 1 hour',
                                        style: TextStyle(
                                            color: AppColor.textColor,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14),
                                      )
                                    ],
                                  ),
                                ),
                                CircularPercentIndicator(
                                  animation: true,
                                  radius: 58.2 / 2,
                                  percent: 0.8,
                                  progressColor: AppColor.primaryColor,
                                  center: const Text('80%'),
                                ),
                                const SizedBox(
                                  width: 29.0,
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        Container(
                            padding: const EdgeInsets.only(left: 25.0),
                            alignment: Alignment.centerLeft,
                            child: const Text(
                              'Daily Activities',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.textColor),
                            )),
                        // Sleep Container
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 17, right: 31, top: 23.0),
                          child: GestureDetector(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => BlocProvider(
                                          create: (context) => SleepBloc(),
                                          child: const SleepScreen(),
                                        ))),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.0),
                                  color: Colors.white,
                                  border: Border.all(
                                      color: const Color(0xffEAEDFD)),
                                  boxShadow: const [
                                    BoxShadow(
                                        blurRadius: 15,
                                        color: Color.fromARGB(15, 18, 6, 33),
                                        offset: Offset(2, 2))
                                  ]),
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 21, horizontal: 30),
                                child: Row(
                                  children: [
                                    Image(
                                        image: AssetImage(
                                            'assets/images/sleepIcon.png')),
                                    SizedBox(
                                      width: 16.0,
                                    ),
                                    Expanded(
                                        child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Sleep',
                                          style: TextStyle(
                                              color: AppColor.textColor,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        Text('8hr 14min',
                                            style: TextStyle(
                                                color: Color(0xffCCCCCC),
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400)),
                                      ],
                                    )),
                                    Icon(
                                      Icons.chevron_right,
                                      color: AppColor.textColor,
                                      size: 35,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        //  Steps Container
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 17, right: 31, top: 23.0),
                          child: GestureDetector(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => BlocProvider(
                                          create: (context) => StepsBloc(),
                                          child: const StepsScreen(),
                                        ))),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.0),
                                  color: Colors.white,
                                  border: Border.all(
                                      color: const Color(0xffEAEDFD)),
                                  boxShadow: const [
                                    BoxShadow(
                                        blurRadius: 15,
                                        color: Color.fromARGB(15, 18, 6, 33),
                                        offset: Offset(2, 2))
                                  ]),
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 21, horizontal: 30),
                                child: Row(
                                  children: [
                                    Image(
                                        image: AssetImage(
                                            'assets/images/stepsIcon.png')),
                                    SizedBox(
                                      width: 16.0,
                                    ),
                                    Expanded(
                                        child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Steps',
                                          style: TextStyle(
                                              color: AppColor.textColor,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        Text('2541 steps',
                                            style: TextStyle(
                                                color: Color(0xffCCCCCC),
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400)),
                                      ],
                                    )),
                                    Icon(
                                      Icons.chevron_right,
                                      color: AppColor.textColor,
                                      size: 35,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.only(
                        //       left: 17, right: 31, top: 23),
                        //   child: Container(
                        //     padding: const EdgeInsets.all(8.0),
                        //     decoration: const BoxDecoration(boxShadow: [
                        //       BoxShadow(
                        //           blurRadius: 15.0,
                        //           offset: Offset(0, 2),
                        //           color: Color.fromARGB(15, 0, 0, 0))
                        //     ]),
                        //     child: Column(
                        //       children: [
                        //         Container(
                        //           alignment: Alignment.centerLeft,
                        //           child: const Column(
                        //             children: [
                        //               Text(
                        //                 'Complete',
                        //                 style: TextStyle(
                        //                     color: Color(0xff6552B1),
                        //                     fontWeight: FontWeight.w700,
                        //                     fontSize: 14.0),
                        //               ),
                        //             ],
                        //           ),
                        //         )
                        //       ],
                        //     ),
                        //   ),
                        // )
                      ],
                    ),
                  ),
                ))
          ],
        )),
      ),
    );
  }
}
