part of 'authentication_bloc.dart';

abstract class AuthenticationState {}

class AuthenticationInitial extends AuthenticationState {}

class SuccessState extends AuthenticationState {
  final userName;
  final userEmail;
  final userPhoneNumber;
  SuccessState(
      {required this.userEmail,
      required this.userName,
      required this.userPhoneNumber});
}

class ErrorState extends AuthenticationState {
  final String message;

  ErrorState({required this.message});
}

class LoadingState extends AuthenticationState {
  LoadingState();
}
