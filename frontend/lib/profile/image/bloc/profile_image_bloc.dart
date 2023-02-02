import 'dart:developer';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/services.dart';
part 'profile_image_event.dart';
part 'profile_image_state.dart';

class ProfileImageBloc extends Bloc<ProfileImageEvent, ProfileImageState> {
  ProfileImageBloc() : super(ProfileImageInitial()) {
    on<GetImageEvent>(_mapGetImage);
  }


  Future _mapGetImage(
      GetImageEvent event, Emitter<ProfileImageState> emit) async {
    try {
      emit(ProfileImageInitial());
      XFile? pickedFile = await ImagePicker().pickImage(
        source: event.imageType,
        maxWidth: 1800,
        maxHeight: 1800,
      );
      if (pickedFile != null) {
        emit(GetImageState(imagePath: pickedFile.path));
      } else {
        emit(ErrorImageState(message: "No Image Found"));
      }
    } on PlatformException catch (e) {
      log('Failed to pick image: $e');
    }
  }
}
