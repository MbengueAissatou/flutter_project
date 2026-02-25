import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:doctorpoint/core/error/failures.dart';
import 'package:doctorpoint/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:doctorpoint/features/auth/data/models/user_model.dart';
import 'package:doctorpoint/features/auth/domain/entities/user.dart';
import 'package:doctorpoint/features/auth/domain/repositories/auth_repository.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remote;
  final FlutterSecureStorage storage;

  AuthRepositoryImpl(this.remote, this.storage);

  @override
  Future<Either<Failure, User>> login(String email, String password) async {
    try {
      final json = await remote.login(email, password);
      await storage.write(key: 'access_token', value: json['access_token']);
      await storage.write(key: 'refresh_token', value: json['refresh_token']);
      return Right(UserModel.fromJson(json['user']).toEntity());
    } on TimeoutException {
      return const Left(NetworkFailure('Pas de réseau'));
    } catch (_) {
      return const Left(AuthFailure('Identifiants incorrects'));
    }
  }

  @override
  Future<Either<Failure, User>> register(String name, String email, String password, String role) async {
    try {
      final json = await remote.register(name, email, password, role);
      await storage.write(key: 'access_token', value: json['access_token']);
      await storage.write(key: 'refresh_token', value: json['refresh_token']);
      return Right(UserModel.fromJson(json['user']).toEntity());
    } catch (_) {
      return const Left(ServerFailure('Erreur inscription'));
    }
  }

  @override
  Future<Either<Failure, Unit>> forgotPassword(String email) async {
    try {
      await remote.forgotPassword(email);
      return const Right(unit);
    } catch (_) {
      return const Left(ServerFailure('Erreur mot de passe oublié'));
    }
  }

  @override
  Future<void> logout() async {
    await storage.delete(key: 'access_token');
    await storage.delete(key: 'refresh_token');
  }

  @override
  Future<bool> hasToken() async => (await storage.read(key: 'access_token')) != null;
}
