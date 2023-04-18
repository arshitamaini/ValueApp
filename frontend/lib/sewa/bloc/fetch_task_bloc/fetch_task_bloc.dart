import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../models/sewa_task_model.dart';
part 'fetch_task_event.dart';
part 'fetch_task_state.dart';

class FetchSewaTaskBloc extends Bloc<FetchSewaTaskEvent, FetchSewaTaskState> {
  FetchSewaTaskBloc() : super(SewaInitial()) {
    on<FetchTask>(_mapFetchSewaTaskEvent);
  }
  Future _mapFetchSewaTaskEvent(
      FetchTask event, Emitter<FetchSewaTaskState> emit) async {
    emit(LoadingState());

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userId = prefs.getString('userId').toString();

    try {
      var url = Uri.parse("http://10.0.2.2:8080/valueApp/fetch_sewa_task");
      var res = await http.post(url, headers: <String, String>{
        'Context-Type': 'application/json;charSet=UTF-8'
      }, body: <String, String>{
        'userId': userId
      });

      final jsonResponse = jsonDecode(res.body);
      SewaModel sewaModel = SewaModel.fromJson(jsonResponse);

      if (sewaModel.success!) {
        emit(SuccessState(sewaModel: sewaModel));
      } else {
        emit(ErrorState(message: sewaModel.message!));
      }
    } catch (e) {
      emit(ErrorState(message: 'Something went wrong, please try again later'));
    }
  }
}
