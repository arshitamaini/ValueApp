part of 'timer_bloc.dart';

abstract class TimerState {}

class TimerInitial extends TimerState {}

class TimerInitializeState extends TimerState {
  String minuteStr;
  TimerInitializeState({required this.minuteStr});
}

class TimerCancelState extends TimerState {
  Timer timer;
  TimerCancelState({required this.timer});

}

class TimerErrorState extends TimerState {
  String message;
  TimerErrorState({required this.message});
}