import 'package:doctorpoint/core/constants/app_colors.dart';
import 'package:doctorpoint/core/widgets/widgets.dart';
import 'package:doctorpoint/shared/mock_data.dart';
import 'package:flutter/material.dart';

class PatientDetailPage extends StatelessWidget {
  final String id;
  const PatientDetailPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final patient = mockPatients.firstWhere((e) => e.id == id);
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(onPressed: () {}, label: const Text('Nouveau RDV')),
      body: CustomScrollView(slivers: [
        SliverAppBar(expandedHeight: 220, pinned: true, flexibleSpace: FlexibleSpaceBar(background: Container(decoration: const BoxDecoration(gradient: LinearGradient(colors: [AppColors.primary, AppColors.primaryLight])), child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [DPAvatar(initials: patient.initials, size: 80), const SizedBox(height: 8), Text(patient.fullName, style: const TextStyle(color: Colors.white, fontSize: 22)), Text(patient.id, style: const TextStyle(color: Colors.white70))])))),
        SliverToBoxAdapter(child: Padding(padding: const EdgeInsets.all(16), child: Column(children: [
          Card(child: ListTile(title: const Text('Informations personnelles'), subtitle: Text('${patient.age} ans • ${patient.gender}\n${patient.phone}\n${patient.email}\nSang: ${patient.bloodType}'))),
          Card(child: ListTile(title: const Text('Informations médicales'), subtitle: Text('Allergies: ${patient.allergies.join(', ')}\nMaladies: ${patient.chronicDiseases.join(', ')}\nAssurance: ${patient.insuranceId}'))),
          const Card(child: ListTile(title: Text('Historique consultations'), subtitle: Text('Hypertension - Dr. Fatou Ndiaye\n03/06/2026\n\nDiabète - Dr. Moussa Diop\n28/05/2026'))),
        ]))),
      ]),
    );
  }
}
