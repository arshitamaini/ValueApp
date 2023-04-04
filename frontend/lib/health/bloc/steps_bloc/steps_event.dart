part of 'steps_bloc.dart';

abstract class StepsEvent {}

class SelectdateEvent extends StepsEvent {
  int index;
  SelectdateEvent({required this.index});
}
