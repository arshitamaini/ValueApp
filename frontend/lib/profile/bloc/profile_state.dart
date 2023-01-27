part of 'profile_bloc.dart';

abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class FetchingDataState extends ProfileState {
  FetchingDataState();
}

class SucessState extends ProfileState {
  final String name;
  final String email;
  final String phonenumber;
  SucessState(
      {required this.name, required this.email, required this.phonenumber});
}
