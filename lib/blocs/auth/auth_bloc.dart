import 'package:flutter_bloc/flutter_bloc.dart';

import '/repositories/repositories.dart';
import 'auth.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository = AuthRepository();

  AuthBloc() : super(AuthInitial()) {
    on<LoginRequested>((event, emit) async {
      emit(AuthLoading());
      try {
        final isAuthenticated = await _authRepository.login(
          event.username,
          event.password,
        );
        if (isAuthenticated) {
          emit(AuthSuccess());
        } else {
          emit(AuthFailure(message: 'Invalid username or password'));
        }
      } catch (e) {
        emit(AuthFailure(message: e.toString()));
      }
    });
  }
}
