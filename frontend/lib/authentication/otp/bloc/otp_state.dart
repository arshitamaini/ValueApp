part of 'otp_bloc.dart';

abstract class OtpState {}

class OtpInitial extends OtpState {}

class LoadingOtpState extends OtpState {
  LoadingOtpState();
}

class ErrorOtpState extends OtpState {
  String message;
  ErrorOtpState({required this.message});
}

class SuccessOtpState extends OtpState {
  String otp;
  SuccessOtpState({required this.otp});
}

class SuccessOtpVerifiedState extends OtpState {
  SuccessOtpVerifiedState();
}
