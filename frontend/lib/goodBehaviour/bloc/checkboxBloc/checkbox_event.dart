part of 'checkbox_bloc.dart';

abstract class CheckboxEvent {}

class CheckboxClickEvent extends CheckboxEvent {
  final bool isActive;
  CheckboxClickEvent( {required this.isActive});
}
