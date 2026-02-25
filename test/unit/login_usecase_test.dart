import 'package:dartz/dartz.dart';
import 'package:doctorpoint/core/error/failures.dart';
import 'package:doctorpoint/features/auth/domain/entities/user.dart';
import 'package:doctorpoint/features/auth/domain/repositories/auth_repository.dart';
import 'package:doctorpoint/features/auth/domain/usecases/login_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  late LoginUseCase usecase;
  late MockAuthRepository repository;

  setUp(() {
    repository = MockAuthRepository();
    usecase = LoginUseCase(repository);
  });

  test('Retourne Right(User) si login réussit', () async {
    const user = User(id: '1', name: 'Awa', email: 'a@a.com', role: 'admin');
    when(() => repository.login('a@a.com', 'password123')).thenAnswer((_) async => const Right(user));

    final result = await usecase('a@a.com', 'password123');

    expect(result, const Right(user));
  });

  test('Retourne Left(AuthFailure) si identifiants incorrects', () async {
    when(() => repository.login('a@a.com', 'bad')).thenAnswer((_) async => const Left(AuthFailure('Identifiants incorrects')));

    final result = await usecase('a@a.com', 'bad');

    expect(result, const Left(AuthFailure('Identifiants incorrects')));
  });

  test('Retourne Left(NetworkFailure) si pas de réseau', () async {
    when(() => repository.login('a@a.com', 'password123')).thenAnswer((_) async => const Left(NetworkFailure('Pas de réseau')));

    final result = await usecase('a@a.com', 'password123');

    expect(result, const Left(NetworkFailure('Pas de réseau')));
  });
}
