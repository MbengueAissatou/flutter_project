import 'package:doctorpoint/core/widgets/widgets.dart';
import 'package:doctorpoint/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPasswordPage extends StatefulWidget { const ForgotPasswordPage({super.key}); @override State<ForgotPasswordPage> createState() => _ForgotPasswordPageState(); }
class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text('Mot de passe oublié')), body: BlocListener<AuthBloc, AuthState>(
      listener: (_, state) { if (state is ForgotPasswordSuccess) showDialog(context: context, builder: (_) => const AlertDialog(title: Text('Succès'), content: Text('Email de réinitialisation envoyé'))); },
      child: Padding(padding: const EdgeInsets.all(16), child: Column(children: [DPTextField(label: 'Email', controller: _email), const SizedBox(height: 10), DPButton(label: 'Envoyer', onPressed: () => context.read<AuthBloc>().add(ForgotPasswordRequested(_email.text)))])),
    ));
  }
}
