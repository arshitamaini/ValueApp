part of 'authentication_bloc.dart';

abstract class AuthenticationEvent {}

class LoginWithPhoneNumberAndPasswordEvent extends AuthenticationEvent {
  final String phoneNumber;
  final String password;

  LoginWithPhoneNumberAndPasswordEvent({
    required this.phoneNumber,
    required this.password,
  });
}

class CreateAccountEvent extends AuthenticationEvent {
  final String name;
  final String phoneNumber;
  final String email;
  final String password;
  final String userCategory;

  CreateAccountEvent({
    required this.email,
    required this.password,
    required this.name,
    required this.phoneNumber,
    required this.userCategory,
  });
}
