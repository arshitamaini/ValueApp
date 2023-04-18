import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:value_app/sewa/models/add_new_task_model.dart';

part 'add_new_task_event.dart';
part 'add_new_task_state.dart';

class AddNewTaskBloc extends Bloc<AddNewTaskEvent, AddNewTaskState> {
  AddNewTaskBloc() : super(AddNewTaskInitial()) {
    on<AddTaskEvent>(_mapAddNewTask);
  }
  Future _mapAddNewTask(
      AddTaskEvent event, Emitter<AddNewTaskState> emit) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userId = prefs.getString('userId').toString();

    try {
      emit(LoadingNewTaskState());
      var url = Uri.parse("http://10.0.2.2:8080/valueApp/add_new_sewa_task");
      var res = await http.post(url, headers: <String, String>{
        'Context-Type': 'application/json;charSet=UTF-8'
      }, body: <String, String>{
        'taskTitle': event.taskTitle,
        'taskDescription': event.taskDescription,
        'userId': userId
      });

      final jsonResponse = jsonDecode(res.body);
      NewTaskModel newTaskModel = NewTaskModel.fromJson(jsonResponse);

      if (newTaskModel.success!) {
        emit(SuccessNewTaskState());
      } else {
        emit(ErrorNewTaskState(message: newTaskModel.message!));
      }
    } catch (e) {
      emit(ErrorNewTaskState(message: e.toString()));
    }
  }
}
