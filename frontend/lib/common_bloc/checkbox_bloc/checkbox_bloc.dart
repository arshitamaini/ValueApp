import 'package:flutter_bloc/flutter_bloc.dart';

part 'checkbox_event.dart';
part 'checkbox_state.dart';

class CheckboxBloc extends Bloc<CheckboxEvent, CheckboxState> {
  CheckboxBloc() : super(CheckboxInitial()) {
    on<CheckboxClickEvent>(_mapCheckboxClickEvent);
  }
  Future<void> _mapCheckboxClickEvent(
      CheckboxClickEvent event, Emitter<CheckboxState> emit) async {
    emit(CheckboxInitial());
    event.taskCheckList[event.index] = !event.taskCheckList[event.index];
    emit(CheckboxClickState(taskCheckList: event.taskCheckList));
  }
}
