import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user_model.dart';
part 'authentication_event.dart';
part 'authentication_state.dart';

String baseUrl = 'http://10.0.2.2:8080/valueApp';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationInitial()) {
    on<LoginWithPhoneNumberAndPasswordEvent>(
        _mapLoginWithPhoneNumberAndPasswordEvent);
    on<CreateAccountEvent>(_mapCreateAccountEvent);
    on<APITestEvent>(apiTest);
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
        'phoneNumber': event.phoneNumber,
        'password': event.password
      });

      final jsonResponse = jsonDecode(res.body);
      UserModel userModel = UserModel.fromJson(jsonResponse);

      if (userModel.success!) {
        final name = userModel.info!.name;
        final phoneNumber = userModel.info!.phoneNumber;
        final email = userModel.info!.email;

        prefs.setString('name', name.toString());
        prefs.setString('phoneNumber', phoneNumber.toString());
        prefs.setString('email', email.toString());

        emit(SuccessState(
            userEmail: email, userName: name, userPhoneNumber: phoneNumber));
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
        'name': event.name,
        'phoneNumber': event.phoneNumber,
        'email': event.email,
        'password': event.password
      });

      final jsonResponse = jsonDecode(res.body);
      UserModel userModel = UserModel.fromJson(jsonResponse);

      if (userModel.success!) {
        final name = userModel.info!.name;
        final phoneNumber = userModel.info!.phoneNumber;
        final email = userModel.info!.email;

        prefs.setString('name', name.toString());
        prefs.setString('phoneNumber', phoneNumber.toString());
        prefs.setString('email', email.toString());

        emit(SuccessState(
            userEmail: email, userName: name, userPhoneNumber: phoneNumber));
      } else {
        emit(ErrorState(message: userModel.message!.toString()));
      }
    } catch (e) {
      log("Error=== $e");
      emit(ErrorState(message: 'Please Try Again Later'));
    }
  }

  Future<void> apiTest(
      APITestEvent event,
      Emitter<AuthenticationState> emit,
      ) async {
    emit(LoadingState());
    try {
      var url = Uri.parse('http://10.0.2.2:8080/');
      log("URL===$baseUrl");
      var res = await http.get(url, headers: <String, String>{
        'Context-Type': 'application/json;charSet=UTF-8'
      });

      log("ResBody===${res.body}");
      final jsonResponse = jsonDecode(res.body);
      log("JsonResponse===$jsonResponse");

      emit(APITestState());

    } catch (e) {
      log("Error====$e");
      emit(ErrorState(message: 'Please Try Again Later !!'));
    }
  }
}
