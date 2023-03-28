part of 'checkbox_bloc.dart';

abstract class CheckboxEvent {}

class CheckboxClickEvent extends CheckboxEvent {
  final bool isActive;
  final int index;
  CheckboxClickEvent({required this.isActive, required this.index});
}
