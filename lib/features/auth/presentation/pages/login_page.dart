import 'package:doctorpoint/core/widgets/widgets.dart';
import 'package:doctorpoint/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _email = TextEditingController(text: 'admin@doctorpoint.sn');
  final _password = TextEditingController(text: 'password123');
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is Authenticated) context.go('/dashboard');
          if (state is AuthError) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));
        },
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            DPTextField(label: 'Email', controller: _email, prefixIcon: Icons.email),
            const SizedBox(height: 12),
            DPTextField(label: 'Mot de passe', controller: _password, obscureText: _obscure, prefixIcon: Icons.lock, suffixIcon: IconButton(onPressed: () => setState(() => _obscure = !_obscure), icon: Icon(_obscure ? Icons.visibility : Icons.visibility_off))),
            Align(alignment: Alignment.centerRight, child: TextButton(onPressed: () => context.push('/forgot-password'), child: const Text('Mot de passe oublié ?'))),
            BlocBuilder<AuthBloc, AuthState>(builder: (_, state) => state is AuthLoading ? const DPLoading() : DPButton(label: 'Connexion', onPressed: () => context.read<AuthBloc>().add(LoginRequested(_email.text, _password.text)))),
            TextButton(onPressed: () => context.go('/register'), child: const Text('Créer un compte')),
          ]),
        ),
      ),
    );
  }
}
