import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../domain/usecases/login_usecase.dart';
import '../../domain/usecases/logout_usecase.dart';
import '../../domain/usecases/check_auth_status_usecase.dart';
import '../../../../shared/models/user_model.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase loginUseCase;
  final LogoutUseCase logoutUseCase;
  final CheckAuthStatusUseCase checkAuthStatusUseCase;

  AuthBloc({
    required this.loginUseCase,
    required this.logoutUseCase,
    required this.checkAuthStatusUseCase,
  }) : super(AuthInitial()) {
    on<AuthLoginRequested>(_onLoginRequested);
    on<AuthLogoutRequested>(_onLogoutRequested);
    on<AuthStatusChecked>(_onAuthStatusChecked);
    on<AuthTokenRefreshed>(_onTokenRefreshed);
  }

  Future<void> _onLoginRequested(
    AuthLoginRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    
    try {
      final result = await loginUseCase(LoginParams(
        email: event.email,
        password: event.password,
      ));

      result.fold(
        (failure) => emit(AuthFailure(failure.message)),
        (authResponse) => emit(AuthSuccess(authResponse)),
      );
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> _onLogoutRequested(
    AuthLogoutRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    
    try {
      final result = await logoutUseCase(NoParams());

      result.fold(
        (failure) => emit(AuthFailure(failure.message)),
        (_) => emit(AuthInitial()),
      );
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> _onAuthStatusChecked(
    AuthStatusChecked event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    
    try {
      final result = await checkAuthStatusUseCase(NoParams());

      result.fold(
        (failure) => emit(AuthInitial()),
        (user) => emit(AuthSuccess(AuthResponse(
          token: '',
          refreshToken: '',
          user: user,
          expiresAt: DateTime.now().add(const Duration(hours: 24)),
        ))),
      );
    } catch (e) {
      emit(AuthInitial());
    }
  }

  Future<void> _onTokenRefreshed(
    AuthTokenRefreshed event,
    Emitter<AuthState> emit,
  ) async {
    // Implement token refresh logic
    emit(AuthLoading());
    
    try {
      // Token refresh implementation
      emit(AuthSuccess(event.authResponse));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }
}
