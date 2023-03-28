part of 'authentication_bloc.dart';

abstract class AuthenticationState {}

class AuthenticationInitial extends AuthenticationState {}

class SuccessState extends AuthenticationState {
  final String firstName;
  final String lastName;
  final String emailPhoneNumber;
  SuccessState(
      {required this.firstName,
      required this.lastName,
      required this.emailPhoneNumber});
}

class ErrorState extends AuthenticationState {
  final String message;

  ErrorState({required this.message});
}

class LoadingState extends AuthenticationState {
  LoadingState();
}

class ChangePasswordVisibilityState extends AuthenticationState {
  ChangePasswordVisibilityState();
}
class RememberMeState extends AuthenticationState{
  RememberMeState();
}

class APITestState extends AuthenticationState {
  APITestState();
}
