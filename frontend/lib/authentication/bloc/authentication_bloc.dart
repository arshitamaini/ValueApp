import 'package:flutter_bloc/flutter_bloc.dart';
part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationInitial()) {
    on<LoginWithPhoneNumberAndPasswordEvent>(
        _mapLoginWithPhoneNumberAndPasswordEvent);
    on<CreateAccountEvent>(_mapCreateAccountEvent);
  }

  Future<void> _mapLoginWithPhoneNumberAndPasswordEvent(
    LoginWithPhoneNumberAndPasswordEvent event,
    Emitter<AuthenticationState> emit,
  ) async {
    try {} catch (e) {}
  }

  Future<void> _mapCreateAccountEvent(
    CreateAccountEvent event,
    Emitter<AuthenticationState> emit,
  ) async {
    try {} catch (e) {}
  }
}
