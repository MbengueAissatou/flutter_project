import 'package:doctorpoint/app_router.dart';
import 'package:doctorpoint/core/theme/app_theme.dart';
import 'package:doctorpoint/core/theme/theme_cubit.dart';
import 'package:doctorpoint/features/appointments/presentation/bloc/appointment_bloc.dart';
import 'package:doctorpoint/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:doctorpoint/features/doctors/presentation/bloc/doctor_bloc.dart';
import 'package:doctorpoint/features/patients/presentation/bloc/patient_bloc.dart';
import 'package:doctorpoint/features/stock/presentation/bloc/stock_bloc.dart';
import 'package:doctorpoint/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoctorPointApp extends StatelessWidget {
  const DoctorPointApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ThemeCubit()..loadTheme()),
        BlocProvider(create: (_) => sl<AuthBloc>()),
        BlocProvider(create: (_) => sl<AppointmentBloc>()),
        BlocProvider(create: (_) => sl<PatientBloc>()),
        BlocProvider(create: (_) => sl<DoctorBloc>()),
        BlocProvider(create: (_) => sl<StockBloc>()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (_, mode) => MaterialApp.router(
          title: 'DoctorPoint',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: mode,
          routerConfig: router,
        ),
      ),
    );
  }
}
