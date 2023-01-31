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
    on<getImageFromCamera>(_mapGetImageFromCamera);
    on<getImageFromGallery>(_mapGetImageFromGallery);
  }
  Future _mapFetchData(FetchData event, Emitter<ProfileState> emit) async {
    emit(FetchingDataState());
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var name = prefs.getString('name');
    var email = prefs.getString('email');
    var phoneNumber = prefs.getString('phoneNumber');
    emit(SucessState(
        name: name.toString(),
        email: email.toString(),
        phonenumber: phoneNumber.toString()));
  }

  Future _mapGetImageFromCamera(
      getImageFromCamera event, Emitter<ProfileState> emit) async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) return;
      final imageTemp = File(image.path);
      // setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future _mapGetImageFromGallery(
      getImageFromGallery event, Emitter<ProfileState> emit) async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      // setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }
}
