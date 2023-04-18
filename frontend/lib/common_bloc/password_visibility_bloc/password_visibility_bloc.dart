import 'package:flutter_bloc/flutter_bloc.dart';
part 'password_visibility_event.dart';
part 'password_visibility_state.dart';

class PasswordVisibilityBloc
    extends Bloc<PasswordVisibilityEvent, PasswordVisibilityState> {
  PasswordVisibilityBloc() : super(PasswordVisibilityInitial()) {
    on<ChangePasswordVisibilityEvent>(_mapChangePasswordVisibilityEvent);
  }
  Future<void> _mapChangePasswordVisibilityEvent(
      ChangePasswordVisibilityEvent event,
      Emitter<PasswordVisibilityState> emit) async {
    event.isVisible = !event.isVisible;
    emit(ChangePasswordVisibilityState(isVisible: event.isVisible));
  }
}
