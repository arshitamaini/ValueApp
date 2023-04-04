import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:value_app/health/bloc/timer_bloc/timer_bloc.dart';
import 'package:value_app/res/color.dart';

class TimerScreen extends StatefulWidget {
  const TimerScreen({super.key, required this.time});
  final int time;

  @override
  State<TimerScreen> createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  Timer? timer;
  int start = 5;
  String minutesStr = "";
  int? timeLeft;
  var oneSec = const Duration(seconds: 1);

  void startTimer() {
    timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (start == 0) {
          if (mounted) {
            context.read<TimerBloc>().add(TimerCancelEvent(timer: timer));
          }
        } else {
          if (mounted) {
            start--;
            
            context
                .read<TimerBloc>()
                .add(TimerInitializeEvent(startTimer: start));
          }
        }
      },
    );
  }

  @override
  void initState() {
    start = widget.time * 60;
    int hours = start ~/ 3600;
    int minutes = start ~/ 60 - hours * 60;
    int seconds = start % 60;
    minutesStr =
        "${hours.toString().padLeft(2, "0")}:${minutes.toString().padLeft(2, "0")}:${seconds.toString().padLeft(2, "0")}";

    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

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
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        children: [
                          Image.asset('assets/images/timer_icon.png'),
                          const SizedBox(
                            height: 8,
                          ),
                          const Text('Timer',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16))
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 26.0),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(30.0))),
                alignment: Alignment.center,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 51, horizontal: 27.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        offset: Offset(0, 2),
                        blurRadius: 25,
                        color: Color(0xffEDEDED),
                      )
                    ],
                    border: Border.all(
                      color: const Color(0xffEDEDED),
                    ),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: BlocConsumer<TimerBloc, TimerState>(
                    listener: (context, state) {
                      if (state is TimerCancelState) {
                        state.timer.cancel();
                      }
                      if (state is TimerErrorState) {
                        log(state.message);
                      }
                    },
                    builder: (context, state) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                              state is TimerInitializeState
                                  ? state.minuteStr
                                  : minutesStr,
                              style: const TextStyle(
                                  color: AppColor.textColor,
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.w500)),
                          const SizedBox(height: 66.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton(
                                  onPressed: () {
                                    context
                                        .read<TimerBloc>()
                                        .add(TimerResetEvent());
                                    timer!.cancel();
                                    start = widget.time * 60;
                                  },
                                  style: ElevatedButton.styleFrom(
                                      elevation: 2.0,
                                      backgroundColor: Colors.white,
                                      foregroundColor: const Color(0xffC7C7C8),
                                      textStyle: const TextStyle(
                                          color: Color(0xffC7C7C8),
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500),
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10.0)))),
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text('Reset'),
                                  )),
                              ElevatedButton(
                                  onPressed: () {
                                    if (state is TimerInitializeState) {
                                    } else {
                                      startTimer();
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                      elevation: 2.0,
                                      foregroundColor: Colors.white,
                                      backgroundColor: const Color(0xFF5846A3),
                                      textStyle: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500),
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10.0)))),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(state is TimerInitializeState
                                        ? 'Pause'
                                        : 'Start'),
                                  ))
                            ],
                          )
                        ],
                      );
                    },
                  ),
                ),
              ),
            )
          ],
        )),
      ),
    );
  }
}
