part of 'authentication_bloc.dart';

abstract class AuthenticationEvent {}

class APITestEvent extends AuthenticationEvent {
  APITestEvent();
}

class LoginWithPhoneNumberAndPasswordEvent extends AuthenticationEvent {
  final String emailPhoneNumber;
  final String password;

  LoginWithPhoneNumberAndPasswordEvent({
    required this.emailPhoneNumber,
    required this.password,
  });
}

class CreateAccountEvent extends AuthenticationEvent {
  final String lastName;
  final String firstName;
  final String emailPhoneNumber;
  final String password;

  CreateAccountEvent({
    required this.password,
    required this.firstName,
    required this.lastName,
    required this.emailPhoneNumber,
  });
}

class ChangePasswordEvent extends AuthenticationEvent {
  final String emailPhoneNumber;
  final String newPassword;
  ChangePasswordEvent(
      {required this.emailPhoneNumber, required this.newPassword});
}
