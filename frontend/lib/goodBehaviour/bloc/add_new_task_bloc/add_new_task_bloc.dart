import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
part 'add_new_task_event.dart';
part 'add_new_task_state.dart';

class AddNewTaskBloc extends Bloc<AddNewTaskEvent, AddNewTaskState> {
  AddNewTaskBloc() : super(AddNewTaskInitial()) {
    on<GetImageEvent>(_mapGetImage);
  }
  Future _mapGetImage(
      GetImageEvent event, Emitter<AddNewTaskState> emit) async {
    try {
      emit(AddNewTaskInitial());
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
