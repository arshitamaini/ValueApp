import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:value_app/res/color.dart';

import '../bloc/sleep_bloc/sleep_bloc.dart';
import '../models/sleep_chart_data_model.dart';

class SleepScreen extends StatefulWidget {
  const SleepScreen({super.key});

  @override
  State<SleepScreen> createState() => _SleepScreenState();
}

class _SleepScreenState extends State<SleepScreen> {
  List<Map> sleepRecord = [
    {
      'date': '6 Feb',
      'day': 'Mon',
      'totalSleepTime': '8hr 14min',
      'sleepHours': [
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        1,
        1
      ]
    },
    {
      'date': '7 Feb',
      'day': 'Tue',
      'totalSleepTime': '9hr 14min',
      'sleepHours': [
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        1,
        1
      ]
    },
    {
      'date': '8 Feb',
      'day': 'Wed',
      'totalSleepTime': '10hr 14min',
      'sleepHours': [
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        1,
        1
      ]
    },
    {
      'date': '9 Feb',
      'day': 'Thu',
      'totalSleepTime': '7hr 14min',
      'sleepHours': [
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        1,
        1
      ]
    },
    {
      'date': '10 Feb',
      'day': 'Fri',
      'totalSleepTime': '8hr 0min',
      'sleepHours': [
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        1,
        1
      ]
    },
    {
      'date': '11 Feb',
      'day': 'Sat',
      'totalSleepTime': '8hr 30min',
      'sleepHours': [
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        1,
        1
      ]
    },
    {
      'date': '12 Feb',
      'day': 'Sun',
      'totalSleepTime': '8hr 14min',
      'sleepHours': [
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        1,
        1
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
                child: Column(children: [
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
                        Image.asset('assets/images/white_sleep_icon.png'),
                        const SizedBox(
                          width: 8,
                        ),
                        const Text('Sleep',
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
                  flex: 8,
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(30.0))),
                    child: BlocConsumer<SleepBloc, SleepState>(
                        listener: (_, state) {},
                        builder: (context, state) {
                          var selectedIndex =
                              state is SelectDateState ? state.index : 0;
                          TooltipBehavior _tooltip =
                              TooltipBehavior(enable: true);

                          List<SleepDataModel>? data = [SleepDataModel('0', 0)];
                          for (int i = 0; i < 24; i++) {
                            String time;
                            if (i == 0) {
                              time = '12am';
                            } else if (i > 0 && i < 13) {
                              time = '$i am';
                            } else {
                              time = '${i - 12} pm';
                            }
                            data.add(SleepDataModel(time,
                                sleepRecord[selectedIndex]['sleepHours'][i]));
                          }
                          data.add(SleepDataModel('', 0));
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
                                    itemCount: sleepRecord.length,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding:
                                            const EdgeInsets.only(right: 20.0),
                                        child: GestureDetector(
                                          onTap: () {
                                            context.read<SleepBloc>().add(
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
                                                  color:
                                                      const Color(0xffEDEDED),
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
                                                  sleepRecord[index]['date'],
                                                  style: TextStyle(
                                                      color:
                                                          selectedIndex == index
                                                              ? Colors.white
                                                              : AppColor
                                                                  .primaryColor,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 12),
                                                ),
                                                Text(sleepRecord[index]['day'],
                                                    style: TextStyle(
                                                        color: selectedIndex ==
                                                                index
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
                              )),
                              Expanded(
                                  flex: 8,
                                  child: Column(
                                    children: [
                                      const SizedBox(
                                        height: 26.0,
                                      ),
                                      // Date Container
                                      Container(
                                        padding:
                                            const EdgeInsets.only(left: 30),
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          sleepRecord[selectedIndex]['date'] +
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
                                      // Total Sleep Container
                                      Container(
                                        padding:
                                            const EdgeInsets.only(left: 30),
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          '${sleepRecord[selectedIndex]['totalSleepTime']}',
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
                                                tickPosition:
                                                    TickPosition.inside,
                                                labelStyle: const TextStyle(
                                                    color: Color(0xffC5BAF1),
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w400),
                                                maximumLabels: 3,
                                                borderColor:
                                                    const Color(0xffC5BAF1)),
                                            primaryYAxis: NumericAxis(
                                                // isVisible: false,
                                                interval: 2),
                                            tooltipBehavior: _tooltip,
                                            series: <
                                                ChartSeries<SleepDataModel,
                                                    String>>[
                                              ColumnSeries<SleepDataModel,
                                                      String>(
                                                  dataSource: data,
                                                  xValueMapper:
                                                      (SleepDataModel data,
                                                              _) =>
                                                          data.time,
                                                  yValueMapper:
                                                      (SleepDataModel data,
                                                              _) =>
                                                          data.count,
                                                  name: 'Child',
                                                  color:
                                                      const Color(0xffC5BAF1))
                                            ],
                                          ),
                                        ),
                                      ),
                                      Container(
                                        padding:
                                            const EdgeInsets.only(left: 30),
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
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color:
                                                          AppColor.textColor)),
                                              const SizedBox(height: 9),
                                              Container(
                                                width: 180,
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                decoration: BoxDecoration(
                                                    color:
                                                        const Color(0xffC5BAF1),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.0)),
                                                child: const Text(
                                                  'Febuary',
                                                ),
                                              ),
                                              const SizedBox(height: 28),
                                              const Text('4835 steps/day',
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color:
                                                          AppColor.textColor)),
                                              const SizedBox(height: 9),
                                              Container(
                                                  width: 150,
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  decoration: BoxDecoration(
                                                      color: const Color(
                                                          0xffC5BAF1),
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
                        }),
                  ))
            ]))));
  }
}
