import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:value_app/health/bloc/steps_bloc/steps_bloc.dart';

import 'package:value_app/res/color.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../models/steps_chart_model.dart';

class StepsScreen extends StatefulWidget {
  const StepsScreen({super.key});

  @override
  State<StepsScreen> createState() => _StepsScreenState();
}

class _StepsScreenState extends State<StepsScreen> {
  List<Map> stepsRecord = [
    {
      'date': '6 Feb',
      'day': 'Mon',
      'totalSteps': 2541,
      'todaySteps': [
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        500,
        100,
        400,
        200,
        500,
        100,
        400,
        200,
        300,
        160,
        788,
        200,
        0,
        0,
        0,
        0
      ]
    },
    {
      'date': '7 Feb',
      'day': 'Tue',
      'totalSteps': 2542,
      'todaySteps': [
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        50,
        100,
        400,
        20,
        50,
        100,
        400,
        20,
        80,
        96,
        788,
        20,
        0,
        0,
        0,
        0
      ]
    },
    {
      'date': '8 Feb',
      'day': 'Wed',
      'totalSteps': 2543,
      'todaySteps': [
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        50,
        100,
        400,
        20,
        50,
        100,
        400,
        20,
        80,
        96,
        788,
        20,
        0,
        0,
        0,
        0
      ]
    },
    {
      'date': '9 Feb',
      'day': 'Thu',
      'totalSteps': 2544,
      'todaySteps': [
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        50,
        100,
        400,
        20,
        50,
        100,
        400,
        20,
        80,
        96,
        788,
        20,
        0,
        0,
        0,
        0
      ]
    },
    {
      'date': '10 Feb',
      'day': 'Fri',
      'totalSteps': 2545,
      'todaySteps': [
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        50,
        100,
        400,
        20,
        50,
        100,
        400,
        20,
        80,
        96,
        788,
        20,
        0,
        0,
        0,
        0
      ]
    },
    {
      'date': '11 Feb',
      'day': 'Sat',
      'totalSteps': 2546,
      'todaySteps': [
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        50,
        100,
        400,
        20,
        50,
        100,
        400,
        20,
        80,
        96,
        788,
        20,
        0,
        0,
        0,
        0
      ]
    },
    {
      'date': '12 Feb',
      'day': 'Sun',
      'totalSteps': 2547,
      'todaySteps': [
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        50,
        100,
        400,
        20,
        50,
        100,
        400,
        20,
        80,
        96,
        788,
        20,
        0,
        0,
        0,
        0
      ]
    },
  ];

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
            // back button
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
            // Steps title
            Expanded(
              child: Container(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 41, bottom: 19),
                  child: Row(
                    children: [
                      Image.asset('assets/images/white_steps_icon.png'),
                      const SizedBox(
                        width: 8,
                      ),
                      const Text('Steps',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 16))
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
                flex: 7,
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(30.0))),
                  child: BlocConsumer<StepsBloc, StepsState>(
                    listener: (_, state) {},
                    builder: (context, state) {
                      var selectedIndex =
                          state is SelectDateState ? state.index : 0;
                      TooltipBehavior _tooltip = TooltipBehavior(enable: true);

                      List<StepsDataModel>? data = [StepsDataModel('', 0)];
                      for (int i = 0; i < 24; i++) {
                        String time;
                        if (i == 0) {
                          time = '12am';
                        } else if (i > 0 && i < 13) {
                          time = '$i am';
                        } else {
                          time = '${i - 12} pm';
                        }
                        data.add(StepsDataModel(
                            time, stepsRecord[selectedIndex]['todaySteps'][i]));
                      }
                      data.add(StepsDataModel('', 0));
                      return Column(
                        children: [
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.only(
                                  left: 27, top: 12, bottom: 16),
                              decoration: BoxDecoration(
                                boxShadow: const [
                                  BoxShadow(
                                      offset: Offset(0, 4),
                                      color: Color(0xffEDEDED),
                                      blurRadius: 4.0),
                                ],
                                color: Colors.white,
                                border: Border.all(
                                  color: const Color(0xffEDEDED),
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(30.0),
                                  bottomLeft: Radius.circular(30.0),
                                  // bottomRight: Radius.circular(10)
                                ),
                              ),
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: stepsRecord.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding:
                                          const EdgeInsets.only(right: 20.0),
                                      child: GestureDetector(
                                        onTap: () {
                                          context.read<StepsBloc>().add(
                                              SelectdateEvent(index: index));
                                        },
                                        child: Container(
                                          width: 61.0,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              color: selectedIndex == index
                                                  ? AppColor.primaryColor
                                                  : Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              border: Border.all(
                                                color: const Color(0xffEDEDED),
                                              ),
                                              boxShadow: const [
                                                BoxShadow(
                                                    color: Color(0xffEDEDED),
                                                    offset: Offset(0, 2),
                                                    blurRadius: 15.0),
                                              ]),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                stepsRecord[index]['date'],
                                                style: TextStyle(
                                                    color: selectedIndex ==
                                                            index
                                                        ? Colors.white
                                                        : AppColor.primaryColor,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 12),
                                              ),
                                              Text(stepsRecord[index]['day'],
                                                  style: TextStyle(
                                                      color:
                                                          selectedIndex == index
                                                              ? Colors.white
                                                              : AppColor
                                                                  .primaryColor,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 12))
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                          ),
                          Expanded(
                              flex: 8,
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 26.0,
                                  ),
                                  // Date Container
                                  Container(
                                    padding: const EdgeInsets.only(left: 30),
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      stepsRecord[selectedIndex]['date'] +
                                          ' 2023',
                                      style: const TextStyle(
                                          color: AppColor.textColor,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  // Total Steps Container
                                  Container(
                                    padding: const EdgeInsets.only(left: 30),
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      '${stepsRecord[selectedIndex]['totalSteps']} steps',
                                      style: const TextStyle(
                                          color: Color(0xffCCCCCC),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                  // Steps graph
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 51),
                                    child: SizedBox(
                                      height: 180,
                                      child: SfCartesianChart(
                                        plotAreaBorderWidth: 1.0,
                                        plotAreaBorderColor:
                                            const Color(0xffC5BAF1),
                                        primaryXAxis: CategoryAxis(
                                            tickPosition: TickPosition.inside,
                                            labelStyle: const TextStyle(
                                                color: Color(0xffC5BAF1),
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400),
                                            maximumLabels: 3,
                                            borderColor:
                                                const Color(0xffC5BAF1)),
                                        primaryYAxis: NumericAxis(
                                            isVisible: false, interval: 200),
                                        tooltipBehavior: _tooltip,
                                        series: <
                                            ChartSeries<StepsDataModel,
                                                String>>[
                                          ColumnSeries<StepsDataModel, String>(
                                              dataSource: data,
                                              xValueMapper:
                                                  (StepsDataModel data, _) =>
                                                      data.time,
                                              yValueMapper:
                                                  (StepsDataModel data, _) =>
                                                      data.count,
                                              name: 'Child',
                                              color: const Color(0xffC5BAF1))
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(left: 30),
                                    alignment: Alignment.centerLeft,
                                    child: const Text(
                                      'Child\'s Schedule',
                                      style: TextStyle(
                                          color: AppColor.textColor,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                  const SizedBox(height: 20.0),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 21.0),
                                    child: Container(
                                      padding: const EdgeInsets.all(18.0),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          boxShadow: const [
                                            BoxShadow(
                                                blurRadius: 5.0,
                                                color: Color(0xffC5BAF1),
                                                offset: Offset(0, 2))
                                          ]),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'So far this month, you’re averaging fewer steps than last month.',
                                            style: TextStyle(
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.w400,
                                                color: Color(0xffCCCCCC)),
                                          ),
                                          const SizedBox(
                                            height: 17,
                                          ),
                                          const Text('3141 steps/day',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                  color: AppColor.textColor)),
                                          const SizedBox(height: 9),
                                          Container(
                                            width: 180,
                                            padding: const EdgeInsets.all(8.0),
                                            decoration: BoxDecoration(
                                                color: const Color(0xffC5BAF1),
                                                borderRadius:
                                                    BorderRadius.circular(5.0)),
                                            child: const Text(
                                              'Febuary',
                                            ),
                                          ),
                                          const SizedBox(height: 28),
                                          const Text('4835 steps/day',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                  color: AppColor.textColor)),
                                          const SizedBox(height: 9),
                                          Container(
                                              width: 150,
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              decoration: BoxDecoration(
                                                  color:
                                                      const Color(0xffC5BAF1),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5.0)),
                                              child: const Text('January')),
                                          const SizedBox(
                                            height: 20,
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ))
                        ],
                      );
                    },
                  ),
                )),
          ],
        )),
      ),
    );
  }
}
