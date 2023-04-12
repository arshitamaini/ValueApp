part of 'fetch_good_behaviour_task_bloc.dart';


abstract class FetchGoodBehaviourTaskState {}

class FetchTaskInitial extends FetchGoodBehaviourTaskState {}

class SuccessState extends FetchGoodBehaviourTaskState {
  GoodBehaviourTaskModel happinessTaskModel;
  SuccessState({required this.happinessTaskModel});
}

class LoadingState extends FetchGoodBehaviourTaskState {
  LoadingState();
}

class ErrorState extends FetchGoodBehaviourTaskState {
  String message;
  ErrorState({required this.message});
}
