import 'package:doctorpoint/injection_container.dart';
import 'package:doctorpoint/features/auth/domain/repositories/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 1200), () async {
      final hasToken = await sl<AuthRepository>().hasToken();
      if (mounted) context.go(hasToken ? '/dashboard' : '/login');
    });
  }

  @override
  Widget build(BuildContext context) => const Scaffold(body: Center(child: Text('DoctorPoint', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold))));
}
