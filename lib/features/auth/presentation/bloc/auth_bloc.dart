import 'package:dartz/dartz.dart';
import 'package:doctorpoint/core/error/failures.dart';
import 'package:doctorpoint/features/auth/domain/entities/user.dart';
import 'package:doctorpoint/features/auth/domain/repositories/auth_repository.dart';
import 'package:doctorpoint/features/auth/domain/usecases/login_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase loginUseCase;
  final AuthRepository repository;

  AuthBloc({required this.loginUseCase, required this.repository}) : super(AuthInitial()) {
    on<LoginRequested>((event, emit) async {
      emit(AuthLoading());
      final result = await loginUseCase(event.email, event.password);
      result.fold((failure) => emit(AuthError(failure.message)), (user) => emit(Authenticated(user)));
    });

    on<RegisterRequested>((event, emit) async {
      emit(AuthLoading());
      final result = await repository.register(event.name, event.email, event.password, event.role);
      result.fold((failure) => emit(AuthError(failure.message)), (user) => emit(Authenticated(user)));
    });

    on<ForgotPasswordRequested>((event, emit) async {
      emit(AuthLoading());
      final result = await repository.forgotPassword(event.email);
      result.fold((failure) => emit(AuthError(failure.message)), (_) => emit(ForgotPasswordSuccess()));
    });

    on<LogoutRequested>((event, emit) async {
      await repository.logout();
      emit(Unauthenticated());
    });
  }
}
