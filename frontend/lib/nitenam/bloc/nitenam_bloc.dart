import 'package:flutter_bloc/flutter_bloc.dart';

part 'nitenam_state.dart';
part 'nitenam_event.dart';

class NitenamBloc extends Bloc<NitenamEvent, NitenamState> {
  NitenamBloc(super.initialState);
}
