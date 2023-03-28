import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:value_app/nitnem/models/nitnem_model.dart';
part 'nitnem_state.dart';
part 'nitnem_event.dart';

class NitnemBloc extends Bloc<NitenamEvent, NitnemState> {
  NitnemBloc() : super(NitnemInitial()) {
    on<FetchNitnemTask>(_mapFetchNitnemTask);
  }

  Future _mapFetchNitnemTask(
      FetchNitnemTask event, Emitter<NitnemState> emit) async {
    emit(LoadingState());
    try {
      var url = Uri.parse("http://10.0.2.2:8080/valueApp/fetchNitnemTask");
      var res = await http.post(url);

      final jsonResponse = jsonDecode(res.body);
      NitnemModel nitnemModel = NitnemModel.fromJson(jsonResponse);

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
