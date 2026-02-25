import 'package:doctorpoint/core/constants/app_colors.dart';
import 'package:doctorpoint/core/theme/theme_cubit.dart';
import 'package:doctorpoint/core/widgets/dp_button.dart';
import 'package:doctorpoint/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ListView(children: [
      Container(padding: const EdgeInsets.fromLTRB(16, 50, 16, 16), decoration: const BoxDecoration(gradient: LinearGradient(colors: [AppColors.primary, AppColors.primaryLight])), child: const ListTile(leading: CircleAvatar(child: Text('AF')), title: Text('Awa Fall', style: TextStyle(color: Colors.white)), subtitle: Text('admin@doctorpoint.sn', style: TextStyle(color: Colors.white70)), trailing: Icon(Icons.edit, color: Colors.white))),
      BlocBuilder<ThemeCubit, ThemeMode>(builder: (_, mode) => SwitchListTile(title: const Text('Mode sombre'), value: mode == ThemeMode.dark, onChanged: (_) => context.read<ThemeCubit>().toggleTheme())),
      ListTile(title: const Text('Langue'), onTap: () => showModalBottomSheet(context: context, builder: (_) => const Wrap(children: [ListTile(title: Text('Français')), ListTile(title: Text('English')), ListTile(title: Text('Wolof'))]))),
      const SwitchListTile(title: Text('Notifications push'), value: true, onChanged: null),
      const ListTile(title: Text('Modifier profil')),
      const ListTile(title: Text('Changer mot de passe')),
      const ListTile(title: Text('Authentification 2 facteurs')),
      const ListTile(title: Text('Appareils connectés')),
      const ListTile(title: Text('Version app: 1.0.0')),
      const ListTile(title: Text('Aide FAQ')),
      const ListTile(title: Text('CGU')),
      const ListTile(title: Text('Confidentialité')),
      Padding(padding: const EdgeInsets.all(16), child: DPButton(label: 'Déconnexion', variant: DPButtonVariant.outlined, onPressed: () => showDialog(context: context, builder: (_) => AlertDialog(title: const Text('Confirmation'), content: const Text('Se déconnecter ?'), actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text('Non')), TextButton(onPressed: () { context.read<AuthBloc>().add(LogoutRequested()); context.go('/login'); }, child: const Text('Oui'))])))),
    ]));
  }
}
