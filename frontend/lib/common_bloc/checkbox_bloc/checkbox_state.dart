part of 'checkbox_bloc.dart';

abstract class CheckboxState {}

class CheckboxInitial extends CheckboxState {}

class CheckboxClickState extends CheckboxState {
  final List<bool> taskCheckList;
  CheckboxClickState({required this.taskCheckList});
}
