part of 'path_bloc.dart';

abstract class PathEvent {}

class LanguageChangeEvent extends PathEvent {
  String content;
  String language;
  LanguageChangeEvent({required this.content, required this.language});
}
