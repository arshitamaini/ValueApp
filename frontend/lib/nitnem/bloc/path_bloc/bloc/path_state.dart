part of 'path_bloc.dart';

abstract class PathState {}

class PathInitial extends PathState {}

class LanguageChangeState extends PathState {
  String content;
   String language;
  LanguageChangeState({required this.content, required this.language});
}
