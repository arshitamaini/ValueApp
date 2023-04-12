part of 'change_password_bloc.dart';

abstract class ChangePasswordState {}

class ChangePasswordInitial extends ChangePasswordState {}

class LoadingPasswordState extends ChangePasswordState {
  LoadingPasswordState();
}

class ErrorPasswordState extends ChangePasswordState {
  String message;
  ErrorPasswordState({required this.message});
}

class SuccessPassowrdState extends ChangePasswordState {
  SuccessPassowrdState();
}
