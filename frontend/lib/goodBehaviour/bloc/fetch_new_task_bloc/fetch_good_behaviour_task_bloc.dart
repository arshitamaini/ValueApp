import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../models/fetch_task_model.dart';

part 'fetch_good_behaviour_task_event.dart';
part 'fetch_good_behaviour_task_state.dart';

class FetchGoodBehaviourTaskBloc
    extends Bloc<FetchGoodBehaviourTaskEvent, FetchGoodBehaviourTaskState> {
  FetchGoodBehaviourTaskBloc() : super(FetchTaskInitial()) {
    on<FetchTaskEvent>(_mapFetchTaskEvent);
  }

  Future _mapFetchTaskEvent(
      FetchTaskEvent event, Emitter<FetchGoodBehaviourTaskState> emit) async {
    emit(LoadingState());

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userId = prefs.getString('userId').toString();

    try {
      var url =
          Uri.parse("http://10.0.2.2:8080/valueApp/fetchGoodBehaviourTask");

      var res = await http.post(url, headers: <String, String>{
        'Context-Type': 'application/json;charSet=UTF-8'
      }, body: <String, String>{
        'userId': userId
      });

      final jsonResponse = jsonDecode(res.body);

      GoodBehaviourTaskModel goodBehaviourTaskModel =
          GoodBehaviourTaskModel.fromJson(jsonResponse);

      if (goodBehaviourTaskModel.success!) {
        emit(SuccessState(happinessTaskModel: goodBehaviourTaskModel));
      } else {
        emit(ErrorState(message: goodBehaviourTaskModel.message!));
      }
    } catch (e) {
      emit(ErrorState(message: 'Something went wrong, please try again later'));
    }
  }
}
