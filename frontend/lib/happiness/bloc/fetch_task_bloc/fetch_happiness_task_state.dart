part of 'fetch_happiness_task_bloc.dart';

abstract class FetchHappinessTaskState {}

class FetchHappinessTaskInitial extends FetchHappinessTaskState {}

class SuccessState extends FetchHappinessTaskState {
  HappinessTaskModel happinessTaskModel;
  SuccessState({required this.happinessTaskModel});
}

class LoadingState extends FetchHappinessTaskState {
  LoadingState();
}

class ErrorState extends FetchHappinessTaskState {
  String message;
  ErrorState({required this.message});
}
