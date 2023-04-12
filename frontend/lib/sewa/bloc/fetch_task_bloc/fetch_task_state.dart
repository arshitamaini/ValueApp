part of 'fetch_task_bloc.dart';

abstract class FetchSewaTaskState {}

class SewaInitial extends FetchSewaTaskState {}

class LoadingState extends FetchSewaTaskState {
  LoadingState();
}

class ErrorState extends FetchSewaTaskState {
  String message;
  ErrorState({required this.message});
}

class SuccessState extends FetchSewaTaskState {
  SewaModel sewaModel;
  SuccessState({required this.sewaModel});
}
