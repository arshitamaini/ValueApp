import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:value_app/authentication/otp/models/otp_model.dart';

part 'otp_event.dart';
part 'otp_state.dart';

String baseUrl = 'http://10.0.2.2:8080/valueApp';

class OtpBloc extends Bloc<OtpEvent, OtpState> {
  OtpBloc() : super(OtpInitial()) {
    on<GetOtpEvent>(_mapGetOtpEvent);
    on<VerfyOtpEvent>(_mapVerifyOtp);
  }
  Future _mapGetOtpEvent(GetOtpEvent event, Emitter<OtpState> emit) async {
    emit(LoadingOtpState());
    try {
      var url = Uri.parse('$baseUrl/get_otp');
      var res = await http.post(url, headers: <String, String>{
        'Context-Type': 'application/json;charSet=UTF-8'
      }, body: <String, String>{
        'emailPhoneNumber': event.emailPhoneNumber,
      });

      final jsonResponse = jsonDecode(res.body);
      log("response ==== $jsonResponse");
      if (jsonResponse['success']) {
        log("success ==== ${jsonResponse['success']}");
        OtpModel otpModel = OtpModel.fromJson(jsonResponse);
        String otp = otpModel.info!.otp.toString();
        emit(SuccessOtpState(otp: otp));
      } else {
        log("success ==== ${jsonResponse['message']}");
        emit(ErrorOtpState(message: jsonResponse['message']));
      }
    } catch (e) {
      emit(ErrorOtpState(
          message:
              'Unable to get OTP at the moment, please Try Again Later !!'));
    }
  }

  Future _mapVerifyOtp(VerfyOtpEvent event, Emitter<OtpState> emit) async {
    emit(LoadingOtpState());
    try {
      var url = Uri.parse('$baseUrl/verify_otp');
      var res = await http.post(url, headers: <String, String>{
        'Context-Type': 'application/json;charSet=UTF-8'
      }, body: <String, String>{
        'otp': event.userOtp,
        'emailPhoneNumber': event.emailPhoneNumber,
      });
      final jsonResponse = jsonDecode(res.body);

      log("$jsonResponse");

      if (jsonResponse['success']) {
        SuccessOtpVerifiedState();
      } else {
        emit(ErrorOtpState(message: jsonResponse['message']));
      }
    } catch (e) {
      emit(ErrorOtpState(
          message:
              'Unable to verify OTP at the moment, please Try Again Later !!'));
    }
  }
}
