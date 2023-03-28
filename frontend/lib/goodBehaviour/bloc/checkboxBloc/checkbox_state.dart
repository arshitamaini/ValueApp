part of 'checkbox_bloc.dart';

abstract class CheckboxState {}

class CheckboxInitial extends CheckboxState {}

class CheckboxClickState extends CheckboxState {
   final bool isActive;
  final int index;
  CheckboxClickState({required this.isActive, required this.index});
}
