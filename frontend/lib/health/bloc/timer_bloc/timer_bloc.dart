import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'timer_event.dart';
part 'timer_state.dart';

class TimerBloc extends Bloc<TimerEvent, TimerState> {
  TimerBloc() : super(TimerInitial()) {
    on<TimerInitializeEvent>(_mapTimerInitializeEvent);
    on<TimerCancelEvent>(_mapTimerCancelEvent);
    on<TimerResetEvent>(_mapTimerResetEvent);
    on<TimerEvent>((event, emit) {});
  }

  Future _mapTimerInitializeEvent(
      TimerInitializeEvent event, Emitter<TimerState> emit) async {
    try {
      emit(TimerInitial());

      int hours = event.startTimer ~/ 3600;
      int minutes = event.startTimer ~/ 60 - hours * 60;
      int seconds = event.startTimer % 60;

      var minutesStr =
          "${hours.toString().padLeft(2, "0")}:${minutes.toString().padLeft(2, "0")}:${seconds.toString().padLeft(2, "0")}";
      emit(TimerInitializeState(minuteStr: minutesStr));
    } catch (e) {
      emit(TimerErrorState(message: "Something went wrong $e"));
    }
  }

  Future _mapTimerCancelEvent(
      TimerCancelEvent event, Emitter<TimerState> emit) async {
    try {
      emit(TimerInitial());

      emit(TimerCancelState(timer: event.timer));
    } catch (e) {
      emit(TimerErrorState(message: "Something went wrong $e"));
    }
  }

  Future _mapTimerResetEvent(
      TimerResetEvent event, Emitter<TimerState> emit) async {
    emit(TimerInitial());
  }
}
