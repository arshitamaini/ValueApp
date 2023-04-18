import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:value_app/authentication/forget_password/models/change_password_model.dart';
part 'change_password_event.dart';
part 'change_password_state.dart';

class ChangePasswordBloc
    extends Bloc<ChangePasswordEvent, ChangePasswordState> {
  ChangePasswordBloc() : super(ChangePasswordInitial()) {
    on<PasswordChangeEvent>(_mapPasswordChangeEvent);
  }
  Future _mapPasswordChangeEvent(
      PasswordChangeEvent event, Emitter<ChangePasswordState> emit) async {
    try {
      emit(LoadingPasswordState());

      var url = Uri.parse("http://10.0.2.2:8080/valueApp/change_password");
      var res = await http.post(url, headers: <String, String>{
        'Context-Type': 'application/json;charSet=UTF-8'
      }, body: <String, String>{
        'emailPhoneNumber': event.emailPhoneNumber,
        'newPassword': event.newPassword
      });

      final jsonResponse = jsonDecode(res.body);
      ChangePasswordModel changePasswordModel =
          ChangePasswordModel.fromJson(jsonResponse);

      if (changePasswordModel.success!) {
        emit(SuccessPassowrdState());
      } else {
        emit(ErrorPasswordState(message: changePasswordModel.message!));
      }
    } catch (e) {
      emit(ErrorPasswordState(message: e.toString()));
    }
  }
}
