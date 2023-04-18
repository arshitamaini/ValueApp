part of 'add_new_task_bloc.dart';


abstract class AddNewTaskState {}

class AddNewTaskInitial extends AddNewTaskState {}

class FetchingDataState extends AddNewTaskState {
  FetchingDataState();
}

class GetImageState extends AddNewTaskState {
  final String imagePath;

  GetImageState({required this.imagePath});
}

class ErrorImageState extends AddNewTaskState {
  final String message;
  ErrorImageState({required this.message});
}
