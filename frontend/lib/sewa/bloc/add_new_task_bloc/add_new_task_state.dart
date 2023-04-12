part of 'add_new_task_bloc.dart';

abstract class AddNewTaskState {}

class AddNewTaskInitial extends AddNewTaskState {}

class SuccessNewTaskState extends AddNewTaskState {
  SuccessNewTaskState();
}

class LoadingNewTaskState extends AddNewTaskState {
  LoadingNewTaskState();
}

class ErrorNewTaskState extends AddNewTaskState {
  String message;
  ErrorNewTaskState({required this.message});
}
