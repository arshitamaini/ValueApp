part of 'nitnem_bloc.dart';

abstract class NitnemState {}

class NitnemInitial extends NitnemState {}

class LoadingState extends NitnemState {
  LoadingState();
}

class SuccessState extends NitnemState {
  SuccessState({required this.nitnemModel});
  NitnemModel nitnemModel;
}

class ErrorState extends NitnemState {
  ErrorState({required this.message});
  String message;
}
