import 'package:dartz/dartz.dart';
import 'package:doctorpoint/core/error/failures.dart';
import 'package:doctorpoint/features/auth/domain/entities/user.dart';

abstract class AuthRepository {
  Future<Either<Failure, User>> login(String email, String password);
  Future<Either<Failure, User>> register(String name, String email, String password, String role);
  Future<Either<Failure, Unit>> forgotPassword(String email);
  Future<void> logout();
  Future<bool> hasToken();
}
