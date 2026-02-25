import 'package:doctorpoint/features/appointments/presentation/pages/appointment_detail_page.dart';
import 'package:doctorpoint/features/appointments/presentation/pages/appointments_page.dart';
import 'package:doctorpoint/features/appointments/presentation/pages/create_appointment_page.dart';
import 'package:doctorpoint/features/auth/presentation/pages/forgot_password_page.dart';
import 'package:doctorpoint/features/auth/presentation/pages/login_page.dart';
import 'package:doctorpoint/features/auth/presentation/pages/register_page.dart';
import 'package:doctorpoint/features/auth/presentation/pages/splash_page.dart';
import 'package:doctorpoint/features/consultations/presentation/pages/consultation_detail_page.dart';
import 'package:doctorpoint/features/consultations/presentation/pages/consultations_page.dart';
import 'package:doctorpoint/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:doctorpoint/features/doctors/presentation/pages/doctor_detail_page.dart';
import 'package:doctorpoint/features/doctors/presentation/pages/doctors_page.dart';
import 'package:doctorpoint/features/notifications/presentation/pages/notifications_page.dart';
import 'package:doctorpoint/features/patients/presentation/pages/create_patient_page.dart';
import 'package:doctorpoint/features/patients/presentation/pages/patient_detail_page.dart';
import 'package:doctorpoint/features/patients/presentation/pages/patients_page.dart';
import 'package:doctorpoint/features/settings/presentation/pages/settings_page.dart';
import 'package:doctorpoint/features/stock/presentation/pages/add_stock_item_page.dart';
import 'package:doctorpoint/features/stock/presentation/pages/stock_page.dart';
import 'package:doctorpoint/injection_container.dart';
import 'package:doctorpoint/features/auth/domain/repositories/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: '/splash',
  redirect: (context, state) async {
    final hasToken = await sl<AuthRepository>().hasToken();
    final isPublic = ['/splash', '/login', '/register', '/forgot-password'].contains(state.matchedLocation);
    if (!hasToken && !isPublic) return '/login';
    if (hasToken && isPublic && state.matchedLocation != '/splash') return '/dashboard';
    return null;
  },
  routes: [
    GoRoute(path: '/splash', builder: (_, __) => const SplashPage()),
    GoRoute(path: '/login', builder: (_, __) => const LoginPage()),
    GoRoute(path: '/register', builder: (_, __) => const RegisterPage()),
    GoRoute(path: '/forgot-password', builder: (_, __) => const ForgotPasswordPage()),
    ShellRoute(
      builder: (context, state, child) => MainShell(child: child),
      routes: [
        GoRoute(path: '/dashboard', builder: (_, __) => DashboardPage()),
        GoRoute(path: '/appointments', builder: (_, __) => const AppointmentsPage()),
        GoRoute(path: '/patients', builder: (_, __) => const PatientsPage()),
        GoRoute(path: '/doctors', builder: (_, __) => const DoctorsPage()),
        GoRoute(path: '/consultations', builder: (_, __) => const ConsultationsPage()),
        GoRoute(path: '/stock', builder: (_, __) => const StockPage()),
        GoRoute(path: '/notifications', builder: (_, __) => const NotificationsPage()),
        GoRoute(path: '/settings', builder: (_, __) => const SettingsPage()),
      ],
    ),
    GoRoute(path: '/appointments/create', builder: (_, __) => const CreateAppointmentPage()),
    GoRoute(path: '/appointments/:id', builder: (_, s) => AppointmentDetailPage(id: s.pathParameters['id']!)),
    GoRoute(path: '/patients/create', builder: (_, __) => const CreatePatientPage()),
    GoRoute(path: '/patients/:id', builder: (_, s) => PatientDetailPage(id: s.pathParameters['id']!)),
    GoRoute(path: '/doctors/:id', builder: (_, s) => DoctorDetailPage(id: s.pathParameters['id']!)),
    GoRoute(path: '/consultations/:id', builder: (_, s) => ConsultationDetailPage(id: s.pathParameters['id']!)),
    GoRoute(path: '/stock/add', builder: (_, __) => const AddStockItemPage()),
  ],
);

class MainShell extends StatelessWidget {
  final Widget child;
  const MainShell({super.key, required this.child});

  int _index(String location) {
    if (location.startsWith('/dashboard')) return 0;
    if (location.startsWith('/appointments')) return 1;
    if (location.startsWith('/patients')) return 2;
    if (location.startsWith('/doctors')) return 3;
    return 4;
  }

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).matchedLocation;
    return Scaffold(
      body: child,
      bottomNavigationBar: NavigationBar(
        selectedIndex: _index(location),
        indicatorColor: Theme.of(context).colorScheme.primaryContainer,
        onDestinationSelected: (i) {
          const routes = ['/dashboard', '/appointments', '/patients', '/doctors', '/settings'];
          context.go(routes[i]);
        },
        destinations: const [
          NavigationDestination(icon: Icon(Icons.dashboard), label: 'Dashboard'),
          NavigationDestination(icon: Icon(Icons.calendar_month), label: 'RDV'),
          NavigationDestination(icon: Icon(Icons.people), label: 'Patients'),
          NavigationDestination(icon: Icon(Icons.local_hospital), label: 'Médecins'),
          NavigationDestination(icon: Icon(Icons.settings), label: 'Paramètres'),
        ],
      ),
    );
  }
}
