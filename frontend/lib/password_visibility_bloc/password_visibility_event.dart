part of 'password_visibility_bloc.dart';

abstract class PasswordVisibilityEvent {}

class ChangePasswordVisibilityEvent extends PasswordVisibilityEvent {
  bool isVisible;
  ChangePasswordVisibilityEvent({required this.isVisible});
}
