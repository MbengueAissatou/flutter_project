import 'package:doctorpoint/core/widgets/widgets.dart';
import 'package:flutter/material.dart';

class CreatePatientPage extends StatelessWidget {
  const CreatePatientPage({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text('Créer patient')), body: ListView(padding: const EdgeInsets.all(16), children: [const DPTextField(label: 'Prénom'), const SizedBox(height: 8), const DPTextField(label: 'Nom'), const SizedBox(height: 8), const DPTextField(label: 'Email'), const SizedBox(height: 8), const DPTextField(label: 'Téléphone'), const SizedBox(height: 8), const DPTextField(label: 'Date de naissance'), const SizedBox(height: 8), DropdownButtonFormField(items: const [DropdownMenuItem(value: 'F', child: Text('F')), DropdownMenuItem(value: 'M', child: Text('M'))], onChanged: (_) {}, decoration: const InputDecoration(labelText: 'Genre')), const SizedBox(height: 8), DropdownButtonFormField(items: const [DropdownMenuItem(value: 'O+', child: Text('O+')), DropdownMenuItem(value: 'A+', child: Text('A+'))], onChanged: (_) {}, decoration: const InputDecoration(labelText: 'Groupe sanguin')), const SizedBox(height: 16), DPButton(label: 'Enregistrer', onPressed: () => Navigator.pop(context))]));
}
