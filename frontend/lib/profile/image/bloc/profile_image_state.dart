part of 'profile_image_bloc.dart';

abstract class ProfileImageState {}

class ProfileImageInitial extends ProfileImageState {}

class FetchingDataState extends ProfileImageState {
  FetchingDataState();
}

class GetImageState extends ProfileImageState {
  final String imagePath;

  GetImageState({required this.imagePath});
}

class ErrorImageState extends ProfileImageState {
  final String message;
  ErrorImageState({required this.message});
}
