part of 'add_new_task_bloc.dart';

abstract class AddNewTaskEvent {}

class ChangeDropDownEvent extends AddNewTaskEvent {}

class GetImageEvent extends AddNewTaskEvent {
  ImageSource imageType;
  GetImageEvent({required this.imageType});
}
