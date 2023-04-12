part of 'otp_bloc.dart';

abstract class OtpEvent {}

class GetOtpEvent extends OtpEvent {
  String emailPhoneNumber;
  GetOtpEvent({required this.emailPhoneNumber});
}

class VerfyOtpEvent extends OtpEvent {
  String userOtp;
  String emailPhoneNumber;
  VerfyOtpEvent({required this.userOtp, required this.emailPhoneNumber});
}
