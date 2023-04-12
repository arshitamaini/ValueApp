import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../models/user_model.dart';
part 'authentication_event.dart';
part 'authentication_state.dart';

String baseUrl = 'http://10.0.2.2:8080/valueApp';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationInitial()) {
    on<LoginWithPhoneNumberAndPasswordEvent>(
        _mapLoginWithPhoneNumberAndPasswordEvent);
    on<CreateAccountEvent>(_mapCreateAccountEvent);
    
  }

  Future<void> _mapLoginWithPhoneNumberAndPasswordEvent(
    LoginWithPhoneNumberAndPasswordEvent event,
    Emitter<AuthenticationState> emit,
  ) async {
    emit(LoadingState());
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      var url = Uri.parse('$baseUrl/login');
      var res = await http.post(url, headers: <String, String>{
        'Context-Type': 'application/json;charSet=UTF-8'
      }, body: <String, String>{
        'emailPhoneNumber': event.emailPhoneNumber,
        'password': event.password
      });

      final jsonResponse = jsonDecode(res.body);
      log("$jsonResponse");
      UserModel userModel = UserModel.fromJson(jsonResponse);

      if (userModel.success!) {
        final firstName = userModel.info!.firstName;
        final lastName = userModel.info!.lastName;
        final emailPhoneNumber = userModel.info!.emailPhoneNumber;
        final userId = userModel.info!.id;

        prefs.setString('firstName', firstName.toString());
        prefs.setString('lastName', lastName.toString());
        prefs.setString('emailPhoneNumber', emailPhoneNumber.toString());
        prefs.setString('userId', userId.toString());

        emit(SuccessState(
            firstName: firstName.toString(),
            lastName: lastName.toString(),
            emailPhoneNumber: emailPhoneNumber.toString()));
      } else {
        emit(ErrorState(message: userModel.message!.toString()));
      }
    } catch (e) {
      emit(ErrorState(message: 'Please Try Again Later !!'));
    }
  }

  Future<void> _mapCreateAccountEvent(
    CreateAccountEvent event,
    Emitter<AuthenticationState> emit,
  ) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var url = Uri.parse('$baseUrl/signUp');
      var res = await http.post(url, headers: <String, String>{
        'Context-Type': 'application/json;charSet=UTF-8'
      }, body: <String, String>{
        'firstName': event.firstName,
        'lastName': event.lastName,
        'emailPhoneNumber': event.emailPhoneNumber,
        'password': event.password
      });

      final jsonResponse = jsonDecode(res.body);
      UserModel userModel = UserModel.fromJson(jsonResponse);

      if (userModel.success!) {
        final firstName = userModel.info!.firstName;
        final lastName = userModel.info!.lastName;
        final emailPhoneNumber = userModel.info!.emailPhoneNumber;

        prefs.setString('firstName', firstName.toString());
        prefs.setString('lastName', lastName.toString());
        prefs.setString('emailPhoneNumber', emailPhoneNumber.toString());

        emit(SuccessState(
            firstName: firstName.toString(),
            lastName: lastName.toString(),
            emailPhoneNumber: emailPhoneNumber.toString()));
      } else {
        emit(ErrorState(message: userModel.message!.toString()));
      }
    } catch (e) {
      log("Error=== $e");
      emit(ErrorState(message: 'Please Try Again Later'));
    }
  }

}
