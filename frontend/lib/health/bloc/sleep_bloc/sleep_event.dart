part of 'sleep_bloc.dart';

abstract class SleepEvent {}
class SelectdateEvent extends SleepEvent {
  int index;
  SelectdateEvent({required this.index});
}
