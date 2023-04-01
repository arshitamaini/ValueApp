import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:value_app/health/bloc/timer_bloc.dart';
import 'package:value_app/health/screens/timer_screen.dart';
import 'package:value_app/res/color.dart';

class PhysicalFitnessScreen extends StatefulWidget {
  const PhysicalFitnessScreen({super.key});

  @override
  State<PhysicalFitnessScreen> createState() => _PhysicalFitnessScreenState();
}

class _PhysicalFitnessScreenState extends State<PhysicalFitnessScreen> {
  List<String> taskList = ['Yoga', 'Exercise', 'Swimming'];
  List<String> taskdescriptionList = [
    'Yoga improves strength, balance and flexibility',
    'Improve Your Ability to do Daily Activities and Prevent Falls',
    'Increases your heart rate without stressing your body'
  ];
  List<int> taskTime = [10, 25, 15];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/background.png'),
                fit: BoxFit.cover)),
        child: SafeArea(
            child: Column(
          children: [
            Expanded(
              flex: 1,
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
                    child: Container(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 41, bottom: 19),
                        child: Row(
                          children: [
                            Image.asset(
                                'assets/images/white_physical_fitness_icon.png'),
                            const SizedBox(
                              width: 8,
                            ),
                            const Text('Physical Fitness',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16))
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
                flex: 5,
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(30.0))),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 35),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          child: const Text(
                            'Select\nWorkout',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: AppColor.textColor),
                          ),
                        ),
                        const SizedBox(height: 32),
                        Expanded(
                            child: ListView.builder(
                                itemCount: taskList.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => BlocProvider(
                                                  create: (context) =>
                                                      TimerBloc(),
                                                  child: TimerScreen(
                                                      time: taskTime[index]),
                                                ))),
                                    child: Container(
                                      margin:
                                          const EdgeInsets.only(bottom: 30.0),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                          color: Colors.white,
                                          border: Border.all(
                                              color: const Color(0xffEAEDFD)),
                                          boxShadow: const [
                                            BoxShadow(
                                                blurRadius: 15,
                                                color: Color.fromARGB(
                                                    15, 18, 6, 33),
                                                offset: Offset(2, 2))
                                          ]),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 18.0,
                                          horizontal: 36,
                                        ),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    taskList[index],
                                                    style: const TextStyle(
                                                        fontSize: 20.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: AppColor
                                                            .primaryColor),
                                                  ),
                                                  const SizedBox(height: 6),
                                                  Text(
                                                    taskdescriptionList[index],
                                                    style: const TextStyle(
                                                        fontSize: 10.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color:
                                                            Color(0xffCCCCCC)),
                                                  ),
                                                  const SizedBox(
                                                    height: 17.0,
                                                  ),
                                                  Container(
                                                    width: 98.0,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                      border: Border.all(
                                                          color: const Color(
                                                              0xffC7C7C8)),
                                                    ),
                                                    padding:
                                                        const EdgeInsets.all(8),
                                                    child: Row(
                                                      children: [
                                                        const Icon(
                                                            Icons.play_arrow,
                                                            color: AppColor
                                                                .textColor),
                                                        Text(
                                                            '${taskTime[index]} mins')
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Image(
                                                image: AssetImage(
                                                    'assets/images/health_task${index + 1}.png'))
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                })),
                        const SizedBox(
                          height: 20.0,
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 51,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                elevation: 2.0,
                                backgroundColor: Colors.white,
                                foregroundColor: const Color(0xFF5846A3),
                                textStyle: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w500),
                                shape: const RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: AppColor.primaryColor),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(15.0)))),
                            child: const Text('Add new activity'),
                          ),
                        ),
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
