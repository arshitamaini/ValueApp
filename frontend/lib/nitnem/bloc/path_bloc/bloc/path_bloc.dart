import 'package:flutter_bloc/flutter_bloc.dart';

part 'path_event.dart';
part 'path_state.dart';

class PathBloc extends Bloc<PathEvent, PathState> {
  PathBloc() : super(PathInitial()) {
    on<LanguageChangeEvent>(_mapChangeLanguageEvent);
  }
  Future _mapChangeLanguageEvent(
      LanguageChangeEvent event, Emitter<PathState> emit) async {
    emit(LanguageChangeState(content: event.content, language: event.language));
  }
}
