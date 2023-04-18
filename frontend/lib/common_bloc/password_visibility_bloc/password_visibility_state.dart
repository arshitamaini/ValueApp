part of 'password_visibility_bloc.dart';

abstract class PasswordVisibilityState {}

class PasswordVisibilityInitial extends PasswordVisibilityState {}

class ChangePasswordVisibilityState extends PasswordVisibilityState {
  bool isVisible;
  ChangePasswordVisibilityState({required this.isVisible});
}
