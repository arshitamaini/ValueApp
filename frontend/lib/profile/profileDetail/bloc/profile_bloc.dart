import 'dart:developer';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/services.dart';
part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    on<FetchData>(_mapFetchData);
  }

  Future _mapFetchData(FetchData event, Emitter<ProfileState> emit) async {
    emit(ProfileInitial());
    log("Hello");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var name = prefs.getString('name');
    var email = prefs.getString('email');
    var phoneNumber = prefs.getString('phoneNumber');
    emit(SucessState(
        name: name.toString(),
        email: email.toString(),
        phonenumber: phoneNumber.toString()));
  }
}
