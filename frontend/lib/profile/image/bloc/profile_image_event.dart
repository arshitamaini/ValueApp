part of 'profile_image_bloc.dart';

abstract class ProfileImageEvent {}

class GetImageEvent extends ProfileImageEvent {
  ImageSource imageType;
  GetImageEvent({required this.imageType});
}