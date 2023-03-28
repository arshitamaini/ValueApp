part of 'checkbox_bloc.dart';

abstract class CheckboxEvent {}

class CheckboxClickEvent extends CheckboxEvent {
  final List<bool> taskCheckList;
  final int index;
  CheckboxClickEvent({required this.taskCheckList, required this.index});
}
