import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:doctorpoint/core/error/failures.dart';
import 'package:doctorpoint/features/auth/domain/entities/user.dart';
import 'package:doctorpoint/features/auth/domain/repositories/auth_repository.dart';
import 'package:doctorpoint/features/auth/domain/usecases/login_usecase.dart';
import 'package:doctorpoint/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  late MockAuthRepository repository;
  late LoginUseCase loginUseCase;

  setUp(() {
    repository = MockAuthRepository();
    loginUseCase = LoginUseCase(repository);
    when(() => repository.logout()).thenAnswer((_) async {});
  });

  const user = User(id: '1', name: 'Awa', email: 'a@a.com', role: 'admin');

  blocTest<AuthBloc, AuthState>(
    'LoginRequested → [Loading, Authenticated] si succès',
    build: () {
      when(() => repository.login('a@a.com', 'password123')).thenAnswer((_) async => const Right(user));
      return AuthBloc(loginUseCase: loginUseCase, repository: repository);
    },
    act: (bloc) => bloc.add(const LoginRequested('a@a.com', 'password123')),
    expect: () => [AuthLoading(), const Authenticated(user)],
  );

  blocTest<AuthBloc, AuthState>(
    'LoginRequested → [Loading, Error] si échec',
    build: () {
      when(() => repository.login('a@a.com', 'bad')).thenAnswer((_) async => const Left(AuthFailure('Identifiants incorrects')));
      return AuthBloc(loginUseCase: loginUseCase, repository: repository);
    },
    act: (bloc) => bloc.add(const LoginRequested('a@a.com', 'bad')),
    expect: () => [AuthLoading(), const AuthError('Identifiants incorrects')],
  );

  blocTest<AuthBloc, AuthState>(
    'LoginRequested → [Loading, Error] si pas réseau',
    build: () {
      when(() => repository.login('a@a.com', 'password123')).thenAnswer((_) async => const Left(NetworkFailure('Pas de réseau')));
      return AuthBloc(loginUseCase: loginUseCase, repository: repository);
    },
    act: (bloc) => bloc.add(const LoginRequested('a@a.com', 'password123')),
    expect: () => [AuthLoading(), const AuthError('Pas de réseau')],
  );

  blocTest<AuthBloc, AuthState>(
    'ForgotPasswordRequested → [Loading, ForgotPasswordSuccess]',
    build: () {
      when(() => repository.forgotPassword('a@a.com')).thenAnswer((_) async => const Right(unit));
      return AuthBloc(loginUseCase: loginUseCase, repository: repository);
    },
    act: (bloc) => bloc.add(const ForgotPasswordRequested('a@a.com')),
    expect: () => [AuthLoading(), ForgotPasswordSuccess()],
  );
}
