import 'package:doctorpoint/core/widgets/widgets.dart';
import 'package:doctorpoint/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class RegisterPage extends StatefulWidget { const RegisterPage({super.key}); @override State<RegisterPage> createState() => _RegisterPageState(); }
class _RegisterPageState extends State<RegisterPage> {
  final _name = TextEditingController(); final _email = TextEditingController(); final _password = TextEditingController(); final _confirm = TextEditingController(); String _role = 'patient';
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text('Inscription')), body: SingleChildScrollView(padding: const EdgeInsets.all(16), child: Column(children: [
      DPTextField(label: 'Nom', controller: _name), const SizedBox(height: 8), DPTextField(label: 'Email', controller: _email), const SizedBox(height: 8), DPTextField(label: 'Mot de passe', controller: _password, obscureText: true), const SizedBox(height: 8), DPTextField(label: 'Confirmer', controller: _confirm, obscureText: true), const SizedBox(height: 8),
      Row(children: ['patient', 'doctor', 'admin'].map((r) => Expanded(child: Card(child: RadioListTile(value: r, groupValue: _role, onChanged: (v) => setState(() => _role = v!), title: Text(r))))).toList()),
      DPButton(label: 'Créer le compte', onPressed: () => context.read<AuthBloc>().add(RegisterRequested(_name.text, _email.text, _password.text, _role))),
      TextButton(onPressed: () => context.go('/login'), child: const Text('Déjà inscrit ? Connexion')),
    ])));
  }
}
