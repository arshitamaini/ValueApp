part of 'sleep_bloc.dart';

abstract class SleepState {}

class SleepInitial extends SleepState {}

class SelectDateState extends SleepState {
  int index;
  SelectDateState({required this.index});
}
