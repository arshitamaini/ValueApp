import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:value_app/happiness/models/happiness_task_model.dart';
import 'package:http/http.dart' as http;
part 'fetch_happiness_task_event.dart';
part 'fetch_happiness_task_state.dart';

class FetchHappinessTaskBloc
    extends Bloc<FetchHappinessTaskEvent, FetchHappinessTaskState> {
  FetchHappinessTaskBloc() : super(FetchHappinessTaskInitial()) {
    on<FetchTaskEvent>(_mapFetchTaskEvent);
  }
  Future _mapFetchTaskEvent(
      FetchTaskEvent event, Emitter<FetchHappinessTaskState> emit) async {
    emit(LoadingState());

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userId = prefs.getString('userId').toString();

    try {
      var url = Uri.parse("http://10.0.2.2:8080/valueApp/fetchHappinessTask");

      var res = await http.post(url, headers: <String, String>{
        'Context-Type': 'application/json;charSet=UTF-8'
      }, body: <String, String>{
        'userId': userId
      });

      final jsonResponse = jsonDecode(res.body);
      
      HappinessTaskModel happinessTaskModel =
          HappinessTaskModel.fromJson(jsonResponse);

      if (happinessTaskModel.success!) {
        emit(SuccessState(happinessTaskModel: happinessTaskModel));
      } else {
        emit(ErrorState(message: happinessTaskModel.message!));
      }
    } catch (e) {
      emit(ErrorState(message: 'Something went wrong, please try again later'));
    }
  }
}
