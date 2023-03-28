part of 'checkbox_bloc.dart';

abstract class CheckboxState {}

class CheckboxInitial extends CheckboxState {}

class CheckboxClickState extends CheckboxState {
  final bool isActive;
  CheckboxClickState({required this.isActive});
}
