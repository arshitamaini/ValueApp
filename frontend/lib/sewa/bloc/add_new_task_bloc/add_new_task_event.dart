part of 'add_new_task_bloc.dart';

abstract class AddNewTaskEvent {}

class AddTaskEvent extends AddNewTaskEvent {
  String taskTitle;
  String taskDescription;

  AddTaskEvent({
    required this.taskTitle,
    required this.taskDescription,
  });
}
