part of 'fetch_task_bloc.dart';

abstract class FetchPlanetCareTaskState {}

class FetchPlanetCareInitial extends FetchPlanetCareTaskState {}

class LoadingState extends FetchPlanetCareTaskState {
  LoadingState();
}

class ErrorState extends FetchPlanetCareTaskState {
  String message;
  ErrorState({required this.message});
}

class SuccessState extends FetchPlanetCareTaskState {
  PlanetCareTaskModel planetCareModel;
  SuccessState({required this.planetCareModel});
}
