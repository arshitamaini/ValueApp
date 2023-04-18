import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:value_app/nitnem/models/nitnem_model.dart';
part 'fetch_nitnem_task__state.dart';
part 'fetch_nitnem_task_event.dart';

class FetchNitnemTaskBloc
    extends Bloc<FecthNitenamTaskEvent, FetchNitnemTaskState> {
  FetchNitnemTaskBloc() : super(NitnemInitial()) {
    on<FetchTask>(_mapFetchNitnemTask);
  }

  Future _mapFetchNitnemTask(
      FetchTask event, Emitter<FetchNitnemTaskState> emit) async {
    emit(LoadingState());
    try {
      var url = Uri.parse("http://10.0.2.2:8080/valueApp/fetch_nitnem_task");
      var res = await http.post(url);

      final jsonResponse = jsonDecode(res.body);
      NitnemTaskModel nitnemModel = NitnemTaskModel.fromJson(jsonResponse);

      if (nitnemModel.success!) {
        emit(SuccessState(nitnemModel: nitnemModel));
      } else {
        emit(ErrorState(message: nitnemModel.message!));
      }
    } catch (e) {
      emit(ErrorState(message: 'Something went wrong'));
    }
  }
}
