part of 'authentication_bloc.dart';

abstract class AuthenticationState {}

class AuthenticationInitial extends AuthenticationState {}

class SuccessState extends AuthenticationState {
  SuccessState();
}

class ErrorState extends AuthenticationState {
  final String message;

  ErrorState({required this.message});
}

class LoadingState extends AuthenticationState {
  LoadingState();
}
