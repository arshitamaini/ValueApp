import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
part 'authentication_event.dart';
part 'authentication_state.dart';

String baseUrl = 'http://10.0.2.2:8080/app';

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
    } catch (e) {}
  }

  Future<void> _mapCreateAccountEvent(
    CreateAccountEvent event,
    Emitter<AuthenticationState> emit,
  ) async {
    try {} catch (e) {}
  }
}
