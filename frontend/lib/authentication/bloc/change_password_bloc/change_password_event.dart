part of 'change_password_bloc.dart';

abstract class ChangePasswordEvent {}

class PasswordChangeEvent extends ChangePasswordEvent {
  String emailPhoneNumber;
  String newPassword;
  PasswordChangeEvent({required this.emailPhoneNumber, required this.newPassword});
}
