import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:value_app/goodBehaviour/bloc/fetch_new_task_bloc/fetch_good_behaviour_task_bloc.dart';

import 'package:value_app/planetCare/models/planet_care_task_model.dart';

part 'fetch_task_event.dart';
part 'fetch_task_state.dart';

class FetchPlanetCareTaskBloc
    extends Bloc<FetchPlanetCareTaskEvent, FetchPlanetCareTaskState> {
  FetchPlanetCareTaskBloc() : super(FetchPlanetCareInitial()) {
    on<FetchTaskEvent>(_mapFetchPlanetCareTaskEvent);
  }
  Future _mapFetchPlanetCareTaskEvent(
      FetchTaskEvent event, Emitter<FetchPlanetCareTaskState> emit) async {
    emit(LoadingState());

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userId = prefs.getString('userId').toString();

    try {
      var url = Uri.parse("http://10.0.2.2:8080/valueApp/fetchPlanetCareTask");
      var res = await http.post(url, headers: <String, String>{
        'Context-Type': 'application/json;charSet=UTF-8'
      }, body: <String, String>{
        'userId': userId
      });

      final jsonResponse = jsonDecode(res.body);
      PlanetCareTaskModel planetCareModel =
          PlanetCareTaskModel.fromJson(jsonResponse);

      if (planetCareModel.success!) {
        emit(SuccessState(planetCareModel: planetCareModel));
      } else {
        emit(ErrorState(message: planetCareModel.message!));
      }
    } catch (e) {
      emit(ErrorState(message: 'Something went wrong, please try again later'));
    }
  }
}
