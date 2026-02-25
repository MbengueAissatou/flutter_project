import 'package:doctorpoint/core/network/dio_client.dart';
import 'package:doctorpoint/features/appointments/presentation/bloc/appointment_bloc.dart';
import 'package:doctorpoint/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:doctorpoint/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:doctorpoint/features/auth/domain/repositories/auth_repository.dart';
import 'package:doctorpoint/features/auth/domain/usecases/login_usecase.dart';
import 'package:doctorpoint/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:doctorpoint/features/doctors/presentation/bloc/doctor_bloc.dart';
import 'package:doctorpoint/features/patients/presentation/bloc/patient_bloc.dart';
import 'package:doctorpoint/features/stock/presentation/bloc/stock_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerLazySingleton(() => const FlutterSecureStorage());
  sl.registerLazySingleton(() => DioClient(sl()));
  sl.registerLazySingleton<AuthRemoteDataSource>(() => AuthRemoteDataSource());
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl(), sl()));
  sl.registerLazySingleton(() => LoginUseCase(sl()));

  sl.registerFactory(() => AuthBloc(loginUseCase: sl(), repository: sl()));
  sl.registerFactory(() => AppointmentBloc());
  sl.registerFactory(() => PatientBloc());
  sl.registerFactory(() => DoctorBloc());
  sl.registerFactory(() => StockBloc());
}
