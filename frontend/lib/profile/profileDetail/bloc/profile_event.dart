part of 'profile_bloc.dart';

abstract class ProfileEvent {}

class FetchData extends ProfileEvent {
  FetchData();
}

class GetImageFromGallery extends ProfileEvent {
  GetImageFromGallery();
}