import 'package:dartz/dartz.dart';
import 'package:doctorpoint/core/error/failures.dart';
import 'package:doctorpoint/features/auth/domain/entities/user.dart';
import 'package:doctorpoint/features/auth/domain/repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository repository;
  LoginUseCase(this.repository);

  Future<Either<Failure, User>> call(String email, String password) {
    return repository.login(email, password);
  }
}
