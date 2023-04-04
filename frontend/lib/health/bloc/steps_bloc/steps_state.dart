part of 'steps_bloc.dart';

abstract class StepsState {}

class StepsInitial extends StepsState {}

class SelectDateState extends StepsState {
  int index;
  SelectDateState({required this.index});
}
