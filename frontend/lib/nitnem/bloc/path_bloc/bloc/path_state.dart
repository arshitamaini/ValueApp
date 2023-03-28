part of 'path_bloc.dart';

abstract class PathState {}

class PathInitial extends PathState {}

class LanguageChangeState extends PathState {
  LanguageChangeState();
}
