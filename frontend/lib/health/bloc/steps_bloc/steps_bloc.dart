import 'package:flutter_bloc/flutter_bloc.dart';

part 'steps_event.dart';
part 'steps_state.dart';

class StepsBloc extends Bloc<StepsEvent, StepsState> {
  StepsBloc() : super(StepsInitial()) {
    on<SelectdateEvent>(_mapSelectDateEvent);
  }
  Future _mapSelectDateEvent(
      SelectdateEvent event, Emitter<StepsState> emit) async {
    emit(SelectDateState(index: event.index));
  }
}
