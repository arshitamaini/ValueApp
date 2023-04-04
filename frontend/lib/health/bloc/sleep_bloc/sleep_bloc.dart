import 'package:flutter_bloc/flutter_bloc.dart';
part 'sleep_event.dart';
part 'sleep_state.dart';

class SleepBloc extends Bloc<SleepEvent, SleepState> {
  SleepBloc() : super(SleepInitial()) {
    on<SelectdateEvent>(_mapSelectDateEvent);
  }
  Future _mapSelectDateEvent(
      SelectdateEvent event, Emitter<SleepState> emit) async {
    emit(SelectDateState(index: event.index));
  }
}
