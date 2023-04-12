part of 'fetch_nitnem_task_bloc.dart';

abstract class FetchNitnemTaskState {}

class NitnemInitial extends FetchNitnemTaskState {}

class LoadingState extends FetchNitnemTaskState {
  LoadingState();
}

class SuccessState extends FetchNitnemTaskState {
  SuccessState({required this.nitnemModel});
  NitnemModel nitnemModel;
}

class ErrorState extends FetchNitnemTaskState {
  ErrorState({required this.message});
  String message;
}
