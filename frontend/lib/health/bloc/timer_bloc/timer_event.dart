part of 'timer_bloc.dart';

abstract class TimerEvent {}

class TimerInitializeEvent extends TimerEvent {
  int startTimer;
  TimerInitializeEvent({required this.startTimer});
}

class TimerCancelEvent extends TimerEvent {
  Timer timer;
  TimerCancelEvent({required this.timer});
}

class TimerResetEvent extends TimerEvent {
  TimerResetEvent();
}
